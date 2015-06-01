var express = require('express');
var co = require('co');
var thunkify = require('thunkify');
var router = express.Router();
var common = require('../model/common');
var projectModel = require('../model/projectModel');
var simpleProjectModel = require('../model/SimpleProjectModel');
var freeProjectModel = require('../model/freeProjectModel');
var category = require('../model/category');
var discussModel = require('../model/discussModel');
var fundingModel = require('../model/fundingModel');
var officialProjectModel = require('../model/officialProjectModel');
var memberModel = require('../model/memberModel');

function validToken(req, res, next) {
    var db = req.db;
    var userToken = req.query.token;//获取url中的token
    db.getConnection(function (err, conn) {//获得数据库连接
        if (err) {
            sendData(req, res, next,  err);
        } else {
            conn.query('SELECT * FROM user WHERE user_token = ' + userToken + '', function (err, row) {//验证token
                if (err) {
                    sendData(req, res, next,  err);
                } else {
                    if (row.length == 0) {
                        sendData(req, res, next,  "请登录");//若无效,返回错误信息
                    } else {
                        next();//若有效，则继续执行
                    }
                }
            })
        }
    })
}
//出错时返回一个data对象
function sendData(req, res, next, message) {
    var data = {
        message: "", //出错信息
        status: false //状态
    };
    data.message = message;
    res.send({"data": data});
}
//获取项目的评论
function getDiscuss(req, res, callback) {
    var db = req.db;
    var id = req.query.id;
    var comment;
    var discuss = [];
    db.getConnection(function (err, conn) {
        conn.query('SELECT * FROM comment_info WHERE project_id = ' + id + ' ORDER BY createTime desc', function (err, rows) {
            if (err) sendData(req, res, "",  err);
            else {
                if (rows.length == 0) discuss = [];
                else {
                    for (var i in rows) {
                        comment = new discussModel(rows[i].userId, rows[i].userName, rows[i].content, common.makeDate(rows[i].createTime));
                        discuss.push(comment);
                    }
                }
                callback(discuss);
            }

        })

    })

}
//得到所有状态为已立项、进行中、已结项（学校项目），报名中、进行中、已结束（自创项目）的简短信息（id,name,category,creator,status）
router.get('/', function (req, res, next) {
    var db = req.db;
    var result = [];
    var simpleProject;
    var data = {
        status: false,
        message: ""
    };

    db.getConnection(function (err, conn) {
        if (err)  sendData(req, res, next,  err);
        else {
            //取出所有项目简短信息
            conn.query('SELECT projectId as id,projectName as name,categoryName as category,projectStatus as status, creatorName as creator, startTime,endTime FROM project_info WHERE projectStatus in (3,4,6,7,8,9) ORDER BY startTime desc', function (err, rows) {
                if (err) {
                    sendData(req, res, next,  err);
                } else {
                    for (var i in rows) {
                        //新建project对象
                        simpleProject = new simpleProjectModel(rows[i].id, rows[i].name, rows[i].category, rows[i].creator, common.makeDate(rows[i].startTime), common.makeDate(rows[i].endTime), rows[i].status);
                        result.push(simpleProject);
                    }
                    conn.release();
                    res.send(result);

                }
            })
        }
    })
});

//根据id返回项目详细信息，自创与学校项目返回的不同
router.get('/detail', function (req, res, next) {
    var db = req.db;
    var id = req.query.id;
    var freeProject;
    var funding;
    var officialProject;
    var allFunding = [];
    var member = function member(id, name) {
        this.name = name;
        this.id = id;
    }
    var allCrowfunding = {
        planMoney: 0,
        realMoney: 0,
        people: 0,
        crowfunding: []
    }
    var mainMember;
    var member = [];
    var teacher;
    //根据id判断是否为自创项目
    db.getConnection(function (err, conn) {
        if (err) sendData(req, res, next,  err);
        else {
            conn.query('SELECT categoryId FROM project_info WHERE projectId = ' + id + '', function (err, raw) {
                if (err) sendData(req, res, next,  err);
                else {
                    if (raw.length == 0) sendData(req, res, next,  "该项目id不存在");
                    else {
                        var category = raw[0].categoryId;
                        if (category == 4) {//说明是自创项目
                            conn.query('SELECT projectName,categoryName,startTime,endTime,funding,creatorName,people,content,projectStatus,planmoney FROM project_info WHERE projectId = ' + id + '', function (err, raw) {
                                if (err) sendData(req, res, next,  err);
                                else {
                                    var free = raw[0];
                                    freeProject = new freeProjectModel(id, free.projectName, free.categoryName, 1, common.makeDate(free.startTime), common.makeDate(free.endTime), free.funding, free.creatorName, free.people, free.content, [], {}, free.projectStatus);
                                    //根据id获取项目的评论
                                    getDiscuss(req, res, function (discuss) {
                                        freeProject.setDiscuss(discuss);
                                        if (free.funding == 1) {//1说明是众筹项目
                                            allCrowfunding.planMoney = free.planmoney;
                                            //根据id获取众筹信息
                                            conn.query('SELECT userId,userName,content,money FROM funding_info WHERE projectId = ' + id + '', function (err, rows) {
                                                if (err) sendData(req, res, next,  err);
                                                else {
                                                    for (var i in rows) {
                                                        funding = new fundingModel(rows[i].userId, rows[i].userName, rows[i].content, rows[i].money);
                                                        allFunding.push(funding);

                                                    }
                                                    allCrowfunding.crowfunding = allFunding;
                                                    conn.query('select count(DISTINCT userId) as people, (case when sum(money) is null then 0 else sum(money) end) as realmoney from funding_info where projectId = ' + id + '', function (err, row) {
                                                        if (err) sendData(req, res, next,  err);
                                                        else {
                                                            allCrowfunding.people = row[0].people;
                                                            allCrowfunding.realMoney = row[0].realmoney;
                                                            freeProject.setAllCrowdfunding(allCrowfunding);
                                                        }
                                                        conn.release();
                                                        res.send(freeProject);
                                                    })

                                                }
                                            })
                                        } else {
                                            conn.release();
                                            res.send(freeProject);
                                        }
                                    });
                                }
                            })
                        } else {//说明是正式项目
                            conn.query('SELECT projectName,categoryName,creatorName,content,people,startTime,endTime,source,aid,background,innovation,plan,prospect' +
                            ' budget,resourcerequired ,projectStatus FROM project_info WHERE projectId = ' + id + '', function (err, row) {
                                if (err) sendData(req, res, next,  err);
                                else {
                                    if (row.length == 0) sendData(req, res, next,  err);
                                    else {
                                        var o = row[0];
                                        officialProject = new officialProjectModel(id, o.projectName, o.categoryName, 2, o.creatorName, o.content, o.people, common.makeDate(o.startTime), common.makeDate(o.endTime), [], o.source, o.aid, o.background, o.innovation, o.plan, o.prospect, o.budget, o.resourcerequired, [], "", {}, o.projectStatus);
                                        getDiscuss(req, res, function (discuss) {
                                            officialProject.setDiscuss(discuss);
                                            conn.query('SELECT * from member_info WHERE projectId = ' + id + '', function (err, rows) {
                                                if (err) sendData(req, res, next,  err);
                                                else {
                                                    for (var i in rows) {
                                                        var projectMember = new memberModel(rows[i].userId, rows[i].userName);
                                                        if (rows[i].role == 1) {
                                                            officialProject.setMainMember(projectMember);
                                                        } else if (rows[i].role == 2) {
                                                            officialProject.setTeacher(rows[i].userName);
                                                        }
                                                        else {
                                                            member.push(projectMember);
                                                        }
                                                    }
                                                    officialProject.setMember(member);
                                                    conn.release();
                                                    res.send(officialProject);
                                                }
                                            })
                                        })
                                    }
                                }
                            })
                        }
                    }
                }
            })
        }
    })
})

//得到用户在指定项目中的状态（0为未报名，1为审核中，2为审核通过，3为审核未通过）
router.get('/status', function (req, res, next) {
    var db = req.db;
    var projectId = req.query.id;
    var userToken = req.query.token;
    var data = {
        status: false,
        message: ""
    }
    var result = {
        status: 0
    }
    db.getConnection(function (err, conn) {
        if (err) {
            sendData(req, res, next, err);
        } else {
            conn.query('select * from user WHERE user_token ="' + userToken + '"', function (err, row) {
                if (err) {
                    sendData(req, res, next, err);
                } else {
                    if (row.length == 0) {//说明用户未登录
                        sendData(req, res, next,  "请登录");
                    } else {
                        var userId = row[0].user_id;
                        //判断项目是否为自创项目,只有自创项目才有状态
                        conn.query('SELECT categoryId from project_info WHERE projectId = ' + projectId + '', function (err, row) {
                            if (err) sendData(req, res, next, err);
                            else {
                                if (row.length == 0) {
                                    sendData(req, res, next, "该项目不存在");
                                } else {
                                    if (row[0].categoryId == 4) {
                                        conn.query('select project_member_status as status from project_member where user_id = ' + userId + ' and project_id = ' + projectId + ' ', function (err, row) {
                                            result.status = (row.length == 0) ? 0 : row[0].status;
                                            conn.release();
                                            res.send(result);
                                        })
                                    } else {
                                        sendData(req, res, next, "只有自创项目才有报名状态");
                                    }
                                }
                            }

                        })

                    }
                }
            })
        }
    })
});

//用于处理用户申请加入指定项目
router.post('/application', function (req, res, next) {
    var db = req.db;
    var token = req.query.token;//用户token
    var id = req.query.id;//申请项目id
    var userId;
    var applicationReason = req.query.text;//申请理由
    var data = {
        status: false,
        message: ""
    }
    db.getConnection(function (err, conn) {
        if (err)  sendData(req, res, next,  err);
        //根据token选出userId
        conn.query('SELECT id,role FROM user_info WHERE token ="' + token + '"', function (err, rows) {
            if (err) {
                sendData(req, res, next,  err);
            } else {
                userId = (rows.length == 0) ? -1 : rows[0].id;
                if (userId == -1) {
                    sendData(req, res, next,  "请登录");
                } else {
                    var role = rows[0].role;
                    if (role == 3 || role == 7) {
                        sendData(req, res, next,  "不是学生,不能报名");
                    } else {
                        //插入记录 ，默认用户角色为1（学生），用户状态为1（审核中）
                        conn.query('INSERT INTO  project_member (project_id,user_id,project_member_role,project_member_status,project_application_reason)' +
                        ' VALUES (' + id + ',' + userId + ', 0 , 1, "' + applicationReason + '");', function (err, rows) {
                            if (err) {
                                sendData(req, res, next,  err);
                            } else {
                                data.status = (rows.affectedRows == 1) ? true : false;
                                data.message = (rows.affectedRows == 1) ? "报名成功" : "报名失败";
                                res.send({'data': data});
                                conn.release();
                            }
                        });
                    }
                }
            }
        })
    })
})

//获取指定项目详情
router.get('/get-project', validToken, function (req, res) {
    var db = req.db;
    var userToken = req.query.token;
    var id = req.query.id;
    var project;
    var data = {
        status: false,
        message: ""
    }
    db.getConnection(function (err, conn) {
        if (err) sendData(req, res, next,  err);
        else {
            conn.query('SELECT projectId,projectName,categoryName,creatorName,people,content,projectStatus,memberStatus ' +
            'FROM project_user_info WHERE  projectId = ' + id + '', function (err, rows) {
                if (err) {
                    sendData(req, res, next,  err);
                } else {
                    project = new projectModel(rows[0].projectId, rows[0].projectName, rows[0].categoryName, rows[0].creatorName, rows[0].people,
                        rows[0].content, rows[0].projectStatus);
                    res.send(project);
                    conn.release();
                }
            })
        }
    })
})
//处理时间
function makeDate(date) {
    try {
        var newDate = new Date();
        newDate.setDate(date * 1000);
        return newDate.toISOString().replace(/T/, ' ').replace(/\..+/, '')
    } catch (e) {
        return "0000-00-00 00:00:00";
    }
}
//用户发起自创项目
router.post('/add-item-student', function (req, res, next) {
    var db = req.db;
    var project = new projectModel(0, req.query.name, req.query.category, 0, req.query.people, req.query.discribe, 7);
    var funding = req.query.funding;
    var planMoney = (funding == 1 ) ? req.query.planMoney : 0;
    var startTimeStamp = req.query.startTime;
    var endTimeStamp = req.query.endTime;
    var newDate = new Date();
    newDate.setTime(startTimeStamp);
    var startTime = newDate.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    newDate.setTime(endTimeStamp);
    var endTime = newDate.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    var userToken = req.query.token;
    var data = {
        status: false,
        message: ""
    }
    db.getConnection(function (err, conn) {
        if (err) sendData(req, res, next,  err);
        //根据token选出userId
        conn.query('SELECT user_id FROM user WHERE user_token ="' + userToken + '"', function (err, rows) {
            if (err) {
                sendData(req, res, next,  err);
            } else {
                if (rows.length == 0) {
                    sendData(req, res, next,  "请登录");
                } else {
                    var userId = rows[0].user_id;
                    project.setCreator(userId);
                    console.log(project.getPeople());
                    conn.query('INSERT INTO project (project_category_id,project_status,project_creator_id,project_name,project_describe,project_signup_max,project_start,project_end,project_funding,project_funding_planmoney) ' +
                    ' VALUES (4,' + project.getProjectStatus() + ',' + project.getCreator() + ',"' + project.getName() + '",' +
                    '"' + project.getContent() + '",' + project.getPeople() + ',"' + startTime + '","' + endTime + '",' + funding + ',' + planMoney + ')', function (err, row) {
                        if (err) {
                            sendData(req, res, next,  err);
                        } else {
                            data.message = (row.affectedRows == 1 ) ? "插入成功" : "插入失败";
                            data.status = (row.affectedRows == 1) ? true : false;
                            res.send({data: data});//若有错误返回false
                            conn.release();
                        }
                    })
                }
            }
        })
    })
});


//用户申报正式项目 @GGICE
router.post('/add-item-school', function (req, res, next) {

    var db = req.db;
    var userToken = req.body.token;
    var teacher = req.body.teacher || 'teacher1';

    var name = req.body.name || 'blank';
    var source = req.body.source || 1;
    var category = req.body.category || 1;
    var aid = req.body.aid || 'blank';
    var background = req.body.background || 'blank';
    var describe = req.body.describe || 'blank';
    var innovation = req.body.innovation || 'blank';
    var plan = req.body.plan || 'blank';
    var prospect = req.body.prospect || 'blank';
    var budget = req.body.budget || 'blank';
    var resourcerequired = req.body.resourcerequired || 'blank';
    var member = req.body.member || '[]';
    var mainMember = req.body.mainMember || '{}';
    var newDate = new Date();

    var startTimeStamp = req.body.startTime || 1430648492000;
    var endTimeStamp = req.body.endTime || 1430648592000;
    newDate.setTime(startTimeStamp);
    var startTime = newDate.toLocaleString().replace(/T/, ' ').replace(/\..+/, '');
    newDate.setTime(endTimeStamp);
    var endTime = newDate.toLocaleString().replace(/T/, ' ').replace(/\..+/, '');

    //member = JSON.parse(member);
    //mainMember = JSON.parse(mainMember);
    //var project = new officialProjectModel(0, name, category, 2, 0, describe, 0, startTime, endTime, [], source, aid, background,
    //    innovation, plan, prospect, budget, resourcerequired, member, teacher, mainMember, 0);

    mainMember = JSON.parse(mainMember);
    member = JSON.parse(member);

    console.log(userToken);
    console.log(member);
    console.log(mainMember);

    function onerror(err) {
        // log any uncaught errors
        // co will not throw any errors you do not handle!!!
        // HANDLE ALL YOUR ERRORS!!!
        console.error(err.stack);
        sendData(req, res, next, err.stack);
    }

    co(function *() {
        //should turn back TODO
        var isUser = yield db.query('SELECT user_id FROM user WHERE user_token ="' + userToken + '"');
        if (isUser[0].length === 0) {
            sendData(req, res, next, "请重新登录");
            return false;
        }

        console.log('isUser');

        var isTeacher = yield db.query('SELECT user_id FROM user WHERE user_fullname ="' + teacher + '"');
        if (isTeacher[0].length === 0) {
            sendData(req, res, next, "该老师不存在，请检查输入！");
            return false;
        }

        console.log('isTeacher');

        var insertPoject = yield db.query('INSERT INTO project SET ?', {
            project_category_id: category,
            project_status: 1,
            project_creator_id: isUser[0][0].user_id,
            project_name: name,
            project_start: startTime,
            project_end: endTime,
            project_source: source,
            project_aid: aid,
            project_background: background,
            project_describe: describe,
            project_innovation: innovation,
            project_plan: plan,
            project_prospect: prospect,
            project_budget: budget,
            project_resourcerequired: resourcerequired
        });

        console.log('insertPoject');

        if (insertPoject[0].length === 0) {
            sendData(req, res, next, "上传数据失败，请稍后重试");
            return false;
        }

        var insertProjectTeacher = yield db.query('INSERT INTO project_member SET ?', {
            project_id: insertPoject[0].insertId,
            user_id: isTeacher[0][0].user_id,
            project_member_role: 2,
            project_member_task: '指导老师'
        });

        console.log('insertProjectTeacher');
        //not strict TODO
        var returnId = yield db.query('SELECT user_id FROM  user WHERE user_studentnumber = ?', [mainMember.id]);

        var insertMainMember = yield db.query('INSERT INTO project_member SET ?', {
            project_id: insertPoject[0].insertId,
            user_id: returnId[0][0].user_id,
            project_member_role: 1,
            project_member_task: '队长'
        });

        console.log('insertMainMember');

        var insertMain = [];
        console.log(member);
        for (var i = 0, temId; i < member.length; i++) {
            //not strict TODO
            temId = yield db.query('SELECT user_id FROM  user WHERE user_studentnumber = ?', [member[i].id]);
            insertMain[i] = yield db.query('INSERT INTO project_member SET ?', {
                project_id: insertPoject[0].insertId,
                user_id: temId[0][0].user_id,
                project_member_role: 3,
                project_member_task: '队员'
            });
        }

        console.log('insertMember');

        var insertMessage = yield db.query('INSERT INTO mobile_message SET ?', {
            "sender_id" : returnId[0][0].user_id, //发送者的id
            "receiver_id" : isTeacher[0][0].user_id, //接受者id
            "status": 1,
            //(1：等待答复，2：已经同意，3：已经拒绝，4：已经下架结束)
            "category": 21,
            //(1：学生申请加入项目，项目负责人得到消息 1.1：学生得到是否同意加入项目的消息 2：学生申请加入竞赛，竞赛负责人得到消息 2.1：学生得到是否允许加入竞赛的消息 3：学生申请学校项目，基地老师、管理员收到消息 3.1：学生得到管理员、基地老师回复的消息)
            "content": mainMember.name + '申请创建[' + name +']的项目。',
            "isPush": 2, //(1: 已经推送 2:未推送)
            "isCheck": 2, //(1: 已经查看 2:未查看),
            "createTime": (new Date()).toLocaleString(),
            "project_id" : insertPoject[0].insertId, //消息相关项目的ID,
            "project_status" : 1 //目前项目状态
        });

        console.log('insertMessage');

        var data = {
            status: true,
            message: "申报成功"
        };
        res.send({"data": data});

    }).catch(onerror).then(function (data) {

    });

});

//获取所有的分类名字
router.get('/category', function (req, res, next) {
    var db = req.db;
    var data = {
        status: false,
        message: ""
    }
    var result = [];
    db.getConnection(function (err, conn) {
        if (err) {
            sendData(req, res, next,  err);
        } else {
            conn.query('SELECT project_category_id as id,project_category_name as name FROM project_category', function (err, row) {
                if (err) {
                    sendData(req, res, next,  err);
                } else {
                    for (var i in row) {
                        var cate = new category(row[i].id, row[i].name);
                        console.log(cate);
                        result.push(cate);
                    }
                    res.send(result);
                }
                conn.release();
            })
        }
    })
})

//修改项目的状态
router.post('/change-project', validToken, function (req, res, next) {
    var db = req.db;
    var token = req.query.token;
    var id = req.query.id;
    var projectStatus = req.query.status;
    var data = {
        status: false,
        message: ""
    }
    db.getConnection(function (err, conn) {
        if (err) {
            sendData(req, res, next,  err);
        } else {
            conn.query('UPDATE project SET project_status = ' + projectStatus + ' WHERE project_id = ' + id + '', function (err, row) {
                if (err) {
                    sendData(req, res, next,  err);
                } else {
                    data.message = (row.affectedRows == 1) ? "修改成功" : "修改失败";
                    data.status = (row.affectedRows == 1) ? true : false;
                    res.send({'data': data});
                    conn.release();
                }
            })
        }
    })
})

//对项目添加评论
router.post('/discuss', function (req, res, next) {
    var token = req.query.token;//用户token
    var id = req.query.id;//项目id
    var content = req.query.content;//评论内容
    var db = req.db;
    db.getConnection(function (err, conn) {
        if (err) sendData(req, res, next,  err);
        else {
            conn.query('SELECT user_id from user where user_token = "' + token + '"', function (err, row) {
                if (err) sendData(req, res, next,  err);
                else {
                    if (row.length == 0) {
                        sendData(req, res, next,  "请重新登陆");
                    } else {
                        var userId = row[0].user_id;
                        conn.query('INSERT INTO comment (project_id,user_id,content) VALUES (' + id + ',' + userId + ',"' + content + '")', function (err, row) {
                            if (err) sendData(req, res, next,  err);
                            else {
                                if (row.affectedRows == 0) {
                                    sendData(req, res, next,  "评论失败");
                                } else {
                                    var data = {
                                        status: true,
                                        message: "评论成功"
                                    }
                                    conn.release();
                                    res.send({"data": data});
                                }
                            }

                        })
                    }
                }
            })
        }
    })
})

router.post('/crowdfunding', function (req, res, next) {
    var token = req.query.token;
    var id = req.query.id;//项目id
    var content = req.query.content;
    var money = req.query.money;
    var db = req.db;
    db.getConnection(function (err, conn) {
        if (err) sendData(req, res, next,  err);
        else {
            conn.query('SELECT user_id from user where user_token = "' + token + '"', function (err, row) {
                if (err) sendData(req, res, next,  err);
                else {
                    if (row.length == 0) {
                        sendData(req, res, next,  "请重新登陆");
                    } else {
                        var userId = row[0].user_id;
                        console.log(userId);
                        conn.query('INSERT INTO funding (project_id,user_id,content,money) VALUES (' + id + ',' + userId + ',"' + content + '",' + money + ')', function (err, row) {
                            if (err) sendData(req, res, next,  err);
                            else {
                                console.log(userId);
                                if (row.affectedRows == 0) {
                                    sendData(req, res, next,  "充钱失败");
                                } else {
                                    var data = {
                                        status: true,
                                        message: "充钱成功"
                                    }
                                    res.send({"data": data});
                                }
                            }

                        })
                    }
                }
            })
        }
    })
})
module.exports = router;



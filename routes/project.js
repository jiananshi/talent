var express = require('express');
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


function validToken(req, res, next){
    var db = req.db;
    var userToken = req.query.token;
    db.getConnection(function(err,conn){
        if(err){
            sendData(req,res,next,conn,err);
        }else{
            db.query('SELECT * FROM user WHERE user_token = '+userToken+'',function(err,row){
                if(err){
                    sendData(req,res,next,conn,err);
                }else{
                    if(row.length == 0){
                        sendData(req,res,next,conn,"请登录");
                    }else{
                        next();
                    }
                }
            })
        }
    })
}
//出错时返回一个data对象
function sendData(req,res,next, conn,message){
    var data = {
        message : "", //出错信息
        status : false //状态
    }
    if(typeof (conn) == 'undefined'){
        data.message = message;
        res.send({"data" : data});
    }else{
        conn.release();
        data.message = message;
        res.send({"data" : data});
    }
}
//获取项目的评论
function getDiscuss(req,res,callback){
    var db = req.db;
    var id = req.query.id;
    var comment;
    var discuss = [];
    db.getConnection(function(err,conn){
        db.query('SELECT * FROM comment_info WHERE project_id = '+id+'',function(err,rows){
            if(err) sendData(req,res,next,conn,err);
            else{
                if(rows.length == 0) discuss = [];
                else{
                    for(var i in rows){
                        comment = new discussModel(rows[i].userId,rows[i].userName,rows[i].content,rows[i].createTime);
                        discuss.push(comment);
                    }
                }
                callback(discuss);

            }

        })

    })

}
//得到所有状态为已立项、进行中、已结项（学校项目），报名中、进行中、已结束（自创项目）的简短信息（id,name,category,creator,status）
router.get('/', function (req, res,next) {
    var db = req.db;
    var result = [];
    var simpleProject;
    var data = {
        status: false,
        message : ""
    }
    db.getConnection(function (err, conn) {
        if (err)  sendData(req,res,next,conn,err);
        else {
            //取出所有项目简短信息
            db.query('SELECT projectId as id,projectName as name,categoryName as category,projectStatus as status, creatorName as creator FROM project_info WHERE projectStatus in (3,4,6,7,8,9)', function (err, rows) {
                if (err) {
                    sendData(req, res, next, conn, err);
                } else {
                    for (var i in rows) {
                        //新建project对象
                        simpleProject = new simpleProjectModel(rows[i].id, rows[i].name, rows[i].category, rows[i].creator, rows[i].status);
                        result.push(simpleProject);
                    }
                    res.send(result);
                    conn.release();
                }
            })
        }
    })
});

//根据id返回项目详细信息，自创与学校项目返回的不同
router.get('/project-detail',function(req,res,next){
    var db = req.db;
    var id = req.query.id;
    var freeProject;
    var funding;
    var officialProject;
    var allFunding = [];
    var member = function member(id,name){
        this.name=name;
        this.id=id;
    }
    var mainMember;
    var member =[];
    var teacher;
    console.log("aaa");
    //根据id判断是否为自创项目
    db.getConnection(function(err, conn){
        if(err) sendData(req,res,next,conn,err);
        else {
            db.query('SELECT categoryId FROM project_info WHERE projectId = ' + id + '', function (err, raw) {
                if (err) sendData(req, res, next, conn, err);
                else {
                    if (raw.length == 0) sendData(req, res, next, conn, "该项目id不存在");
                    else {
                        var category = raw[0].categoryId;
                        if (category == 4) {//说明是自创项目
                            db.query('SELECT projectName,categoryName,startTime,endTime,funding,creatorName,people,content,projectStatus FROM project_info WHERE projectId = ' + id + '', function (err, raw) {
                                if (err) sendData(req, res, next, conn, err);
                                else{
                                    var free = raw[0];
                                    freeProject = new freeProjectModel(id,free.projectName,free.categoryName,1,free.startTime,free.endTime,free.funding,free.creatorName,free.people,free.content,[],[],free.projectStatus);
                                    //根据id获取项目的评论
                                   getDiscuss(req,res,function(discuss){
                                        freeProject.setDiscuss(discuss);
                                    });
                                    //根据id获取众筹信息
                                    db.query('SELECT * FROM funding_info WHERE projectId = '+id+'',function(err,rows){
                                       if(err) sendData(req,res,next,conn,err);
                                        else{
                                           for(var i in rows){
                                               funding = new fundingModel(rows[i].userId,rows[i].userName,rows[i].content,rows[i].money);
                                               allFunding.push(funding);
                                           }
                                           freeProject.setAllCrowdfunding(allFunding);
                                           res.send(freeProject);
                                       }
                                    })
                                }
                            })
                        } else {//说明是正式项目
                            db.query('SELECT projectName,categoryName,creatorName,content,people,startTime,endTime,source,aid,background,innovation,plan,prospect' +
                            ' budget,resourcerequired ,projectStatus FROM project_info WHERE projectId = '+id+'', function(err,row){
                                if(err) sendData(req,res,next,conn,err);
                                else{
                                    if(row.length == 0) sendData(req,res,next,conn,err);
                                    else{
                                        var o = row[0];
                                        officialProject = new officialProjectModel(id, o.projectName, o.categoryName,2, o.creatorName, o.contetn, o.people, o.startTime, o.endTime,[], o.source, o.aid, o.background, o.innovation, o.plan, o.prospect, o.budget, o.resourcerequired, [],"",{}, o.projectStatus);
                                        getDiscuss(req,res,function(discuss){
                                            officialProject.setDiscuss(discuss);
                                        })
                                        db.query('SELECT * from member_info WHERE projectId = '+id+'',function(err,rows){
                                            if(err) sendData(req,res,next,conn,err);
                                            else{
                                                for(var i in rows){
                                                    console.log(rows[i]);
                                                    console.log(rows[i].role);
                                                    var projectMember =new memberModel(rows[i].userId,rows[i].userName);
                                                    if(rows[i].role == 1){
                                                        officialProject.setMainMember(projectMember);
                                                    }else if(rows[i].role == 2){
                                                        officialProject.setTeacher(rows[i].userName);
                                                    }
                                                    else {
                                                        member.push(projectMember);
                                                    }
                                                }
                                                officialProject.setMember(member);
                                                res.send(officialProject);
                                            }
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
router.get('/project-status' ,function(req,res,next){
    var db = req.db;
    var projectId = req.query.id;
    var userToken = req.query.token;
    var data = {
        status : false,
        message : ""
    }
    var result = {
        status : 0
    }
    db.getConnection(function(err,conn){
       if(err){
           sendData(req,res,next,conn,err);
       }else {
           db.query('select * from user WHERE user_token = ' + userToken + '', function (err, row) {
               if(err){
                   sendData(req,res,next,conn,err);
               }else {
                   if (row.length == 0) {//说明用户未登录
                       sendData(req,res,next,conn,"请登录");
                   } else {
                       var userId = row[0].user_id;
                       db.query('select project_member_status as status from project_member where user_id = ' + userId + ' and project_id = ' + projectId + ' ', function (err, row) {
                           result.status = (row.length == 0) ? 0 : row[0].status;
                           res.send(result);
                       })
                   }
               }
               conn.release();
           })
       }
    })
});

//用于处理用户申请加入指定项目
router.post('/', function (req, res) {
    var db = req.db;
    var token = req.query.token;//用户token
    var id = req.query.id;//申请项目id
    var userId;
    var applicationReason = req.query.text;//申请理由
    var data = {
        status: false,
        message : ""
    }
    db.getConnection(function (err, conn) {
        if (err)  sendData(req,res,next,conn,err);
        //根据token选出userId
        db.query('SELECT user_id FROM user WHERE user_token = ' + token + '',function(err,rows){
            if(err){
                sendData(req,res,next,conn,err);
            }else{
                userId = (rows.length == 0) ? -1 :rows[0].user_id;
                if(userId == -1){
                    sendData(req,res,next,conn,"请登录");
                }else {
                    //插入记录 ，默认用户角色为1（学生），用户状态为1（审核中）
                    db.query('INSERT INTO  project_member (project_id,user_id,project_member_role,project_member_status,project_application_reason)' +
                    ' VALUES (' + id + ',' + userId + ', 1 , 1, " ' + applicationReason + '");', function (err, rows) {
                        if (err) {
                            sendData(req,res,next,conn,err);
                        } else {
                            data.status = (rows.affectedRows == 1)? true :false;
                            res.send({'data' : data});
                            conn.release();
                        }
                    });
                }
            }
        })
    })
})

//获取指定项目详情
router.get('/get-project',validToken, function(req,res){
    var db = req.db;
    var userToken = req.query.token;
    var id = req.query.id;
    var project;
    var data = {
        status: false,
        message : ""
    }
    db.getConnection(function (err, conn) {
        if (err) sendData(req,res,next,conn,err);
        else{
            db.query('SELECT projectId,projectName,categoryName,creatorName,people,content,projectStatus,memberStatus ' +
            'FROM project_user_info WHERE  projectId = ' + id + '', function (err, rows) {
                if (err) {
                    sendData(req,res,next,conn,err);
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

//用户发起新项目
router.post('/add-item',function(req,res){
    var db = req.db;
    var project = new projectModel(0,req.query.name,req.query.category,0,req.query.people,req.query.content,0);
    var userToken = req.query.token;
    var data = {
        status : false,
        message :""
    }
    db.getConnection(function (err, conn) {
        if (err) sendData(req,res,next,conn,err);
        //根据token选出userId
        db.query('SELECT user_id FROM user WHERE user_token ="' + userToken + '"', function (err, rows) {
            if (err) {
                sendData(req,res,next,conn,err);
            }else {
                if(rows.length == 0){
                    sendData(req,res,next,conn,"请登录");
                }else{
                    var userId = rows[0].user_id;
                    project.setCreator(userId);
                    db.query('INSERT INTO project (project_category_id,project_status,project_creator_id,project_name,project_describe,project_signup_max) ' +
                    'VALUES ('+ project.getCategory()+','+project.getProjectStatus()+','+project.getCreator()+',"'+project.getName()+'",' +
                    '"'+project.getContent()+'",'+project.getPeople()+')',function(err , row){
                        if(err){
                            sendData(req,res,next,conn,err);
                        }else{
                            data.message = (row.affectedRows == 1 )? "" : "插入失败";
                            data.status = (row.affectedRows == 1) ? true : false;
                            res.send(data);//若有错误返回false
                            conn.release();
                        }
                    })
                }
            }
        })
    })
})

//获取所有的分类名字
router.get('/project-category',function(req,res){
    var db = req.db;
    var data = {
        status : false,
        message : ""
    }

    var result = [];
    db.getConnection(function(err ,conn){
        if(err){
            sendData(req,res,next,conn,err);
        }else{
            db.query('SELECT project_category_id as id,project_category_name as name FROM project_category',function(err,row){
                if(err){
                    sendData(req,res,next,conn,err);
                }else{
                    for(var i in row){
                        var cate = new category(row[i].id,row[i].name);
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
router.post('/change-project',validToken,function(req,res,next){
    var db = req.db;
    var token = req.query.token;
    var id = req.query.id;
    var projectStatus = req.query.status;
    var data = {
        status : false,
        message : ""
    }
    db.getConnection(function(err,conn){
        if(err){
            sendData(req,res,next,conn,err);
        }else {
            db.query('UPDATE project SET project_status = ' + projectStatus + ' WHERE project_id = ' + id + '', function (err, row) {
                if (err) {
                    sendData(req, res, next, conn, err);
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
module.exports = router;

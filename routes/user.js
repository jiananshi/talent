var express = require('express');
var router = express.Router();
var userModel = require('../model/user');

//获取用户信息
router.get('/', function (req, res,next) {
    var db = req.db;
    var token = req.query.token;
    var data = {
        status :false,
        message : ""
    }
    req.data = data;
    db.getConnection(function(err,conn){
        if(err) {
            data.message = err;
            res.send(message);
        }
        conn.query('SELECT * FROM user_info WHERE token = "'+token+'"',function(err,row){
                if(err){
                    data.message = err;
                    conn.release();
                    res.send({"data":data});
                }else{
                    if(row.length == 0){
                        data.message = "请重新登陆";
                        conn.release();
                        res.send({"data":data});
                    }else{
                        var temp = row[0];
                        temp.photo = (temp.photo == null) ? "" : temp.photo;
                        var user = new userModel(temp.id,temp.role,temp.name,temp.photo,temp.number,[],[],[],[],[]);
                        req.user = user;
                        req.conn = conn;
                        next();
                    }
                }
        })
    })
},function(req,res,next){//选出学生参加的竞赛，若是老师和管理员，直接next()
    var user = req.user;
    var conn = req.conn;
    var data = req.data;
    var competition = [];
    if(user.role == 1) {
        //根据userId取出该用户参加的竞赛
        conn.query('SELECT id,competitionName FROM competition_user_info WHERE userId = ' + user.id + '', function (err, rows) {
            if(err){
                data.message = err;
                conn.release();
                res.send({"data" : data});
            }else{
                for(var i in rows ){

                    competition.push({id:rows[i].id,name:rows[i].competitionName});
                }
                user.setCompetition(competition);
                console.log(user);
                next();
            }
        })
    }else{
        next();
    }
},function(req,res,next){//选出老师指导的项目，若是学生、管理员直接next()
    var user = req.user;
    var conn = req.conn;
    var data = req.data;
    var guideProject = [];
    if(user.role == 3){
        conn.query('SELECT projectId,projectName from project_user_info WHERE userId = '+user.id+' and projectStatus in (3,4,5,6)',function(err,rows){
            if(err){
                data.message = err;
                conn.release();
                res.send({"data" : data});
            }else{
                for(var i in rows){
                    guideProject.push({id :rows[i].projectId, name:rows[i].projectName});
                }
                user.setGuideProject(guideProject);
                next();
            }
        })
    }else{
        next();
    }
},function(req,res,next){//取出创建的项目
    var user = req.user;
    var conn = req.conn;
    var data = req.data;
    var createProject = [];
    conn.query('SELECT projectId,projectName,categoryName,projectStatus,categoryId from project_info WHERE creatorId = '+user.id+'',function(err,rows){
        if(err){
            data.message = err;
            conn.release();
            res.send({"data" : data});
        }else{
            for(var i in rows){
                var type = (rows[i].category == 4) ? 1 : 2;
                createProject.push({id:rows[i].projectId,name:rows[i].projectName,category:rows[i].categoryName,type:type,status:rows[i].projectStatus});
            }
            user.setCreateProject(createProject);
            next();
        }
    })

},function(req,res,next){//取出加入的项目，老师和管理员传空
    var user = req.user;
    var conn = req.conn;
    var data = req.data;
    var joinProject = [];
    if(user.role == 1) {
        conn.query('SELECT projectId,projectName,categoryName,categoryId,projectStatus FROM project_user_info WHERE userId = ' + user.id + '', function (err, rows) {
            if (err) {
                data.message = err;
                conn.release();
                res.send({"data": data});
            } else {
                for (var i in rows) {
                    var type = (rows[i].category == 4) ? 1 : 2;
                    joinProject.push({
                        id: rows[i].projectId,
                        name: rows[i].projectName,
                        category: rows[i].categoryName,
                        type: type,
                        status: rows[i].projectStatus
                    });
                }
                user.setJoinProject(joinProject);
                conn.release()
                res.send(user);
            }
        })
    }else{
        conn.release();
        res.send(user);
    }
})

router.post('/', function (req, res) {
});

module.exports = router;

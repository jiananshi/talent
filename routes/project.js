var express = require('express');
var router = express.Router();
var projectModel = require('../model/projectUserModel');

//得到所有项目的信息
router.get('/', function (req, res) {
    var db = req.db;
    var result = [];
    var project;
    var data = {
        status: false,
        message : ""
    }
    db.getConnection(function (err, conn) {
        if (err) console.log("POOL ==> " + err);
        //取出所有项目信息
        db.query('SELECT * FROM project_info',function(err,rows){
            if(err){
                data.message = err;
                res.send(data);//若有错误返回失败
                conn.release();
            }else {
                for (var i in rows) {
                        //新建project对象
                        project = new projectModel(rows[i].projectId,rows[i].projectName, rows[i].categoryName, rows[i].creatorName, rows[i].people,
                            rows[i].content,rows[i].projectStatus);
                        result.push(project);
                    }
                res.send(result);
                conn.release();
                }
        })
    })
});

//得到用户在指定项目中的状态（0为未报名，1为审核中，2为审核通过，3为审核未通过）
router.get('/project-status',function(req,res){
    var db = req.db;
    var projectId = req.query.id;
    var userToken = req.query.token;
    console.log(projectId);
    console.log(userToken);
    var data = {
        status : false,
        message : ""
    }
    var result = {
        status : 0
    }
    db.getConnection(function(err,conn){
       if(err){
           data.message = err;
           res.send(data);
       }else {
           db.query('select * from user WHERE user_token = ' + userToken + '', function (err, row) {
               if (row.length == 0) {//说明用户未登录
                   data.message = "请登录";
                   res.send(data);
               }else{
                   var userId = row[0].user_id;
                   db.query('select project_member_status as status from project_member where user_id = '+userId+' and project_id = '+projectId+' ', function(err,row){
                       result.status = (row.length == 0) ? 0 : row[0].status;
                       res.send(result);
                   })
               }
               conn.release();
           })
       }
    })
})

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
        if (err) console.log("POOL ==> " + err);
        //根据token选出userId
        db.query('SELECT user_id FROM user WHERE user_token = ' + token + '',function(err,rows){
            if(err){
                data.message = err;
                res.send(data);//若有错误返回false
                conn.release();
            }else{
                userId = rows[0].user_id;
                //插入记录 ，默认用户角色为1（学生），用户状态为1（审核中）
                db.query('INSERT INTO  project_member (project_id,user_id,project_member_role,project_member_status,project_application_reason)' +
                ' VALUES (' + id +  ',' + userId + ', 1 , 1, " ' + applicationReason + '");',function(err,rows){
                    if(err){
                        console.log(err);
                        data.message = err;
                        res.send(data);//若有错误返回false
                        conn.release();
                    }else{
                        data.status = true;//成功插入 返回true
                        res.send(data);
                        conn.release();
                    }
                });
            }
        })
    })
})

router.get('/get-project',function(req,res){
    var db = req.db;
    var token = req.query.token;
    var id = req.query.id;
    var project;
    var data = {
        status: false,
        message : ""
    }
    db.getConnection(function (err, conn) {
        if (err) console.log("POOL ==> " + err);
        //从project_user_info视图中获取user和project的信息，user未报名的项目不存储在数据库中
        db.query('SELECT projectId,projectName,categoryName,creatorName,people,content,projectStatus,memberStatus ' +
        'FROM project_user_info WHERE userToken = ' + token + ' AND  projectId = ' + id + '',function(err,rows){
            if(err){
                console.log(err);
                data.message = err;
                res.send(data);//若有错误返回失败
                conn.release();
            }else {
                project = new projectUserModel(rows[0].projectId,rows[0].projectName, rows[0].categoryName, rows[0].creatorName, rows[0].people,
                    rows[0].content, rows[0].memberStatus, rows[0].projectStatus);
                res.send(project);
                conn.release();
            }
        })
    });
})
module.exports = router;

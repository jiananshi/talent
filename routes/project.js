/**
 * Created by apple on 2015/3/25.
 */
var express = require('express');
var router = express.Router();
var projectUserModel = require('../model/projectUserModel');
var hashMap = require('hashmap').HashMap;

router.get('/', function (req, res) {
    var db = req.db;
    var result = [];
    var token = req.query.token;
    var project;
    var data = {
        status: false,
        message : ""
    }
    var map = new hashMap();
    db.getConnection(function (err, conn) {
        if (err) console.log("POOL ==> " + err);
        //从project_user_info视图中获取user和project的信息，user未报名的项目不存储在数据库中
        db.query('SELECT projectId,projectName,categoryName,creatorName,people,content,projectStatus,memberStatus ' +
        'FROM project_user_info WHERE userToken = ' + token + ' ',function(err,rows){
            if(err){
                console.log(err);
                data.message = err;
                res.send(data);//若有错误返回失败
                conn.release();
            }else{
                for(var i in rows){
                    project= new projectUserModel( rows[i].projectName,rows[i].categoryName,rows[i].creatorName,rows[i].people,
                        rows[i].content,rows[i].memberStatus,rows[i].projectStatus);
                    //把取出结果以projectId为key 加入hashmap中
                    map.set(rows[i].projectId, project);
                }
                //取出所有项目信息
                db.query('SELECT * FROM project_info',function(err,rows){
                    if(err){
                        data.message = err;
                        res.send(data);//若有错误返回失败
                        conn.release();
                    }else {
                        for (var i in rows) {
                            //若以项目id为key 无法从map中取出对象 说明指定用户未报名该项目
                            if (map.get(rows[i].projectId) === undefined) {
                                //新建project对象，用户状态为0，说明未报名
                                project = new projectUserModel(rows[i].projectName, rows[i].categoryName, rows[i].creatorName, rows[i].people,
                                    rows[i].content, 0, rows[i].projectStatus);
                                map.set(rows[i].projectId, project);
                            }
                        }
                        map.forEach(function (value, key) {
                            result.push(value);
                        })
                        res.send(result);
                        conn.release();
                    }
                })

            }
        });
    });
});


module.exports = router;

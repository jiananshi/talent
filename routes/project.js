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
    var map = new hashMap();
    db.getConnection(function (err, conn) {
        if (err) console.log("POOL ==> " + err);
        db.query('SELECT projectId,projectName,categoryName,creatorName,people,content,projectStatus,memberStatus ' +
        'FROM project_user_info WHERE userToken = ' + token + ' ',function(err,rows){
            if(err){
                console.log(err);
                result = err;
                res.send(false);
                conn.release();
            }else{
                for(var i in rows){
                    project= new projectUserModel( rows[i].projectName,rows[i].categoryName,rows[i].creatorName,rows[i].people,
                        rows[i].content,rows[i].memberStatus,rows[i].projectStatus);
                    map.set(rows[i].projectId, project);
                }
                db.query('SELECT * FROM project_info',function(err,rows){
                    for(var i in rows){
                        if(map.get(rows[i].projectId) ===  undefined){
                            project = new projectUserModel( rows[i].projectName,rows[i].categoryName,rows[i].creatorName,rows[i].people,
                                rows[i].content,0,rows[i].projectStatus);
                            console.log(rows[i].projectId);
                            console.log(project);
                            map.set(rows[i].projectId, project);
                        }
                    }
                    map.forEach(function(value,key){
                        console.log(key + "ss"
                        + value);
                        result.push(value);
                    })
                    res.send(result);
                    conn.release();
                })

            }
        });
    });
});
module.exports = router;

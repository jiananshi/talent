var express = require('express');
var router = express.Router();
var competitionModel = require('../model/competitionModel')

//得到所有竞赛的信息(包括id，name，creator，createtime，endtime, people, content)
router.get('/', function (req, res) {
    var db = req.db;

    var data = {
        status : false,
        message : ""
    };
    var competition;
    var result = [];
    db.getConnection(function(err, conn){
        if(err) {
            data.message = err;
            res.send(data);
        }else{
            db.query('select id, name, createTime, endTime, people , content, creator from competition_info  ',function(err,rows){
                if(err){
                    data.message = err;
                    res.send(data);
                }else{
                    rows.forEach(function(row){
                        competition = new competitionModel(row.id, row.name, row.creator, row.content, row.createTime ,row.endTime, row.people);
                        result.push(competition);
                    })
                    res.send(result);
                }
            })
            conn.release();
        }

    })
});

//处理报名竞赛，在competition_enroll表中插入记录
router.post('/application-competition', function (req, res) {
    var db = req.db;
    var id = req.query.id;
    var token = req.query.token;
    var data ={
        status : false,
        message : ""
    }
    db.getConnection(function(err , conn){
        if(err) res.send(data);
        //根据token取得userId
        db.query('SELECT user_id from user where user_token = "'+token+'"',function(err,row){
            if(err){
                data.message = err;
                res.send(data);
            }else{
                //根据token查不到userId说明 token已过期 需重新登录
                var userId = (row.length == 0) ? 0 : row[0].user_id;
                if(userId == 0){
                    data.message = "重新登录";
                    res.send(data);
                }else{
                    db.query('INSERT INTO competition_enroll (competition_id, competition_enroll_foo_id) VALUES ('+id+','+userId+')',function(err,row){
                        if(err){
                            data.message = err;
                            res.send(data);
                        }else{
                            //影响行数为1 说明报名成功
                            data.message = (row.affectedRows == 1) ? "报名成功" : "报名失败";
                            data.status = (row.affectedRows == 1) ? true: false;
                            res.send(data);
                        }
                    } )
                }
            }
            conn.release();
        })
    })

});

module.exports = router;


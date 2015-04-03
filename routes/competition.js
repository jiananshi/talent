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
            db.query('select id, name, createTime, endTime, people , content, creator from competition_user  ',function(err,rows){
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

router.post('/', function (req, res) {
});

module.exports = router;


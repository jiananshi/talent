var express = require('express');
var router = express.Router();
var newsModel = require('../model/newsModel')

//得到所有状态为已发布的新闻的信息(包括id，name，imgurl，time，readtime)
router.get('/', function (req, res) {
    var db = req.db;
    var data = {
        status : false,
        message : ""
    };
    var result = [];
    db.getConnection(function(err, conn){
        if(err){
            console.log(err);
            data.message = err;
            res.send({'data' : data});
        }
        db.query("SELECT news_id as id, news_title as name,news_show_picture as imgUrl,news_content as content,news_createtime as time,news_readtimes as readTimes " +
        "From news WHERE news_status = 0", function(err,rows){
            if(err){
                console.log(err);
                data.message = err;
                res.send({'data' : data});
                conn.release();
            }else{
                for(var i in rows){
                    var news = newsModel(rows[i].id, rows[i].name,1,rows[i].imgUrl,rows[i].content.substr(0,40),rows[i].time,rows[i].readTimes);
                    result.push(news);
                }
                db.query('SELECT notice_id as id,notice_title as name,notice_content as content,notice_createtime as time FROM notice WHERE notice_status = 0 ',function(err,rows){
                    if(err){
                        console.log(err);
                        data.message = err;
                        res.send({'data' : data});
                        conn.release();
                    }else{
                        for(var i in rows){
                            var news = newsModel(rows[i].id, rows[i].name,2,"",rows[i].content.substr(0,40),rows[i].time,"");
                            result.push(news);
                        }
                        res.send(result);
                        conn.release();
                    }
                })
            }
        })

    })
});

router.post('/', function (req, res) {
});

module.exports = router;


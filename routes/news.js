var express = require('express');
var router = express.Router();
var newsModel = require('../model/newsModel')
var newsDetailModel = require('../model/newsDetailModel');

//得到所有状态为已发布的新闻/通知的简单信息(包括id，name，imgurl，time，readtime)
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

router.get('/detail', function (req, res) {
    var db = req.db;
    var id = req.query.id;
    var category = req.query.category;
    var data = {
        status : false,
        message :""
    }
    var news;
    db.getConnection(function(err,conn){
        if(err){
            data.message = err;
            res.send({'data' : data});
            conn.release();
        }else{
            if(category == 1 ){
                db.query('SELECT news_id as id, news_title as name,news_show_picture as imgUrl,news_content as content,news_createtime as time,news_readtimes as readTimes ' +
                ' From news WHERE news_id = '+id+' ', function(err,rows){
                    if(err){
                        console.log(err);
                        data.message = err;
                        res.send({'data' : data});
                        conn.release();
                    }else{
                         news = newsDetailModel(rows[0].id, rows[0].name,1,rows[0].imgUrl,rows[0].content,rows[0].time,rows[0].readTimes);
                        res.send(news);
                        conn.release();
                    }
            })
         }else{
                db.query('SELECT notice_id as id,notice_title as name,notice_content as content,notice_createtime as time FROM notice WHERE notice_id = '+id+'', function(err,rows){
                    if(err){
                        console.log(err);
                        data.message = err;
                        res.send({'data' : data});
                        conn.release();
                    }else{
                         news = newsDetailModel(rows[0].id, rows[0].name,2,"",rows[0].content,rows[0].time,"");
                        res.send(news);
                        conn.release();
                    }
                })
            }
        }
    })
});

router.post('/read',function(req,res){
    var db = req.db;
    var id = req.query.id;
    var data = {
        status : false,
        message :""
    }
    db.getConnection(function(err,conn){
        if(err){
            data.message = err;
            res.send({"data" : data});
        }else{
            db.query('UPDATE news set news_readtimes = news_readtimes+1 WHERE news_id = '+id+' ',function(err,row){
                if(err){
                    data.message = err;
                    conn.release();
                    res.send({"data" : data});
                }else{
                    data.message = (row.affectedRows == 1)? "成功" : "失败";
                    data.status = (row.affectedRows == 1)?true : false;
                    conn.release();
                    res.send({"data" : data});
                }
            })
        }

    })
})
module.exports = router;


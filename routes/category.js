/**
 * Created by apple on 2015/4/11.
 */
var express = require('express');
var router = express.Router();

//获取所有的分类名字
router.get('/',function(req,res){
    var db = req.db;
    var data = {
        status : false,
        message : ""
    }
    var result = [];
    db.getConnection(function(err ,conn){
        if(err){
            data.message = err;
            res.send(data);
        }else{
            db.query('SELECT project_category_name as category FROM project_category',function(err,row){
                if(err){
                    data.message = err;
                    res.send(data);
                }else{
                    for(var i in row){
                        result.push(row[i].category);
                    }
                    res.send(result);
                }
                conn.release();
            })
        }
    })
})
module.exports = router;
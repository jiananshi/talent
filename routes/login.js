/**
 * Created by apple on 2015/4/6.
 */
var express = require('express');
var router = express.Router();
var common = require('../model/common');

router.get('/',function(req,res) {
    console.log("init");
    var db = req.db;
    var data = {
        data: {
            status: false,
            message: ""
        }
    }
    var result = {
        token : ""
    }
    var name = req.query.name;
    var password = req.query.password;
    var token =common.sha1(name + common.random + password + new Date());
    db.getConnection(function(err,conn){
        if(err){
            data.data.message = err;
            res.send(data);
        }else{
            conn.query('UPDATE user set user_token ="'+ token +'" where user_name = "'+ name+'" and user_password ="'+ password+'" ',function(err,row){
                if(err){
                        data.data.message = err;
                        response.send(data);
                    }else{
                        if(row.affectedRows === 1){
                            result.token = token;
                            res.send(result);
                        }else{
                            data.data.message = "用户名或密码不正确";
                            res.send(data);
                        }
                    }
            })
            conn.release();
        }
    })
})
module.exports = router;
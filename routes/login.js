/**
 * Created by apple on 2015/4/6.
 */
var express = require('express');
var router = express.Router();
var common = require('../model/common');

router.get('/',function(req,res) {
    var db = req.db;
    var data = {
        status: false,
        message: ""
    }
    var name = req.name;
    var password = req.password;
    var token =common.sha1(name + common.random + password + new Date());
    db.connection(function(err,conn){
        if(err){
            data.message = err;
            response.send(data);
        }else{
            db.query('UPDATE user set user_token = '+ token +' where user_name = '+ name+' and user_password = '+ password+' ',function(err,row){
                    if(err){
                        data.message = err;
                        response.send(data);
                    }else{
                        console.log(row);
                        res.send(row);
                    }
            })
            conn.release();
        }
    })
})
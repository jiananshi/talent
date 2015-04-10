/**
 * Created by ggice on 14/12/23.
 */
var crypto = require('crypto');
var express = require('express');

//Build sha1 hash
exports.sha1 = function sha1(text) {
  return crypto.createHash('sha1').update(text).digest('hex');
};

//Build random number 1 to 1000000000000
exports.random = function random() {
  return  Math.random() * (1 - 1000000000000) + 1000000000000;
};

//Javascript clone obj;
exports.jsonClone = function jsonClone(obj) {
  return JSON.parse(JSON.stringify(obj));
};

exports.objClone = function cloneObject(src) {
  var dest = {};
  for (var key in src) {
    if (typeof src === "object") dest[key] = cloneObject(src[key]); else dest[key] = src[key];
  }
  return dest;
};

//判断token是否过期
exports.login = function login(req, token){
  console.log("asdasd");
  var db = req.db;
  console.log(db);
  var data = {
    status : false,
    message :-1
  };
  db.getConnection(function (err, conn) {
    console.log("asdasd");
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
  //db.getConnection(function(err, conn){
  //  if(err){
  //    data.message = err;
  //    return data;
  //  }
  //  else{
  //    db.query('select * from user WHERE user_token = ' + userToken + '', function (err, row) {
  //      if(err){
  //        data.message = err;
  //        return data;
  //      }else{
  //        if(row.length == 0){
  //          data.message = "请登陆";
  //        }else{
  //          data.message = row;
  //          data.status = true;
  //        }
  //        return data;
  //      }
  //    })
  //  }
  //
  //})
}
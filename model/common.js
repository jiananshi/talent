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

exports.makeDate = function makeDate(date) {
    try {
        var newDate = new Date(date);
        //在小于10的月份前补0
        var month = eval(newDate.getMonth() + 1) < 10 ? '0'+eval(newDate.getMonth() + 1) : eval(newDate.getMonth() + 1);
        //在小于10的日期前补0
        var day = newDate.getDate() < 10 ? '0' + newDate.getDate() : newDate.getDate();
        //在小于10的小时前补0
        var hours = newDate.getHours() < 10 ? '0' + newDate.getHours() : newDate.getHours();
        //在小于10的分钟前补0
        var minutes = newDate.getMinutes() < 10 ? '0' + newDate.getMinutes() : newDate.getMinutes();
        //在小于10的秒数前补0
        var seconds = newDate.getSeconds() < 10 ? '0' + newDate.getSeconds(): newDate.getSeconds();
        var stringDate = newDate.getFullYear() + '-' + month + '-' + day + " " + hours + ":" + minutes + ":" + seconds;
    }catch(e){
        var stringDate = "0000-00-00 00:00:00";
    }finally{
        return stringDate;
    }

};

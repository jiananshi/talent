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
  if (date.length > 10) {
    return date.toISOString().
        replace(/T/, ' ').
        replace(/\..+/, '');
  } else {
    return "";
  }
};

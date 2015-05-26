//@GGICE
var express = require('express');
var co = require('co');
var common = require('../model/common');
var router = express.Router();

router.get('/', function (req, res) {
    var db = req.db,
        token = req.query.token;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?',[token]);
        if (isUser[0].length === 0) {
            sendData(req, res, '请重新登录');
            return false;
        }

        var message = yield  db.query('SELECT * FROM mobile_message  WHERE receiver_id = ?', [
            isUser[0][0].user_id]);
        if (message[0].length === 0) {
            sendData(req, res, '没有消息');
        } else {
            for(var i = 0 ; i < message[0].length; i++){
                message[0][i].createTime = common.makeDate(message[0][i].createTime);
            }
            res.send(message[0]);
        }
    }).catch(onerror);
});

router.get('/push', function (req, res) {
    var db = req.db,
        token = req.query.token;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?',[token]);
        if (isUser[0].length === 0) {
            sendData(req, res, '请重新登录');
            return false;
        }

        var message = yield  db.query('SELECT * FROM mobile_message  WHERE receiver_id = ? AND isCheck = ?', [
            isUser[0][0].user_id, 2]);
        if (message[0].length === 0) {
            sendData(req, res, '没有消息');
        } else {
            res.send(message[0]);
        }
    }).catch(onerror);
});

function sendPost(res, status, message) {
    var data = {
        message: message, //出错信息
        status: status //状态
    };
    res.send({"data": data});
}

function onerror(err) {
    console.error(err.stack);
    sendData(req, res, err.stack);
}

function sendData(req, res, message) {
    var data = {
        message: message, //出错信息
        status: false //状态
    };
    res.send({"data": data});
}

router.post('/check', function (req, res) {
    var db = req.db,
        token = req.body.token,
        id = req.body.id;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?',[token]);
        if (isUser[0].length === 0) {
            sendPost(req, res, '请重新登录');
            return false;
        }

        var messageCheck = yield  db.query('UPDATE mobile_message  SET ? WHERE ?', [
            {isCheck: 1},
            {id: id}
        ]);
        if (messageCheck[0].length === 0) {
            sendPost(res, false, '失败');
        } else {
            sendPost(res, true, '成功');
        }
    }).catch(onerror);

});

module.exports = router;

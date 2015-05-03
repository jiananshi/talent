var express = require('express');
var router = express.Router();
var co = require('co');

router.get('/', function (req, res) {
    var db = req.db,
        token = req.query.token;

    function onerror(err) {
        console.error(err.stack);
        sendData(req, res, err.stack);
    }

    function sendData(req, res, message) {
        var data = {
            message: "", //出错信息
            status: false //状态
        };
        data.message = message;
        res.send({"data": data});
    }

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token ="' + token + '"');
        if (isUser[0].length === 0) {
            sendData(req, res, "请重新登录");
            return false;
        }

        var message = yield  db.query('SELECT * FROM mobile_message  WHERE  receiver_id ="' + isUser[0][0].user_id + '"');
        if(message[0].length === 0){
            sendData(req, res, "没有消息");
        }else{
            res.send(message[0][0]);
        }
    }).catch(onerror);
});
router.post('/', function (req, res) {
});

module.exports = router;

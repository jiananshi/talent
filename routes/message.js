//@GGICE
var express = require('express');
var co = require('co');
var common = require('../model/common');
var router = express.Router();

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

router.get('/', function (req, res) {
    var db = req.db,
        token = req.query.token;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?', [token]);
        if (isUser[0].length === 0) {
            sendData(req, res, '请重新登录');
            return false;
        }

        var message = yield  db.query('SELECT * FROM mobile_message  WHERE receiver_id = ?', [
            isUser[0][0].user_id]);

        for (var i = 0; i < message[0].length; i++) {
            message[0][i].createTime = common.makeDate(message[0][i].createTime);
        }
        res.send(message[0]);
    }).catch(onerror);
});

router.get('/push', function (req, res) {
    var db = req.db,
        token = req.query.token;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?', [token]);
        if (isUser[0].length === 0) {
            sendData(req, res, '请重新登录');
            return false;
        }

        var message = yield  db.query('SELECT * FROM mobile_message  WHERE receiver_id = ? AND isPush = ?', [
            isUser[0][0].user_id, 2]);
        res.send(message[0]);

    }).catch(onerror);
});

router.post('/push', function (req, res) {
    var db = req.db,
        token = req.body.token,
        id = req.body.id;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?', [token]);
        if (isUser[0].length === 0) {
            sendPost(res, false, '请重新登录');
            return false;
        }

        var messageCheck = yield  db.query('UPDATE mobile_message  SET ? WHERE ?', [
            {isPush: 1},
            {id: id}
        ]);
        if (messageCheck[0].length === 0) {
            sendPost(res, false, '失败');
        } else {
            sendPost(res, true, '成功');
        }
    }).catch(onerror);

});

router.post('/reply', function (req, res) {
    var db = req.db,
        token = req.body.token,
        status = req.body.status,
        id = req.body.id,
        category = req.body.category;
    if (category == 3) {
        co(function *() {
            var isUser = yield db.query('SELECT * FROM  user WHERE user_token = ?', [token]);
            if (isUser[0].length === 0) {
                sendPost(res, false, '请重新登录');
                return false;
            }
            var project = yield db.query('SELECT * FROM  mobile_message WHERE id = ?', [id]);
            var projectUp;
            var content;
            if (status == 1) {
                content = '同意';
                projectUp = yield  db.query('UPDATE project  SET ? WHERE ? ', [
                    {project_status: 3},
                    {project_id: project[0][0].project_id}
                ]);
            } else {
                content = '拒绝';
                projectUp = yield  db.query('UPDATE project  SET ? WHERE ? ', [
                    {project_status: 5},
                    {project_id: project[0][0].project_id}
                ]);
            }
            console.log(projectUp[0].affectedRows);
            if (projectUp[0].affectedRows < 1) {
                sendPost(res, false, '项目修改失败!');
                //should turn back!
                return false;
            }
            var messageCheck = yield  db.query('UPDATE mobile_message  SET ? WHERE ? && ?', [
                {isCheck: 1},
                {id: id},
                {receiver_id: isUser[0][0].user_id}
            ]);
            if (messageCheck[0].affectedRows < 1) {
                sendPost(res, false, '您不能修改该消息!');
                return false;
            }
            var insertMessage = yield db.query('INSERT INTO mobile_message SET ?', {
                "sender_id": project[0][0].receiver_id, //发送者的id
                "receiver_id": project[0][0].sender_id, //接受者id
                "status": parseInt(status),
                //(1：等待答复，2：已经同意，3：已经拒绝，4：已经下架结束)
                "category": 31,
                //(1：学生申请加入项目，项目负责人得到消息 1.1：学生得到是否同意加入项目的消息 2：学生申请加入竞赛，竞赛负责人得到消息 2.1：学生得到是否允许加入竞赛的消息 3：学生申请学校项目，基地老师、管理员收到消息 3.1：学生得到管理员、基地老师回复的消息)
                "content": isUser[0][0].user_fullname + content + '了你的创建项目请求。',
                "isPush": 2, //(1: 已经推送 2:未推送)
                "isCheck": 1, //(1: 已经查看 2:未查看),
                "createTime": (new Date()).toLocaleString(),
                "project_id": project[0][0].project_id, //消息相关项目的ID,
                "project_status": 1 //目前项目状态
            });
            sendPost(res, true, '操作成功！');
        }).catch(onerror);
    } else if (category == 1) {
        co(function *() {
            //should turn back TODO
            var projectMem,
                content;
            var isUser = yield db.query('SELECT * FROM  user WHERE user_token = ?', [token]);
            if (isUser[0].length === 0) {
                sendPost(res, false, '请重新登录');
                return false;
            }
            if (status == 1) {
                projectMem = yield db.query('UPDATE project_member  SET ? WHERE ? ', [
                    {project_member_status: 1},
                    {project_id: id}
                ]);
                content = '通过。'
            } else {
                projectMem = yield db.query('UPDATE project_member  SET ? WHERE ? ', [
                    {project_member_status: 1},
                    {project_id: id}
                ]);
                content = '被拒绝。'
            }
            var messageCheck = yield  db.query('UPDATE mobile_message  SET ? WHERE ? && ?', [
                {isCheck: 1},
                {id: id},
                {receiver_id: isUser[0][0].user_id}
            ]);
            if (messageCheck[0].affectedRows < 1) {
                sendPost(res, false, '您不能修改该消息!');
                return false;
            }
            console.log('projectMem');
            var project = yield db.query('SELECT * FROM  mobile_message WHERE id = ?', [id]);
            console.log('project');
            var insertMessage = yield db.query('INSERT INTO mobile_message SET ?', {
                "sender_id": project[0][0].receiver_id, //发送者的id
                "receiver_id": project[0][0].sender_id, //接受者id
                "status": parseInt(status),
                //(1：等待答复，2：已经同意，3：已经拒绝，4：已经下架结束)
                "category": 11,
                //(1：学生申请加入项目，项目负责人得到消息 1.1：学生得到是否同意加入项目的消息 2：学生申请加入竞赛，竞赛负责人得到消息 2.1：学生得到是否允许加入竞赛的消息 3：学生申请学校项目，基地老师、管理员收到消息 3.1：学生得到管理员、基地老师回复的消息)
                "content": '您申请加入' + project[0][0].content.match(/\[(\S*)\]/)[0] + content,
                "isPush": 2, //(1: 已经推送 2:未推送)
                "isCheck": 1, //(1: 已经查看 2:未查看),
                "createTime": (new Date()).toLocaleString(),
                "project_id": project[0][0].project_id, //消息相关项目的ID,
                "project_status": 1 //目前项目状态
            });
            console.log('insertMessage');
            sendPost(res, true, '操作成功！');
        }).catch(onerror);
    }else{
        sendPost(res, false, '操作失败，请重新尝试！');
    }
});

router.post('/check', function (req, res) {
    var db = req.db,
        token = req.body.token,
        id = req.body.id;

    co(function *() {
        var isUser = yield db.query('SELECT user_id FROM  user WHERE user_token = ?', [token]);
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

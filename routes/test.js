var express = require('express');
var router = express.Router();

router.get('/', function (req, res) {
  var db = req.db;
  var send;
  db.getConnection(function (err, conn) {
    if (err) console.log("POOL ==> " + err);
    db.query('SELECT id,name FROM test',function(err,rows){
      if(err){
        console.log(err);
      }else{
        console.log(rows);
        send = rows;
        res.send(send);
        conn.release();
      }
    });
  });
});

router.post('/', function (req, res) {
  //http://127.0.0.1:7778/test?name=xiaowang
  var db = req.db;
  var send;
  var name = req.query.name;
  db.getConnection(function (err, conn) {
    if (err) console.log("POOL ==> " + err);
    db.query('INSERT INTO test (name) VALUES (' + name + ');',function(err,data){
      if(err){
        console.log(err);
      }else{
        console.log(data);
        send = data;
        res.send(send);
        conn.release();
      }
    });
  });
});

module.exports = router;

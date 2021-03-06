var express = require('express');
var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

//connect mysql, change  the information to yourself.
var mysql      = require('mysql');
//create connection pool
var connection = mysql.createPool({
  host     : 'localhost',
  user     : 'root',
  password : '12345',
  database: 'talent',
  port: 3306,
    connectionLimit:1000
});

var routes = require('./routes/index');
var test = require('./routes/test');
var project = require('./routes/project');
var news = require('./routes/news');
var competition = require('./routes/competition');
var login = require('./routes/login');
var user = require('./routes/user');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//allow ajax
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

// Make our db accessible to our router
app.use(function(req,res,next){
//    req.db = db;
    req.db = connection;
    next();
});

app.use('/', routes);
app.use('/test', test);
app.use('/project',project);
app.use('/news',news);
app.use('/competition', competition);
app.use('/login', login);
app.use('/user',user);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});


module.exports = app;

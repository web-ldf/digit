var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
//引入跨域cors
var cors=require("cors");
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var detailsRouter=require('./routes/details');

var app = express();

app.use(cors({
  //       VUE脚手架项目             Live Server
  origin:['http://localhost:8080',"http://127.0.0.1:5500","http://127.0.0.1:5050"],
  credentials:true
}));
// view engine setup
app.use(express.static(path.join(__dirname, 'views')));
/* app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade'); */
app.use('/public', express.static(path.join(__dirname + '/public')))

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/details', detailsRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

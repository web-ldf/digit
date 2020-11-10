//引入express框架
var express = require('express');
var router = express.Router();
//引入数据库连接池
const query = require('./query.js');
router.post("/login",function(req,res){
  var $uname=req.body.uname;
  var $upwd=req.body.upwd;
  var sql="SELECT * FROM `dt_user` where uname=? && upwd=?";
  query(sql,[$uname,$upwd]).then(result=>{
      if(result.length>0){
        console.log(result);
        res.send(result);
      }else{
        res.send("0");
      }
  })
  .catch(error=>console.log(error));
});
//用户注册路由
router.post("/register",function(req,res){
  var obj=req.body;
  console.log(obj);
  var sql="INSERT INTO `dt_user` set ?";
  query(sql,[obj]).then(result=>{
      if(result.affectedRows>0){
        res.send("1");
      }else{
        res.send("0");
      }
  })
  .catch(error=>console.log(error));
});
//用户注册用户名不相同
router.get('/findUser',function(req,res){
   var uname=req.query.uname;
   console.log(uname);
   var sql='SELECT * FROM dt_user WHERE uname=?';
   query(sql,[uname]).then(results=>{
     if(results.length>0){
       res.send('1');
     }else{
       res.send('0');
     }
   }).catch(error=>console.log(error))
});
//用户登录的所有信息
router.get('/loginMessage',(req,res)=>{
   var uname=req.query.uname;
   console.log(uname);
   var sql='SELECT * FROM dt_user WHERE uname=?';
   query(sql,[uname]).then(results=>{
     if(results.length>0){
       res.send(results);
     }else{
       res.send('0');
     }
   })
});

module.exports = router;

//数据库连接池
var pool=require("../pool");
module.exports=function(sql,params){
    //使用Promise用于解决回调地狱
  return new Promise(function(open,err){
    pool.query(sql,params,(error,result)=>{
      if(error) err(error);
      //打开result入口
      else open(result); 
    })
  })
}
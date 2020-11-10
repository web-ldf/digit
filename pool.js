//引入mysql数据库模块
const mysql=require("mysql");
//创建连接池
var pool=mysql.createPool({
   host:"127.0.0.1",
   port:3306,
   user:"root",
   password:"",
   database:"digit",
   connectionLimit:15
});
//导出连接池
module.exports=pool;
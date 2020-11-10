var express = require('express');
var router = express.Router();
const query = require('./query.js');
router.get("/",(req,res)=>{
    var pid=req.query.pid;
    var output={};
    var sql="SELECT * FROM product_Details WHERE pid=?";
    query(sql,[pid]).then(results=>{
        //封装到output对象中
        output.product=results[0];
        var fid=output.product.family_id;
        var sql="SELECT * FROM product_Details WHERE family_id=?";
        return query(sql,[fid]);
    }).then(results=>{
        output.specs=results;
        var sql="SELECT * FROM product_Details_pics WHERE product_id=?";
        return query(sql,[pid]);
    }).then(results=>{
       output.pics=results;
       console.log(output);
       res.send(output);
    })
    .catch(error=>console.log(error));
});
//商品详情页添加到购物车
router.post('/addShop',(req,res)=>{
    var obj=req.body;
    var sql="INSERT INTO shop SET ?";
    query(sql,[obj]).then(results=>{
        if(results.affectedRows>0){
            res.send("1");
        }else{
            res.send("0");
        }
    }).catch(error=>console.log(error));;
});
//用户购物车的购买获取
router.get('/searchShop',(req,res)=>{
    let uid=req.query.uid;
    console.log(uid);
    var sql="SELECT * FROM shop WHERE shop.uid=?";
    query(sql,[uid]).then(results=>{
        res.send(results);
    })
    .catch(error=>console.log(error));
});
//手机类商品的获取
router.get("/phone",(req,res)=>{
    let cid=req.query.cid;
    let obj={};
    let sql="SELECT * FROM newProducts WHERE cid=?";
    query(sql,[cid]).then(results=>{
        obj.phone=results;
        res.send(obj);
    })
    .catch(error=>console.log(error));
});
//数码类商品的获取
router.get("/digit",(req,res)=>{
    let cid=req.query.cid;
    let obj={};
    let sql="SELECT * FROM newProducts WHERE cid=?";
    query(sql,[cid]).then(results=>{
        obj.digit=results;
        res.send(obj);
    })
    .catch(error=>console.log(error));
});
//导出路由模块
module.exports=router;
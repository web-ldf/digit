
var express = require('express');
var router = express.Router();
const query = require('./query.js');
/* GET home page. */
router.get('/index', function(req, res) {
  //用于返回的数组
  var output={};
   var sql="SELECT * FROM newProducts ORDER BY shelf_time DESC LIMIT 0,8";
   query(sql).then(results=>{
       output.newProduct=results;
       var sql="SELECT * FROM findShopping";
       return query(sql);
   })
   .then((results=>{
      output.findShopping=results;
      res.send(output);
   }));
});

module.exports = router;

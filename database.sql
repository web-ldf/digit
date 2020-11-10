SET NAMES UTF8;
/*数码数据库信息*/
DROP DATABASE IF EXISTS digit;
CREATE DATABASE digit CHARSET=UTF8;
USE digit;
/* 商品分类表 */
CREATE TABLE digit_category(
   /* 商品分类id */
   id INT PRIMARY KEY AUTO_INCREMENT COMMENT '商品ID,主键且自增',
   /* 分类名称 */
   Classification VARCHAR(25) COMMENT '分类字段'
);
/* 插入数据 */

INSERT INTO digit_category VALUES(null,'手机');
INSERT INTO digit_category VALUES(null,'摄像机');

/*用户信息表*/
CREATE TABLE dt_user(
   uid INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID,主键且自增',
   uname VARCHAR(15) COMMENT '用户名称,唯一',
   upwd VARCHAR(18) COMMENT '用户密码',
   sex VARCHAR(1) COMMENT '用户性别',
   email VARCHAR(25) COMMENT '用户电子邮件',
   phone CHAR(11) COMMENT '用户电话号码'
);
insert into dt_user values(null,"dingding","123456",'1',"dingding@qq.com","13982745678");

/* 网页发现好货部分的数据库 */
CREATE TABLE findShopping(
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `imgs` VARCHAR(128) DEFAULT NULL,
   `title` VARCHAR(64) DEFAULT NULL
);
/* 插入数据 */
 INSERT INTO findShopping(`id`,`imgs`,`title`)VALUES(
    NULL,"public/images/find_shopping/find_shopping1.png",'好货1'
 ),
 (
    NULL,"public/images/find_shopping/find_shopping2.png","好货2"
 ),
 (
    NULL,"public/images/find_shopping/find_shopping3.png","好货3"
 ),
 (
    NULL,"public/images/find_shopping/find_shopping4.png","好货4"
 );
/* index新产品部分的产品表 */
CREATE TABLE newProducts(
   `id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '产品id',
   `img` VARCHAR(128) DEFAULT NULL COMMENT '产品图片',
   /* 库存 */
   `stock` INT(4) DEFAULT NULL COMMENT '产品的库存',
   `price` DECIMAL(8,2) DEFAULT NULL COMMENT '产品价格',
   `href`  VARCHAR(128) DEFAULT NULL COMMENT '产品详情链接地址',
   `details` VARCHAR(128) DEFAULT NULL COMMENT '产品详情标题',
   `cid` INT COMMENT '分类表外键',
   FOREIGN KEY(cid) REFERENCES digit_category(id),
   `shelf_time` DATE COMMENT '上架时间'
);

/* 插入数据 */
INSERT INTO newProducts(`id`,`img`,`stock`,`price`,`href`,`details`,`cid`,`shelf_time`)VALUES(
   null,"public/images/index_newProducts/oppoA33.jpg","39","658.00","product_details.html?pid=1","OPPO A33 2GB+16GB内存版",1,'2020-5-12'
   ),
   (
      null,"public/images/index_newProducts/xiaomiMIX.jpg","59","2888.00","product_details.html?pid=4","小米MIX 尊享版6GB内存 256GB",1,'2019-7-18'
   ),
   (
      null,"public/images/index_newProducts/vivoY67_32GB.jpg","79","1798.00","product_details.html?pid=7","vivo Y67 全网通 32GB",1,'2019-10-21'
   ),
   (
      null,"public/images/index_newProducts/vivoX9Plus6GB+.jpg","59","3298.00","product_details.html?pid=9","vivo X9Plus 全网通 6GB+",1,'2018-5-12'
   ),
   (
      null,"public/images/index_newProducts/huawei_nova.jpg","89","1999.00","product_details.html?pid=10","华为 nova 青春版 4GB+64GB",1,'2020-10-1'
   ),
   (
      null,"public/images/index_newProducts/wKgADFuVznmANVV_AACWkqUI5sU198.jpg","78","2899.00","product_details.html?pid=11","OPPO R9s Plu64GB内存版？",1,'2020-9-21'
   ),
   (
      null,"public/images/index_newProducts/wKgBS1rQVOKAYeHxAAJb5nURnHc579.jpg","59","2200.00","product_details.html?pid=12","小米Note2 6GB内存 64GB",1,'2020-8-16'
   ),
   (
      null,"public/images/index_newProducts/wKgBS1rQVaOAb-BsAAGBqXs6B8A814.jpg","98","3399.00","product_details.html?pid=13","华为 Mate 9 6GB+128GB版",1,'2020-6-12'
   ),
   (
      null,"public/images/index_newProducts/EOS_700D.jpg","87","4999.00","product_details.html?pid=14","佳能 EOS 700D 单反套机",2,'2020-8-12'
   ),
   (
      null,"public/images/index_newProducts/EX-TR750.jpg","87","5999.00","product_details.html?pid=15","卡西欧 EX-TR750 数码相机",2,'2020-9-17'
);
   

/* 商品详情页表 */
CREATE TABLE product_Details(
   `pid` INT(11) PRIMARY KEY AUTO_INCREMENT,
   `family_id` INT(11) DEFAULT NULL COMMENT '产品外键ID',
   `title` VARCHAR(64) DEFAULT NULL,
   `stock` INT(4) DEFAULT NULL,
   `spec`  VARCHAR(64) DEFAULT NULL COMMENT '产品规格',
   `price` DECIMAL(8,2) DEFAULT NULL,
   `os`  VARCHAR(32) DEFAULT NULL,
   `RearViewCamera` VARCHAR(32) DEFAULT NULL,
   `batteryCapacity` VARCHAR(32) DEFAULT NULL,
   `memory` VARCHAR(32) DEFAULT NULL,
   `mb` VARCHAR(32) DEFAULT NULL,
   `model` VARCHAR(32) DEFAULT NULL,
   `brand` VARCHAR(32) DEFAULT NULL,
   `size` VARCHAR(25) DEFAULT NULL COMMENT '商品尺寸',
   `function` VARCHAR(25) DEFAULT NULL COMMENT '商品功能',
   `pcolor` VARCHAR(25) DEFAULT NULL COMMENT '商品颜色',
   `cid` INT COMMENT '分类表外键',
   FOREIGN KEY(cid) REFERENCES digit_category(id),
   `details_img` VARCHAR(1024) DEFAULT NULL
);

/* 插入数据 */
INSERT INTO `product_Details` VALUES(
      1,1,"OPPO A33 2GB+16GB内存版",39,"2GB+16GB内存版","658.00","安卓(andriod)","1200万-1999万","2000mAh-4500mAh","2G","16GB","Y8","OPPO",NULL,NULL,NULL,1,
         '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXIeAc83BAAFsDF6D1GY373.jpg\' class=\'w-100\' alt=""/>
            </div>
         </div>
         <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXDaAUjlcAAErQLkHTsI692.jpg\' class=\'w-100\' alt=""/>
         </div>
         </div>
         <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXIiAG5hcAAFvi8CgMB0747.jpg\' class=\'w-100\' alt=""/>
         </div>
         </div>
         '
   ),
   (
      2,1,"OPPO A33 4GB+32GB内存版",45,"4GB+32GB内存版","760.00","安卓(andriod)","1200万-1999万","3000mAh-5000mAh","4G","32GB","R9","OPPO",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXDaAUjlcAAErQLkHTsI692.jpg\' class=\'w-100\' alt=""/>
            </div>
         </div>
         <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXIeAc83BAAFsDF6D1GY373.jpg\' class=\'w-100\' alt=""/>
         </div>
         </div>
         <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXIiAG5hcAAFvi8CgMB0747.jpg\' class=\'w-100\' alt=""/>
         </div>
         </div>
         '
   ),
   (
      3,1,"OPPO A33 6GB+64GB内存版",75,"6GB+64GB内存版","1400.00","安卓(andriod)","2400万-3000万","4000mAh-5999mAh","6G","64GB","R9 PLUS","OPPO",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXIiAG5hcAAFvi8CgMB0747.jpg\' class=\'w-100\' alt=""/>
            </div>
         </div>
         <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXIeAc83BAAFsDF6D1GY373.jpg\' class=\'w-100\' alt=""/>
         </div>
         </div>
         <div>
         <div>
            <img src=\'../public/images/products_details/wKgBS1siXDaAUjlcAAErQLkHTsI692.jpg\' class=\'w-100\' alt=""/>
         </div>
         </div>
         '
   ),
   (
      4,4,"小米MIX 尊享版4GB内存 64GB",60,"4GB+64GB内存版","1988.00","安卓(andriod)","1200万-1999万","3000mAh-4999mAh","4G","64GB","MIX","小米",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXFCADm3QAAQFFDIAmjU836.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKKAZne6AAQLu36yGCo489.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXFGADs2MAAPtAtdN1z0139.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKOAPtYmAAF0xOtc3nM419.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKSAE7OTAACepnLAB3Y332.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
   ),
   (
      5,4,"小米MIX 尊享版6GB内存 128GB",60,"6GB+64GB内存版","2888.00","安卓(andriod)","2000万-2999万","3000mAh-4999mAh","6G","64GB","MIX","小米",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXFCADm3QAAQFFDIAmjU836.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKKAZne6AAQLu36yGCo489.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXFGADs2MAAPtAtdN1z0139.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKOAPtYmAAF0xOtc3nM419.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKSAE7OTAACepnLAB3Y332.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
   ),
   (
      6,4,"小米MIX 尊享版8GB内存 256GB",90,"8GB+256GB内存版","3999.00","安卓(andriod)","3000万-4000万","4300mAh-5600mAh","8G","256GB","MIX","小米",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXFCADm3QAAQFFDIAmjU836.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKKAZne6AAQLu36yGCo489.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXFGADs2MAAPtAtdN1z0139.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKOAPtYmAAF0xOtc3nM419.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXKSAE7OTAACepnLAB3Y332.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
    ),
  (
      7,7,"vivo Y67 全网通 32GB",98,"4GB+32GB内存版","1488.00","安卓(andriod)","1200万-1999万","3000mAh-3999mAh","4G","32GB","Y67","vivo",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXHOABG1iAAVMz2DY1Lk844.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCKAOAZzAAGN7t1zj7s131.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXHSAdA99AASPDIhaSwk910.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCKAVR4-AAMW4GGMNVc668.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCOAWclrAARLPe4qlJM446.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
 ),
 (
      8,7,"vivo Y67 全网通 128GB",97,"6GB+128GB内存版","2188.00","安卓(andriod)","2400万-2999万","3000mAh-4500mAh","6G","128GB","Y67","vivo",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXHOABG1iAAVMz2DY1Lk844.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCKAOAZzAAGN7t1zj7s131.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXHSAdA99AASPDIhaSwk910.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCKAVR4-AAMW4GGMNVc668.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCOAWclrAARLPe4qlJM446.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
   ),
   (
      9,9,"vivo X9Plus 全网通 6GB+",97,"默认","3298.00","安卓(andriod)","2600万-2999万","4000mAh-5999mAh","6G","128GB","X9Plus","vivo",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXB-AKcvMAAKkrXjcTS0686.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXHGAVIUEAAXaGL5wjBI741.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCCAXHzfAARJgkK-GfM136.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXHKAezAsAAOssJoQn5E586.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCGAFYZSAAKPvVNVLjM020.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
   ),
   (
      10,10,"华为 nova 青春版 4GB+64GB",97,"默认","1999.00","安卓(andriod)","1999万-2999万","3000mAh-3999mAh","4G","64GB","Nova","华为",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXD-ABQ7TAAj9Ou1_nDE141.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXJGAZEBAAAONRhKOJuo935.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXECAI9NzAAZRc2wnHfI306.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXECAMg0HAAcq0mP-WL8666.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXCGAFYZSAAKPvVNVLjM020.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
   ),
   (
      11,11,"OPPO R9s Plu128GB内存版",78,"默认","2899.00","安卓(andriod)","1999万-2999万","4000mAh-5999mAh","6G","128GB","R9s Plus","OPPO",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXCyAdo8RAAEOaRN3SGg263.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXH6AfIhCAAFzCrv2WCE730.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXC2AIaRgAAJN9jMIg08685.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXH-AAHX5AAJllNc32pA756.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXH-AD_s9AADRCjSddx0872.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
   ),
   (
      12,12,"小米Note2 6GB内存 64GB",59,"默认","2200.00","安卓(andriod)","2000万及以上","4000mAh-5999mAh","6G","128GB","Note2","小米",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXJqAIyFHAAJn84nr4bE521.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXEiARw2aAAKpjCOe-Qs763.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBTFsiXJqAaGiEAADEhIdXBe0173.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      <div>
         <div>
               <img src=\'../public/images/products_details/wKgBS1siXEmAZfIfAAJPn1m7v5I821.jpg\' class=\'w-100\' alt=""/>
         </div>
      </div>
      '
    ),
    (
      13,13,"华为 Mate 9 6GB+128GB版",98,"默认","3399.00","安卓(andriod)","2000万-3000万","4000mAh-5999mAh","6G","128GB","Mate9","华为",NULL,NULL,NULL,1,
      '<div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXI2AMcZGABE6xsODwoQ285.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      '
    ),
    (
      14,14,"佳能 EOS 700D 单反套机",86,"默认","4999.00",NULL,NULL,NULL,NULL,NULL,"EOS 700D 单反套机","佳能",'133.1×99.8×78.8毫米','旋转屏；触摸屏 光学取景器','黑色',2,
      '<div class=\'mt-3\'>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXGeAbCGYAAHcMhbWaFs546.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXGiAZmSvAAEyyRalD_g462.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXBaARaXqAAF4svIhYo0065.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      '
    ),
    (
      15,15,"卡西欧 EX-TR750 数码相机",99,"默认","5999.00",NULL,NULL,NULL,NULL,NULL,"EXILIM EX-TR750","卡西欧",'3.5英寸','旋转屏；触摸屏 可充电锂离子电池','静谧黑',2,
      '<div class=\'mt-3\'>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXA-AOJOUAAFV_5l6Tuo887.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXBCAatuiAAGdiqIAgSU015.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
            <div>
               <img src=\'../public/images/products_details/wKgBTFsiXGKABT0oAAFz5NLK-us069.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      <div>
            <div>
               <img src=\'../public/images/products_details/wKgBS1siXBGAUFviAAGSOqQJAtQ626.jpg\' class=\'w-100\' alt=""/>
            </div>
      </div>
      '
);


/* product_Details_pics数据表 */

CREATE TABLE `product_Details_pics`(
    `pid` INT PRIMARY KEY AUTO_INCREMENT,
    `product_id` INT DEFAULT NULL,
    `sm` VARCHAR(128) DEFAULT NULL,
    `md` VARCHAR(128) DEFAULT NULL
);

/* 插入数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,1,'public/images/product_Details_pics/wKgADluVzfqAUOAeAAC-WK9zBcs941.jpg','public/images/product_Details_pics/wKgADluVzfqAUOAeAAC-WK9zBcs941.jpg'
   ),
   (
      NULL,1,'public/images/product_Details_pics/wKgBS1rQVkKARAn_AACTBy1u6tU559.jpg','public/images/product_Details_pics/wKgBS1rQVkKARAn_AACTBy1u6tU559.jpg'
   ),
   (
      NULL,1,'public/images/product_Details_pics/wKgBS1rQVkmAXak2AACB2Ph11Ns103.jpg','public/images/product_Details_pics/wKgBS1rQVkmAXak2AACB2Ph11Ns103.jpg'
   ),
   (
      NULL,1,'public/images/product_Details_pics/wKgBS1rQVk-AWJ5wAAAv5axLhXw878.jpg','public/images/product_Details_pics/wKgBS1rQVk-AWJ5wAAAv5axLhXw878.jpg'
   ),
   (
      NULL,1,'public/images/product_Details_pics/wKgBS1rQVlaAGkSPAABDF96ckVQ182.jpg','public/images/product_Details_pics/wKgBS1rQVlaAGkSPAABDF96ckVQ182.jpg'
   ),
   (
      NULL,2,'public/images/product_Details_pics/wKgADluVzfqAUOAeAAC-WK9zBcs941.jpg','public/images/product_Details_pics/wKgADluVzfqAUOAeAAC-WK9zBcs941.jpg'
   ),
   (
      NULL,2,'public/images/product_Details_pics/wKgBS1rQVkKARAn_AACTBy1u6tU559.jpg','public/images/product_Details_pics/wKgBS1rQVkKARAn_AACTBy1u6tU559.jpg'
   ),
   (
      NULL,2,'public/images/product_Details_pics/wKgBS1rQVkmAXak2AACB2Ph11Ns103.jpg','public/images/product_Details_pics/wKgBS1rQVkmAXak2AACB2Ph11Ns103.jpg'
   ),
   (
      NULL,2,'public/images/product_Details_pics/wKgBS1rQVk-AWJ5wAAAv5axLhXw878.jpg','public/images/product_Details_pics/wKgBS1rQVk-AWJ5wAAAv5axLhXw878.jpg'
   ),
   (
      NULL,2,'public/images/product_Details_pics/wKgBS1rQVlaAGkSPAABDF96ckVQ182.jpg','public/images/product_Details_pics/wKgBS1rQVlaAGkSPAABDF96ckVQ182.jpg'
   ),
   (
      NULL,3,'public/images/product_Details_pics/wKgADluVzfqAUOAeAAC-WK9zBcs941.jpg','public/images/product_Details_pics/wKgADluVzfqAUOAeAAC-WK9zBcs941.jpg'
   ),
   (
      NULL,3,'public/images/product_Details_pics/wKgBS1rQVkKARAn_AACTBy1u6tU559.jpg','public/images/product_Details_pics/wKgBS1rQVkKARAn_AACTBy1u6tU559.jpg'
   ),
   (
      NULL,3,'public/images/product_Details_pics/wKgBS1rQVkmAXak2AACB2Ph11Ns103.jpg','public/images/product_Details_pics/wKgBS1rQVkmAXak2AACB2Ph11Ns103.jpg'
   ),
   (
      NULL,3,'public/images/product_Details_pics/wKgBS1rQVk-AWJ5wAAAv5axLhXw878.jpg','public/images/product_Details_pics/wKgBS1rQVk-AWJ5wAAAv5axLhXw878.jpg'
   ),
   (
      NULL,3,'public/images/product_Details_pics/wKgBS1rQVlaAGkSPAABDF96ckVQ182.jpg','public/images/product_Details_pics/wKgBS1rQVlaAGkSPAABDF96ckVQ182.jpg'
);
/* newProduct2的数据添加 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,4,'public/images/product_Details_pics/wKgBS1rQP3WAaYP2AAJYsDnQxqY524_sm.jpg','public/images/product_Details_pics/wKgBS1rQP3WAaYP2AAJYsDnQxqY524_sm.jpg'
   ),
   (
      NULL,4,'public/images/product_Details_pics/wKgBS1rQP3yAQncbAAB_nvbyFXE385.jpg','public/images/product_Details_pics/wKgBS1rQP3yAQncbAAB_nvbyFXE385.jpg'
   ),
   (
      NULL,4,'public/images/product_Details_pics/wKgBS1rQP4KAV5KrAAAwqPFP4eU478.jpg','public/images/product_Details_pics/wKgBS1rQP4KAV5KrAAAwqPFP4eU478.jpg'
   ),
   (
      NULL,4,'public/images/product_Details_pics/wKgBS1rQP4mAciOoAABW_i9qiz4507.jpg','public/images/product_Details_pics/wKgBS1rQP4mAciOoAABW_i9qiz4507.jpg'
   ),
   (
      NULL,4,'public/images/product_Details_pics/wKgBS1rQVJaAOgviAABGJHAehK4764.jpg','public/images/product_Details_pics/wKgBS1rQVJaAOgviAABGJHAehK4764.jpg'
   ),
   (
      NULL,5,'public/images/product_Details_pics/wKgBS1rQP3WAaYP2AAJYsDnQxqY524_sm.jpg','public/images/product_Details_pics/wKgBS1rQP3WAaYP2AAJYsDnQxqY524_sm.jpg'
   ),
   (
      NULL,5,'public/images/product_Details_pics/wKgBS1rQP3yAQncbAAB_nvbyFXE385.jpg','public/images/product_Details_pics/wKgBS1rQP3yAQncbAAB_nvbyFXE385.jpg'
   ),
   (
      NULL,5,'public/images/product_Details_pics/wKgBS1rQP4KAV5KrAAAwqPFP4eU478.jpg','public/images/product_Details_pics/wKgBS1rQP4KAV5KrAAAwqPFP4eU478.jpg'
   ),
   (
      NULL,5,'public/images/product_Details_pics/wKgBS1rQP4mAciOoAABW_i9qiz4507.jpg','public/images/product_Details_pics/wKgBS1rQP4mAciOoAABW_i9qiz4507.jpg'
   ),
   (
      NULL,5,'public/images/product_Details_pics/wKgBS1rQVJaAOgviAABGJHAehK4764.jpg','public/images/product_Details_pics/wKgBS1rQVJaAOgviAABGJHAehK4764.jpg'
   ),(
      NULL,6,'public/images/product_Details_pics/wKgBS1rQP3WAaYP2AAJYsDnQxqY524_sm.jpg','public/images/product_Details_pics/wKgBS1rQP3WAaYP2AAJYsDnQxqY524_sm.jpg'
   ),
   (
      NULL,6,'public/images/product_Details_pics/wKgBS1rQP3yAQncbAAB_nvbyFXE385.jpg','public/images/product_Details_pics/wKgBS1rQP3yAQncbAAB_nvbyFXE385.jpg'
   ),
   (
      NULL,6,'public/images/product_Details_pics/wKgBS1rQP4KAV5KrAAAwqPFP4eU478.jpg','public/images/product_Details_pics/wKgBS1rQP4KAV5KrAAAwqPFP4eU478.jpg'
   ),
   (
      NULL,6,'public/images/product_Details_pics/wKgBS1rQP4mAciOoAABW_i9qiz4507.jpg','public/images/product_Details_pics/wKgBS1rQP4mAciOoAABW_i9qiz4507.jpg'
   ),
   (
      NULL,6,'public/images/product_Details_pics/wKgBS1rQVJaAOgviAABGJHAehK4764.jpg','public/images/product_Details_pics/wKgBS1rQVJaAOgviAABGJHAehK4764.jpg'
);
/* newProduct3的数据添加 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,7,'public/images/product_Details_pics/wKgADluVz9aAN-JCAADf-bX-hFo908.jpg','public/images/product_Details_pics/wKgADluVz9aAN-JCAADf-bX-hFo908.jpg'
   ),
   (
      NULL,7,'public/images/product_Details_pics/wKgBS1rQVu2AO4LCAACo4D6RrA4776.jpg','public/images/product_Details_pics/wKgBS1rQVu2AO4LCAACo4D6RrA4776.jpg'
   ),
   (
      NULL,7,'public/images/product_Details_pics/wKgBS1rQVvuASjgrAAEbFnzehH0927.jpg','public/images/product_Details_pics/wKgBS1rQVvuASjgrAAEbFnzehH0927.jpg'
   ),
   (
      NULL,7,'public/images/product_Details_pics/wKgBS1rQVvSAeQEFAAEbyO3gdoU867.jpg','public/images/product_Details_pics/wKgBS1rQVvSAeQEFAAEbyO3gdoU867.jpg'
   ),
   (
      NULL,7,'public/images/product_Details_pics/wKgBS1rQVwKAZWpMAACyuZ6yLhw023.jpg','public/images/product_Details_pics/wKgBS1rQVwKAZWpMAACyuZ6yLhw023.jpg'
   ),
   (
      NULL,8,'public/images/product_Details_pics/wKgADluVz9aAN-JCAADf-bX-hFo908.jpg','public/images/product_Details_pics/wKgADluVz9aAN-JCAADf-bX-hFo908.jpg'
   ),
   (
      NULL,8,'public/images/product_Details_pics/wKgBS1rQVu2AO4LCAACo4D6RrA4776.jpg','public/images/product_Details_pics/wKgBS1rQVu2AO4LCAACo4D6RrA4776.jpg'
   ),
   (
      NULL,8,'public/images/product_Details_pics/wKgBS1rQVvuASjgrAAEbFnzehH0927.jpg','public/images/product_Details_pics/wKgBS1rQVvuASjgrAAEbFnzehH0927.jpg'
   ),
   (
      NULL,8,'public/images/product_Details_pics/wKgBS1rQVvSAeQEFAAEbyO3gdoU867.jpg','public/images/product_Details_pics/wKgBS1rQVvSAeQEFAAEbyO3gdoU867.jpg'
   ),
   (
      NULL,8,'public/images/product_Details_pics/wKgBS1rQVwKAZWpMAACyuZ6yLhw023.jpg','public/images/product_Details_pics/wKgBS1rQVwKAZWpMAACyuZ6yLhw023.jpg'
);
/* newProduct4的数据添加 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,9,'public/images/product_Details_pics/wKgADFuVz8iATL-JAAB9A4AcEoI832.jpg','public/images/product_Details_pics/wKgADFuVz8iATL-JAAB9A4AcEoI832.jpg'
   ),
   (
      NULL,9,'public/images/product_Details_pics/wKgBS1rQVzKAIRN2AAC4gId6ySg052.jpg','public/images/product_Details_pics/wKgBS1rQVzKAIRN2AAC4gId6ySg052.jpg'
   ),
   (
      NULL,9,'public/images/product_Details_pics/wKgBS1rQVzmAGQD2AAC4gId6ySg182.jpg','public/images/product_Details_pics/wKgBS1rQVzmAGQD2AAC4gId6ySg182.jpg'
   ),
   (
      NULL,9,'public/images/product_Details_pics/wKgBS1rQPgWAOD_lAADq0py1Oh8338.jpg','public/images/product_Details_pics/wKgBS1rQPgWAOD_lAADq0py1Oh8338.jpg'
   ),
   (
      NULL,9,'public/images/product_Details_pics/wKgBS1rQPgyAT1qwAACTFaE5E5A352.jpg','public/images/product_Details_pics/wKgBS1rQPgyAT1qwAACTFaE5E5A352.jpg'
);
/* newProducts5的数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,10,'public/images/product_Details_pics/wKgBS1rQTiiAF3bAAAHk9E6Dcqw608.jpg','public/images/product_Details_pics/wKgBS1rQTiiAF3bAAAHk9E6Dcqw608.jpg'
   ),
   (
      NULL,10,'public/images/product_Details_pics/wKgBS1rQTi-AKb2WAAFNZ0gq2Xw573.jpg','public/images/product_Details_pics/wKgBS1rQTi-AKb2WAAFNZ0gq2Xw573.jpg'
   ),
   (
      NULL,10,'public/images/product_Details_pics/wKgBS1rQTjaAGt9hAADrVaIpZH8708.jpg','public/images/product_Details_pics/wKgBS1rQTjaAGt9hAADrVaIpZH8708.jpg'
   ),
   (
      NULL,10,'public/images/product_Details_pics/wKgBS1rQTj2AXiXnAAAvEtjxLO8492.jpg','public/images/product_Details_pics/wKgBS1rQTj2AXiXnAAAvEtjxLO8492.jpg'
   ),
   (
      NULL,10,'public/images/product_Details_pics/wKgBS1rQTkSAbPDBAAEG-_MdTjk028.jpg','public/images/product_Details_pics/wKgBS1rQTkSAbPDBAAEG-_MdTjk028.jpg'
);
/* newProducts6的数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,11,'public/images/product_Details_pics/wKgADFuVznmANVV_AACWkqUI5sU198.jpg','public/images/product_Details_pics/wKgADFuVznmANVV_AACWkqUI5sU198.jpg'
   ),
   (
      NULL,11,'public/images/product_Details_pics/wKgBS1rQToGAARTwAABsXHeTS84827.jpg','public/images/product_Details_pics/wKgBS1rQToGAARTwAABsXHeTS84827.jpg'
   ),
   (
      NULL,11,'public/images/product_Details_pics/wKgBS1rQToiAMW1kAABFyFyXm4o203.jpg','public/images/product_Details_pics/wKgBS1rQToiAMW1kAABFyFyXm4o203.jpg'
   ),
   (
      NULL,11,'public/images/product_Details_pics/wKgBS1rQTpaAYnnUAABjvk_7z_A526.jpg','public/images/product_Details_pics/wKgBS1rQTpaAYnnUAABjvk_7z_A526.jpg'
);
/* newProducts7的数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,12,'public/images/product_Details_pics/wKgBS1rQVOKAYeHxAAJb5nURnHc579.jpg','public/images/product_Details_pics/wKgBS1rQVOKAYeHxAAJb5nURnHc579.jpg'
   ),
   (
      NULL,12,'public/images/product_Details_pics/wKgBS1rQVOmAA8-NAAHyK2XKd2c137.jpg','public/images/product_Details_pics/wKgBS1rQVOmAA8-NAAHyK2XKd2c137.jpg'
   ),
   (
      NULL,12,'public/images/product_Details_pics/wKgBS1rQVPCANjyQAACqH0RVD2E176.jpg','public/images/product_Details_pics/wKgBS1rQVPCANjyQAACqH0RVD2E176.jpg'
   ),
   (
      NULL,12,'public/images/product_Details_pics/wKgBS1rQVWWAICJsAAAnaIx1FUo501.jpg','public/images/product_Details_pics/wKgBS1rQVWWAICJsAAAnaIx1FUo501.jpg'
);
/* newProducts8的数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,13,'public/images/product_Details_pics/wKgBS1rQVaOAb-BsAAGBqXs6B8A814.jpg','public/images/product_Details_pics/wKgBS1rQVaOAb-BsAAGBqXs6B8A814.jpg'
   ),
   (
      NULL,13,'public/images/product_Details_pics/wKgBS1rQVaqAKWtJAAEgQu4qhSM279.jpg','public/images/product_Details_pics/wKgBS1rQVaqAKWtJAAEgQu4qhSM279.jpg'
   ),
   (
      NULL,13,'public/images/product_Details_pics/wKgBS1rQVbGAAKx8AACYLVGtl38904.jpg','public/images/product_Details_pics/wKgBS1rQVbGAAKx8AACYLVGtl38904.jpg'
   ),
   (
      NULL,13,'public/images/product_Details_pics/wKgBS1rQVbiAXZ1HAADzd19tL-E023.jpg','public/images/product_Details_pics/wKgBS1rQVbiAXZ1HAADzd19tL-E023.jpg'
);
/* newProducts9的数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,14,'public/images/product_Details_pics/wKgBS1rQQuuAD6PbAACo9G3HeoI558.jpg','public/images/product_Details_pics/wKgBS1rQQuuAD6PbAACo9G3HeoI558.jpg'
   ),
   (
      NULL,14,'public/images/product_Details_pics/wKgBS1rQQvKAXue1AAC3zwUbRjg775.jpg','public/images/product_Details_pics/wKgBS1rQQvKAXue1AAC3zwUbRjg775.jpg'
   ),
   (
      NULL,14,'public/images/product_Details_pics/wKgBS1rQQvmAb3EtAACcJyHAL44852.jpg','public/images/product_Details_pics/wKgBS1rQQvmAb3EtAACcJyHAL44852.jpg'
   ),
   (
      NULL,14,'public/images/product_Details_pics/wKgBS1rQQv-AI44mAAC4EdPQ9MY933.jpg','public/images/product_Details_pics/wKgBS1rQQv-AI44mAAC4EdPQ9MY933.jpg'
);
/* newProducts10的数据 */
INSERT INTO `product_Details_pics` VALUES(
      NULL,15,'public/images/product_Details_pics/wKgBS1rQQouANjDpAAEp_2fynWo833.jpg','public/images/product_Details_pics/wKgBS1rQQouANjDpAAEp_2fynWo833.jpg'
   ),
   (
      NULL,15,'public/images/product_Details_pics/wKgBS1rQQpmASsu_AAE0N5b0NH4248.jpg','public/images/product_Details_pics/wKgBS1rQQpmASsu_AAE0N5b0NH4248.jpg'
   ),
   (
      NULL,15,'public/images/product_Details_pics/wKgBS1rQQpKAKyN4AAFJlvjc_7Y094.jpg','public/images/product_Details_pics/wKgBS1rQQpKAKyN4AAFJlvjc_7Y094.jpg'
   ),
   (
      NULL,15,'public/images/product_Details_pics/wKgBS1rQQqCAWNTNAAI9OhmaQ4k422.jpg','public/images/product_Details_pics/wKgBS1rQQqCAWNTNAAI9OhmaQ4k422.jpg'
   ),
   (
      NULL,15,'public/images/product_Details_pics/wKgBS1rQQqeANflHAAB7fjTGTX4234.jpg','public/images/product_Details_pics/wKgBS1rQQqeANflHAAB7fjTGTX4234.jpg'
);
/* 创建购物车信息表 */
CREATE TABLE shop(
   `sid` INT PRIMARY KEY AUTO_INCREMENT COMMENT '自动编号',
   `uid` INT COMMENT '用户ID，外键',
    FOREIGN KEY(uid) REFERENCES dt_user(uid),
   `img` VARCHAR(255) COMMENT '商品图片',
   `title` VARCHAR(25) COMMENT '商品名称',
   `spec` VARCHAR(25) COMMENT '商品规格',
   `price` DECIMAL(8,2) COMMENT '商品价格',
   `num` INT COMMENT '购买数量',
   `total` DECIMAL(8,2) COMMENT '金额'
);



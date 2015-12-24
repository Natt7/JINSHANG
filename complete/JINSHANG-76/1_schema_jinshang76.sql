CREATE DATABASE db;
USE db;

create schema T_COMMON_DEPT_schema
source type CSV
fields(
 "deptid"                type str,
 "deptcd"                type str,
 "deptname"              type str,
 "deptlevel"             type double,
 "deptdesc"              type str,
 "deptorder"             type double,
 "parentdeptid"          type str,
 "level1deptid"          type str,
 "level1deptcd"          type str,
 "level1deptname"        type str,
 "level2deptid"          type str,
 "level2deptcd"          type str,
 "level2deptname"        type str,
 "level3deptid"          type str,
 "level3deptcd"          type str,
 "level3deptname"        type str,
 "level4deptid"          type str,
 "level4deptcd"          type str,
 "level4deptname"        type str,
 "r_record_create_date"  type DATETIME,
 "r_record_create_user"  type str,
 "r_record_update_date"  type DATETIME,
 "r_record_update_user"  type str,
 "r_record_is_deleted"   type double,
 "r_record_change_flag"  type double,
 "deptaddress"           type str,
 "depttype"              type str default value  '22',
 "districtid"            type str,
 "districtname"          type str,
 "belongarea"            type str,
 "firstdis"              type str,
 "opselected"            type str default value '0',
 "opupload"              type str,
 "limittime"             type DATETIME,
 "contractno"            type str,
 "baosaas_customer_name" type str
)
RECORD DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_COMMON_DEPT_parser
TYPE rcd
SCHEMA T_COMMON_DEPT_schema;

CREATE TABLE T_COMMON_DEPT using T_COMMON_DEPT_parser; 

CREATE INDEX T_COMMON_DEPT_index ON TABLE T_COMMON_DEPT PRIMARY KEY(deptid);

CREATE MAP T_COMMON_DEPT_map ON table T_COMMON_DEPT
KEY (deptid) 
VALUE (deptname)
TYPE string;

create schema T_BM_UI_CONFIGURE_schema
source type CSV
fields(
  "manage_no"            type str,
  "deptid"               type str,
  "configure_no"         type str,
  "configure_desc"       type str,
  "configure_grade"      type str,
  "configure_node_no"    type str,
  "cf_value1"            type str,
  "cf_value2"            type str,
  "cf_value3"            type double,
  "cf_value4"            type double,
  "configure_remark"     type str,
  "r_record_create_date" type DATETIME,
  "r_record_create_user" type str,
  "r_record_update_date" type DATETIME,
  "r_record_update_user" type str,
  "r_record_is_deleted"  type double,
  "r_record_change_flag" type double,
  "cf_value5"            type DATETIME
)
RECORD DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_BM_UI_CONFIGURE_parser
TYPE rcd
SCHEMA T_BM_UI_CONFIGURE_schema;

CREATE TABLE T_BM_UI_CONFIGURE using T_BM_UI_CONFIGURE_parser; 

CREATE INDEX T_BM_UI_CONFIGURE_index ON TABLE T_BM_UI_CONFIGURE PRIMARY KEY(manage_no);

CREATE MAP T_BM_UI_CONFIGURE_map ON table T_BM_UI_CONFIGURE
KEY (1) 
VALUE (count(1))
TYPE u64
where configure_no = 'RPCONFIG' and deptid = '101';


create schema T_GG_SJ_GOODS_schema
source type CSV
fields(
 "goodsid"              type str,
 "deptid"               type str,
 "packnum"              type str,
 "barcode"              type str,
 "goodslocid"           type str,
 "stocktype"            type str,
 "ownerid"              type str,
 "ownername"            type str,
 "goodsownermanageno"   type str,
 "inbillid"             type str,
 "goodsownerpackno"     type str,
 "manageno"             type str,
 "feebegindate"         type DATETIME,
 "contractid"           type str,
 "goodsstateno"         type str,
 "goodsstatename"       type str,
 "changeownertimes"     type double default value '0',
 "goodstype"            type str,
 "goodstypename"        type str,
 "kindno"               type str,
 "kindname"             type str,
 "shopsignid"           type str,
 "shopsignname"         type str,
 "prodareaid"           type str,
 "prodareaname"         type str,
 "goodsbatchno"         type str,
 "prodstoveno"          type str,
 "gradenum"             type str,
 "gradenumthick"        type double,
 "gradenumwidth"        type double,
 "gradenumlength"       type double,
 "grossweight"          type double,
 "netweight"            type double,
 "poundweight"          type double,
 "checkweight"          type double,
 "sheetnum"             type double default value '1',
 "unit"                 type str,
 "packtype"             type str,
 "stockareaid"          type str,
 "qualitymemo"          type str,
 "firstinownerid"       type str,
 "firstindate"          type DATETIME,
 "outbillid"            type str,
 "ldglistid"            type str,
 "materialgoodsid"      type str,
 "intype"               type str,
 "outtype"              type str,
 "billstate"            type double,
 "outbilltime"          type DATETIME,
 "memo"                 type str,
 "extsysplanobjectid"   type str,
 "extsyskindid"         type str,
 "extsysshopsignid"     type str,
 "extsysprodareaid"     type str,
 "foreignlistno"        type str,
 "sendflag"             type double,
 "r_record_create_date" type DATETIME,
 "r_record_create_user" type str,
 "r_record_update_date" type DATETIME,
 "r_record_update_user" type str,
 "r_record_is_deleted"  type double,
 "incusttime"           type DATETIME,
 "sidemark"             type str,
 "temp"                 type str,
 "length_product_max"   type double,
 "heat_num"             type str,
 "test_lot_num"         type str,
 "r_record_change_flag" type double,
 "sdprice"              type str,
 "extsysgradenum"       type str,
 "collectionmanname"    type str,
 "lockflag"             type str,
 "check_type"           type str,
 "outdate"              type DATETIME,
 "yfweight"             type double,
 "yfsheet"              type double,
 "pregoodsid"           type str,
 "issplit"              type double,
 "gradenumxh"           type double,
 "gradenumwhdw"         type str,
 "splittime"            type double,
 "isclear"              type double,
 "singlesheetnum"       type double,
 "gradenumhz"           type str,
 "gradenumthickhz"      type double,
 "singlesheet"          type double,
 "loclv1"               type str,
 "singlesheetunit"      type str,
 "dcemp"                type str,
 "qzemp"                type str,
 "dcemp2"               type str,
 "shipno"               type str,
 "shipname"             type str,
 "shipcd"               type str,
 "shiplevel"            type str,
 "cmmemo"               type str,
 "cmmemock"             type str,
 "shopsigncd"           type str,
 "processtypename"      type str,
 "packtypename"         type str,
 "sort_emp"             type str,
 "customerid"           type str,
 "lvgoodsid"            type str,
 "dispersesheet"        type double,
 "dbdeptid"             type str,
 "dbcustomer"           type str,
 "dbgulender"           type str,
 "locked_object"        type str,
 "locked_date"          type DATETIME,
 "unlocked_date"        type DATETIME,
 "preownername"         type str,
 "ply"                  type double default value '0',
 "tdstate"              type str default value '1',
 "opselected"           type str,
 "oplock"               type str,
 "opinupload"           type str,
 "opchangeupload"       type str,
 "opinbatchid"          type str,
 "opchangebatchid"      type str,
 "opinupload_date"      type DATETIME,
 "out_package_status"   type str,
 "out_package_desc"     type str,
 "gmpacktype"           type str,
 "handno"               type str,
 "saveno"               type str,
 "drawno"               type str,
 "dangerouslevel"       type str,
 "acceptancecriteria"   type str,
 "shippingmark"         type str,
 "loclv2"               type str,
 "payedflag"            type str,
 "ordergoodsownerid"    type str,
 "ordergoodsownername"  type str,
 "vf_deptname" type `expr` data type string value  iilmap("T_COMMON_DEPT_map",deptid),
 "vf_count" type `expr` data type string value iilmap("T_BM_UI_CONFIGURE_map",1)
)
RECORD DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_GG_SJ_GOODS_parser
TYPE rcd
SCHEMA T_GG_SJ_GOODS_schema;

CREATE TABLE T_GG_SJ_GOODS using T_GG_SJ_GOODS_parser;

create schema T_GG_SJ_GOODS1_schema
source type CSV
fields(
 "deptid"              type str,
 "vf_deptname"         type str,
 "gradenum"            type str,
 "shopsignid"          type str,
 "shopsignname"        type str,
 "prodareaid"          type str,
 "prodareaname"        type str,
 "kindno"              type str,
 "kindname"            type str,
 "ownername"           type str,
 "goodsownerpackno"    type str,
 "sumnetweight"        type str,
 "sumgrossweight"      type str,
 "sumsheetnum"         type str,
 "vf_count"            type str,
 "vf_countcase"        type str
  )
RECORD DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_GG_SJ_GOODS1_parser
TYPE rcd
SCHEMA T_GG_SJ_GOODS1_schema; 
  
CREATE TABLE T_GG_SJ_GOODS1 using T_GG_SJ_GOODS1_parser;

CREATE INDEX T_GG_SJ_GOODS1_index ON TABLE T_GG_SJ_GOODS1 PRIMARY KEY(goodsownerpackno);

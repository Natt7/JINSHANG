CREATE DATABASE db;
USE db;

create schema T_COMMON_DEPT_schema
source type CSV
fields(
 "DEPTID"                type string,
 "DEPTCD"                type string,
 "DEPTNAME"              type string,
 "DEPTLEVEL"             type double,
 "DEPTDESC"              type string,
 "DEPTORDER"             type double,
 "PARENTDEPTID"          type string,
 "LEVEL1DEPTID"          type string,
 "LEVEL1DEPTCD"          type string,
 "LEVEL1DEPTNAME"        type string,
 "LEVEL2DEPTID"          type string,
 "LEVEL2DEPTCD"          type string,
 "LEVEL2DEPTNAME"        type string,
 "LEVEL3DEPTID"          type string,
 "LEVEL3DEPTCD"          type string,
 "LEVEL3DEPTNAME"        type string,
 "LEVEL4DEPTID"          type string,
 "LEVEL4DEPTCD"          type string,
 "LEVEL4DEPTNAME"        type string,
 "R_RECORD_CREATE_DATE"  type DATETIME,
 "R_RECORD_CREATE_USER"  type string,
 "R_RECORD_UPDATE_DATE"  type DATETIME,
 "R_RECORD_UPDATE_USER"  type string,
 "R_RECORD_IS_DELETED"   type double,
 "R_RECORD_CHANGE_FLAG"  type double,
 "DEPTADDRESS"           type string,
 "DEPTTYPE"              type string default value  '22',
 "DISTRINGICTID"         type string,
 "DISTRINGICTNAME"       type string,
 "BELONGAREA"            type string,
 "FIRSTDIS"              type string,
 "OPSELECTED"            type string default value '0',
 "OPUPLOAD"              type string,
 "LIMITTIME"             type DATETIME,
 "CONTRACTNO"            type string,
 "BAOSAAS_CUSTOMER_NAME" type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_COMMON_DEPT_parser
TYPE rcd
SCHEMA T_COMMON_DEPT_schema;

CREATE TABLE T_COMMON_DEPT using T_COMMON_DEPT_parser; 

CREATE INDEX T_COMMON_DEPT_index ON TABLE T_COMMON_DEPT (DEPTID);

CREATE MAP T_COMMON_DEPT_map ON table T_COMMON_DEPT
KEY (DEPTID) 
VALUE (DEPTNAME)
TYPE string;

create schema T_XTSZ_BIND_schema
source type CSV
fields(
"ROWGUID"         type string,
"SEG_NO"          type string,
"DEPT_ID"         type string,
"OWNER_ID"        type string,
"LOGIN_NAME"      type string,
"REMARK"          type string,
"CREATE_DATE"     type datetime,
"CREATE_PERSON"   type string,
"MODI_DATE"       type datetime,
"MODI_PERSON"     type string,
"ALIVE_FLAG"      type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_XTSZ_BIND_parser
TYPE rcd
SCHEMA T_XTSZ_BIND_schema;

CREATE TABLE T_XTSZ_BIND using T_XTSZ_BIND_parser; 

CREATE INDEX T_XTSZ_BIND_index1 ON TABLE T_XTSZ_BIND(ROWGUID);

CREATE MAP T_XTSZ_BIND_map_1 ON table T_XTSZ_BIND
KEY (DEPT_ID) 
VALUE (1)
TYPE string
where ALIVE_FLAG = '1' AND SEG_NO = '080181';

CREATE MAP T_XTSZ_BIND_map_2 ON table T_XTSZ_BIND
KEY (OWNER_ID) 
VALUE (1)
TYPE string
where ALIVE_FLAG = '1' AND SEG_NO = '080181';

create schema T_GG_SJ_GOODS_schema
source type CSV
fields(
 "GOODSID"              		type string,
 "DEPTID"               		type string,
 "PACKNUM"              		type string,
 "BARCODE"              		type string,
 "GOODSLOCID"           		type string,
 "STOCKTYPE"            		type string,
 "OWNERID"              		type string,
 "OWNERNAME"            		type string,
 "GOODSOWNERMANAGENO"   		type string,
 "INBILLID"             		type string,
 "GOODSOWNERPACKNO"     		type string,
 "MANAGENO"             		type string,
 "FEEBEGINDATE"         		type DATETIME,
 "CONTRACTID"           		type string,
 "GOODSSTATENO"         		type string,
 "GOODSSTATENAME"       		type string,
 "CHANGEOWNERTIMES"     		type double default value '0',
 "GOODSTYPE"            		type string,
 "GOODSTYPENAME"        		type string,
 "KINDNO"               		type string,
 "KINDNAME"             		type string,
 "SHOPSIGNID"           		type string,
 "SHOPSIGNNAME"         		type string,
 "PRODAREAID"           		type string,
 "PRODAREANAME"         		type string,
 "GOODSBATCHNO"         		type string,
 "PRODSTOVENO"          		type string,
 "GRADENUM"             		type string,
 "GRADENUMTHICK"        		type double,
 "GRADENUMWIDTH"        		type double,
 "GRADENUMLENGTH"       		type double,
 "GROSSWEIGHT"          		type double,
 "NETWEIGHT"            		type double,
 "POUNDWEIGHT"          		type double,
 "CHECKWEIGHT"          		type double,
 "SHEETNUM"             		type double default value '1',
 "UNIT"                 		type string,
 "PACKTYPE"             		type string,
 "STOCKAREAID"          		type string,
 "QUALITYMEMO"          		type string,
 "FIRSTINOWNERID"       		type string,
 "FIRSTINDATE"          		type datetime,
 "OUTBILLID"            		type string,
 "LDGLISTID"            		type string,
 "MATERIALGOODSID"      		type string,
 "INTYPE"               		type string,
 "OUTTYPE"              		type string,
 "BILLSTATE"            		type double,
 "OUTBILLTIME"          		type DATETIME,
 "MEMO"                 		type string,
 "EXTSYSPLANOBJECTID"   		type string,
 "EXTSYSKINDID"         		type string,
 "EXTSYSSHOPSIGNID"     		type string,
 "EXTSYSPRODAREAID"     		type string,
 "FOREIGNLISTNO"        		type string,
 "SENDFLAG"             		type double,
 "R_RECORD_CREATE_DATE" 		type DATETIME,
 "R_RECORD_CREATE_USER" 		type string,
 "R_RECORD_UPDATE_DATE" 		type DATETIME,
 "R_RECORD_UPDATE_USER" 		type string,
 "R_RECORD_IS_DELETED"  		type double,
 "INCUSTTIME"           		type DATETIME,
 "SIDEMARK"             		type string,
 "TEMP"                 		type string,
 "LENGTH_PRODUCT_MAX"   		type double,
 "HEAT_NUM"             		type string,
 "TEST_LOT_NUM"         		type string,
 "R_RECORD_CHANGE_FLAG" 		type double,
 "SDPRICE"              		type string,
 "EXTSYSGRADENUM"       		type string,
 "COLLECTIONMANNAME"    		type string,
 "LOCKFLAG"             		type string,
 "CHECK_TYPE"           		type string,
 "OUTDATE"              		type DATETIME,
 "YFWEIGHT"             		type double,
 "YFSHEET"              		type double,
 "PREGOODSID"           		type string,
 "ISSPLIT"              		type double,
 "GRADENUMXH"           		type double,
 "GRADENUMWHDW"         		type string,
 "SPLITTIME"            		type double,
 "ISCLEAR"              		type double,
 "SINGLESHEETNUM"       		type double,
 "GRADENUMHZ"           		type string,
 "GRADENUMTHICKHZ"      		type double,
 "SINGLESHEET"          		type double,
 "LOCLV1"               		type string,
 "SINGLESHEETUNIT"      		type string,
 "DCEMP"                		type string,
 "QZEMP"                		type string,
 "DCEMP2"               		type string,
 "SHIPNO"               		type string,
 "SHIPNAME"             		type string,
 "SHIPCD"               		type string,
 "SHIPLEVEL"            		type string,
 "CMMEMO"               		type string,
 "CMMEMOCK"             		type string,
 "SHOPSIGNCD"           		type string,
 "PROCESSTYPENAME"      		type string,
 "PACKTYPENAME"         		type string,
 "SORT_EMP"             		type string,
 "CUSTOMERID"           		type string,
 "LVGOODSID"            		type string,
 "DISPERSESHEET"        		type double,
 "DBDEPTID"             		type string,
 "DBCUSTOMER"           		type string,
 "DBGULENDER"           		type string,
 "LOCKED_OBJECT"        		type string,
 "LOCKED_DATE"          		type DATETIME,
 "UNLOCKED_DATE"        		type DATETIME,
 "PREOWNERNAME"         		type string,
 "PLY"                  		type double default value '0',
 "TDSTATE"              		type string default value '1',
 "OPSELECTED"           		type string,
 "OPLOCK"               		type string,
 "OPINUPLOAD"           		type string,
 "OPCHANGEUPLOAD"       		type string,
 "OPINBATCHID"          		type string,
 "OPCHANGEBATCHID"      		type string,
 "OPINUPLOAD_DATE"      		type DATETIME,
 "OUT_PACKAGE_STATUS"   		type string,
 "OUT_PACKAGE_DESC"     		type string,
 "GMPACKTYPE"           		type string,
 "HANDNO"               		type string,
 "SAVENO"               		type string,
 "DRAWNO"               		type string,
 "DANGEROUSLEVEL"       		type string,
 "ACCEPTANCECRITERIA"   		type string,
 "SHIPPINGMARK"         		type string,
 "LOCLV2"               		type string,
 "PAYEDFLAG"            		type string,
 "ORDERGOODSOWNERID"    		type string,
 "ORDERGOODSOWNERNAME"  		type string,
 "DEPTNAME" type `expr` data type string value iilmap("T_COMMON_DEPT_map",DEPTID),
 "vf_DEPTID" type `expr` data type string value iilmap("T_XTSZ_BIND_map_1",DEPTID),
 "vf_OWNERID" type `expr` data type string value iilmap("T_XTSZ_BIND_map_2",OWNERID)
 )
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_GG_SJ_GOODS_parser
TYPE rcd
SCHEMA T_GG_SJ_GOODS_schema;

CREATE TABLE T_GG_SJ_GOODS using T_GG_SJ_GOODS_parser; 

create schema T_GG_SJ_GOODS1_schema
source type CSV
fields(
 "DEPTID"              type string,
 "VF_DEPTNAME"         type string,
 "GRADENUM"            type string,
 "SHOPSIGNID"          type string,
 "SHOPSIGNNAME"        type string,
 "PRODAREAID"          type string,
 "PRODAREANAME"        type string,
 "KINDNO"              type string,
 "KINDNAME"            type string,
 "OWNERNAME"           type string,
 "GOODSOWNERPACKNO"    type string,
 "SUMNETWEIGHT"        type string,
 "SUMGROSSWEIGHT"      type string,
 "SUMSHEETNUM"         type string,
 "vf_DEPTID"           type string,
 "vf_OWNERID"          type string
  )
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_GG_SJ_GOODS1_parser
TYPE rcd
SCHEMA T_GG_SJ_GOODS1_schema; 
  
CREATE TABLE T_GG_SJ_GOODS1 using T_GG_SJ_GOODS1_parser;

CREATE INDEX T_GG_SJ_GOODS1_index ON TABLE T_GG_SJ_GOODS1(DEPTID);

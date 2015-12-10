create database db;
use db;

create schema t_common_dept_schema
source type csv
fields(
 "DEPTID"                	type string,
 "DEPTCD"                	type string,
 "DEPTNAME"              	type string,
 "DEPTLEVEL"             	type double,
 "DEPTDESC"              	type string,
 "DEPTORDER"             	type double,
 "PARENTDEPTID"          	type string,
 "LEVEL1DEPTID"          	type string,
 "LEVEL1DEPTCD"          	type string,
 "LEVEL1DEPTNAME"        	type string,
 "LEVEL2DEPTID"          	type string,
 "LEVEL2DEPTCD"          	type string,
 "LEVEL2DEPTNAME"        	type string,
 "LEVEL3DEPTID"          	type string,
 "LEVEL3DEPTCD"          	type string,
 "LEVEL3DEPTNAME"        	type string,
 "LEVEL4DEPTID"          	type string,
 "LEVEL4DEPTCD"          	type string,
 "LEVEL4DEPTNAME"        	type string,
 "R_RECORD_CREATE_DATE"  	type datetime,
 "R_RECORD_CREATE_USER"  	type string,
 "R_RECORD_UPDATE_DATE"  	type datetime,
 "R_RECORD_UPDATE_USER"  	type string,
 "R_RECORD_IS_DELETED"   	type double,
 "R_RECORD_CHANGE_FLAG"  	type double,
 "DEPTADDRESS"           	type string,
 "DEPTTYPE"              	type string default value '22',
 "DISTRINGICTID"         	type string,
 "DISTRINGICTNAME"       	type string,
 "BELONGAREA"            	type string,
 "FIRSTDIS"              	type string,
 "OPSELECTED"            	type string default value '0',
 "OPUPLOAD"              	type string,
 "LIMITTIME"             	type datetime,
 "CONTRACTNO"            	type string,
 "BAOSAAS_CUSTOMER_NAME" 	type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

create parser t_common_dept_parser
type rcd
schema t_common_dept_schema;

create table t_common_dept using t_common_dept_parser; 

create index t_common_dept_index on table t_common_dept (DEPTID);

create map t_common_dept_map on table t_common_dept
key (DEPTID) 
value (DEPTNAME)
type string;

create schema T_BM_UI_CONFIGURE_schema
source type CSV
fields(
  "MANAGE_NO"            type string,
  "DEPTID"               type string,
  "CONFIGURE_NO"         type string,
  "CONFIGURE_DESC"       type string,
  "CONFIGURE_GRADE"      type string,
  "CONFIGURE_NODE_NO"    type string,
  "CF_VALUE1"            type string,
  "CF_VALUE2"            type string,
  "CF_VALUE3"            type double,
  "CF_VALUE4"            type double,
  "CONFIGURE_REMARK"     type string,
  "R_RECORD_CREATE_DATE" type DATETIME,
  "R_RECORD_CREATE_USER" type string,
  "R_RECORD_UPDATE_DATE" type DATETIME,
  "R_RECORD_UPDATE_USER" type string,
  "R_RECORD_IS_DELETED"  type double,
  "R_RECORD_CHANGE_FLAG" type double,
  "CF_VALUE5"            type DATETIME
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_BM_UI_CONFIGURE_parser
TYPE rcd
SCHEMA T_BM_UI_CONFIGURE_schema;

CREATE TABLE T_BM_UI_CONFIGURE using T_BM_UI_CONFIGURE_parser; 

CREATE INDEX T_BM_UI_CONFIGURE_index ON TABLE T_BM_UI_CONFIGURE (MANAGE_NO);

create map c_c_map on table T_BM_UI_CONFIGURE
key (CONFIGURE_NO,DEPTID)
value (COUNT(1))
type string;

create schema t_gg_sj_goods_schema
source type csv
fields(
 "GOODSID"              type string,
 "DEPTID"               type string,
 "PACKNUM"              type string,
 "BARCODE"              type string,
 "GOODSLOCID"           type string,
 "STOCKTYPE"            type string,
 "OWNERID"              type string,
 "OWNERNAME"            type string,
 "GOODSOWNERMANAGENO"   type string,
 "INBILLID"             type string,
 "GOODSOWNERPACKNO"     type string,
 "MANAGENO"             type string,
 "FEEBEGINDATE"         type datetime,
 "CONTRACTID"           type string,
 "GOODSSTATENO"         type string,
 "GOODSSTATENAME"       type string,
 "CHANGEOWNERTIMES"     type double default value '0',
 "GOODSTYPE"            type string,
 "GOODSTYPENAME"        type string,
 "KINDNO"               type string,
 "KINDNAME"             type string,
 "SHOPSIGNID"           type string,
 "SHOPSIGNNAME"         type string,
 "PRODAREAID"           type string,
 "PRODAREANAME"         type string,
 "GOODSBATCHNO"         type string,
 "PRODSTOVENO"          type string,	
 "GRADENUM"             type string,
 "GRADENUMTHICK"        type double,
 "GRADENUMWIDTH"        type double,
 "GRADENUMLENGTH"       type double,
 "GROSSWEIGHT"          type double,
 "NETWEIGHT"            type double,
 "POUNDWEIGHT"          type double,
 "CHECKWEIGHT"          type double,
 "SHEETNUM"             type double default value '1',
 "UNIT"                 type string,
 "PACKTYPE"             type string,
 "STOCKAREAID"          type string,
 "QUALITYMEMO"          type string,
 "FIRSTINOWNERID"       type string,
 "FIRSTINDATE"          type datetime,
 "OUTBILLID"            type string,
 "LDGLISTID"            type string,
 "MATERIALGOODSID"      type string,
 "INTYPE"               type string,
 "OUTTYPE"              type string,
 "BILLSTATE"            type double,
 "OUTBILLTIME"          type datetime,
 "MEMO"                 type string,
 "EXTSYSPLANOBJECTID"   type string,
 "EXTSYSKINDID"         type string,
 "EXTSYSSHOPSIGNID"     type string,
 "EXTSYSPRODAREAID"     type string,
 "FOREIGNLISTNO"        type string,
 "SENDFLAG"             type double, 
 "R_RECORD_CREATE_DATE" type datetime,
 "R_RECORD_CREATE_USER" type string,
 "R_RECORD_UPDATE_DATE" type datetime,
 "R_RECORD_UPDATE_USER" type string,
 "R_RECORD_IS_DELETED"  type double,
 "INCUSTTIME"           type datetime,
 "SIDEMARK"             type string,
 "TEMP"                 type string,
 "LENGTH_PRODUCT_MAX"   type double,
 "HEAT_NUM"             type string,
 "TEST_LOT_NUM"         type string,
 "R_RECORD_CHANGE_FLAG" type double,
 "SDPRICE"              type string,
 "EXTSYSGRADENUM"       type string,
 "COLLECTIONMANNAME"    type string,
 "LOCKFLAG"             type string,
 "CHECK_TYPE"           type string,
 "OUTDATE"              type datetime,
 "YFWEIGHT"             type double,
 "YFSHEET"              type double,
 "PREGOODSID"           type string,
 "ISSPLIT"              type double,
 "GRADENUMXH"           type double,
 "GRADENUMWHDW"         type string,
 "SPLITTIME"            type double,
 "ISCLEAR"              type double,
 "SINGLESHEETNUM"       type double,
 "GRADENUMHZ"           type string,
 "GRADENUMTHICKHZ"      type double,
 "SINGLESHEET"          type double,
 "LOCLV1"               type string,
 "SINGLESHEETUNIT"      type string,
 "DCEMP"                type string,
 "QZEMP"                type string,
 "DCEMP2"               type string,
 "SHIPNO"               type string,
 "SHIPNAME"             type string,
 "SHIPCD"               type string,
 "SHIPLEVEL"            type string,
 "CMMEMO"               type string,
 "CMMEMOCK"             type string,
 "SHOPSIGNCD"           type string,
 "PROCESSTYPENAME"      type string,
 "PACKTYPENAME"         type string,
 "SORT_EMP"             type string,
 "CUSTOMERID"           type string,
 "LVGOODSID"            type string,
 "DISPERSESHEET"        type double,
 "DBDEPTID"             type string,
 "DBCUSTOMER"           type string,
 "DBGULENDER"           type string,
 "LOCKED_OBJECT"        type string,
 "LOCKED_DATE"          type datetime,
 "UNLOCKED_DATE"        type datetime,
 "PREOWNERNAME"         type string,
 "PLY"                  type double default value '0',
 "TDSTATE"              type string default value '1',
 "OPSELECTED"           type string,
 "OPLOCK"               type string,
 "OPINUPLOAD"           type string,
 "OPCHANGEUPLOAD"       type string,
 "OPINBATCHID"          type string,
 "OPCHANGEBATCHID"      type string,
 "OPINUPLOAD_DATE"      type datetime,
 "OUT_PACKAGE_STATUS"   type string,
 "OUT_PACKAGE_DESC"     type string,
 "GMPACKTYPE"           type string,
 "HANDNO"               type string,
 "SAVENO"               type string,
 "DRAWNO"               type string,
 "DANGEROUSLEVEL"       type string,
 "ACCEPTANCECRITERIA"   type string,
 "SHIPPINGMARK"         type string,
 "LOCLV2"               type string,
 "PAYEDFLAG"            type string,
 "ORDERGOODSOWNERID"    type string,
 "ORDERGOODSOWNERNAME"  type string,
 "VF_DEPTNAME" 	type `expr` data type string value iilmap(T_COMMON_DEPT_MAP,deptid),
 "VF_EXIST_C" 	type `expr` data type string value iilmap(c_c_map,'COMM','0301'),
 "VF_EXIST_C" type `expr` data type string value case VF_EXIST_C when 0 then  substr('0301', 0, 2) || '%' else '0301' end
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

create parser t_gg_sj_goods_parser
type rcd
schema t_gg_sj_goods_schema;

create table t_gg_sj_goods using t_gg_sj_goods_parser; 

create index deptid_index on table t_gg_sj_goods (DEPTID);

create statistics model g_sta_model on table t_gg_sj_goods
group by (DEPTID,GRADENUM,SHOPSIGNID,SHOPSIGNNAME,PRODAREAID,PRODAREANAME,KINDNO,KINDNAME,OWNERNAME,GOODSOWNERPACKNO)
MEASURES(sum(NETWEIGHT), sum(GROSSWEIGHT), sum(SHEETNUM));

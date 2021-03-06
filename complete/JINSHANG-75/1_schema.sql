create database db;
use db;

create schema t_common_dept_schema
source type csv
FIELDS(
 "DEPTID"                	TYPE string,
 "DEPTCD"                	TYPE string,
 "DEPTNAME"              	TYPE string,
 "DEPTLEVEL"             	TYPE double,
 "DEPTDESC"              	TYPE string,
 "DEPTORDER"             	TYPE double,
 "PARENTDEPTID"          	TYPE string,
 "LEVEL1DEPTID"          	TYPE string,
 "LEVEL1DEPTCD"          	TYPE string,
 "LEVEL1DEPTNAME"        	TYPE string,
 "LEVEL2DEPTID"          	TYPE string,
 "LEVEL2DEPTCD"          	TYPE string,
 "LEVEL2DEPTNAME"        	TYPE string,
 "LEVEL3DEPTID"          	TYPE string,
 "LEVEL3DEPTCD"          	TYPE string,
 "LEVEL3DEPTNAME"        	TYPE string,
 "LEVEL4DEPTID"          	TYPE string,
 "LEVEL4DEPTCD"          	TYPE string,
 "LEVEL4DEPTNAME"        	TYPE string,
 "R_RECORD_CREATE_DATE"  	TYPE datetime,
 "R_RECORD_CREATE_USER"  	TYPE string,
 "R_RECORD_UPDATE_DATE"  	TYPE datetime,
 "R_RECORD_UPDATE_USER"  	TYPE string,
 "R_RECORD_IS_DELETED"   	TYPE double,
 "R_RECORD_CHANGE_FLAG"  	TYPE double,
 "DEPTADDRESS"           	TYPE string,
 "DEPTTYPE"              	TYPE string default value '22',
 "DISTRINGICTID"         	TYPE string,
 "DISTRINGICTNAME"       	TYPE string,
 "BELONGAREA"            	TYPE string,
 "FIRSTDIS"              	TYPE string,
 "OPSELECTED"            	TYPE string default value '0',
 "OPUPLOAD"              	TYPE string,
 "LIMITTIME"             	TYPE datetime,
 "CONTRACTNO"            	TYPE string,
 "BAOSAAS_CUSTOMER_NAME" 	TYPE string
)
RECORD DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

create parser t_common_dept_parser
type rcd
schema t_common_dept_schema;

create table t_common_dept using t_common_dept_parser; 

create index t_common_dept_index on table t_common_dept PRIMARY KEY(DEPTID);

create map t_common_dept_map on table t_common_dept
key (DEPTID) 
value (DEPTNAME)
type string;

create schema t_gg_sj_goods_schema
source type csv
FIELDS(
 "GOODSID"              TYPE string,
 "DEPTID"               TYPE string,
 "PACKNUM"              TYPE string,
 "BARCODE"              TYPE string,
 "GOODSLOCID"           TYPE string,
 "STOCKTYPE"			type string,
 "OWNERID"              TYPE string,
 "OWNERNAME"            TYPE string,
 "GOODSOWNERMANAGENO"   TYPE string,
 "INBILLID"             TYPE string,
 "GOODSOWNERPACKNO"     TYPE string,
 "MANAGENO"             TYPE string,
 "FEEBEGINDATE"         TYPE datetime,
 "CONTRACTID"           TYPE string,
 "GOODSSTATENO"         TYPE string,
 "GOODSSTATENAME"       TYPE string,
 "CHANGEOWNERTIMES"     TYPE double default value '0',
 "GOODSTYPE"            TYPE string,
 "GOODSTYPENAME"        TYPE string,
 "KINDNO"               TYPE string,
 "KINDNAME"             TYPE string,
 "SHOPSIGNID"           TYPE string,
 "SHOPSIGNNAME"         TYPE string,
 "PRODAREAID"           TYPE string,
 "PRODAREANAME"         TYPE string,
 "GOODSBATCHNO"         TYPE string,
 "PRODSTOVENO"          TYPE string,	
 "GRADENUM"             TYPE string,
 "GRADENUMTHICK"        TYPE double,
 "GRADENUMWIDTH"        TYPE double,
 "GRADENUMLENGTH"       TYPE double,
 "GROSSWEIGHT"          TYPE double,
 "NETWEIGHT"            TYPE double,
 "POUNDWEIGHT"          TYPE double,
 "CHECKWEIGHT"          TYPE double,
 "SHEETNUM"             TYPE double default value '1',
 "UNIT"                 TYPE string,
 "PACKTYPE"             TYPE string,
 "STOCKAREAID"          TYPE string,
 "QUALITYMEMO"          TYPE string,
 "FIRSTINOWNERID"       TYPE string,
 "FIRSTINDATE"          TYPE datetime,
 "OUTBILLID"            TYPE string,
 "LDGLISTID"            TYPE string,
 "MATERIALGOODSID"      TYPE string,
 "INTYPE"  				type string,
 "OUTTYPE"              TYPE string,
 "BILLSTATE"            TYPE double,
 "OUTBILLTIME"          TYPE datetime,
 "MEMO"                 TYPE string,
 "EXTSYSPLANOBJECTID"   TYPE string,
 "EXTSYSKINDID"         TYPE string,
 "EXTSYSSHOPSIGNID"     TYPE string,
 "EXTSYSPRODAREAID"     TYPE string,
 "FOREIGNLISTNO"        TYPE string,
 "SENDFLAG"             TYPE double,
 "R_RECORD_CREATE_DATE" TYPE datetime,
 "R_RECORD_CREATE_USER" TYPE string,
 "R_RECORD_UPDATE_DATE" TYPE datetime,
 "R_RECORD_UPDATE_USER" TYPE string,
 "R_RECORD_IS_DELETED"  TYPE double,
 "INCUSTTIME"           TYPE datetime,
 "SIDEMARK"             TYPE string,
 "TEMP"                 TYPE string,
 "LENGTH_PRODUCT_MAX"   TYPE double,
 "HEAT_NUM"             TYPE string,
 "TEST_LOT_NUM"         TYPE string,
 "R_RECORD_CHANGE_FLAG" TYPE double,
 "SDPRICE"              TYPE string,
 "EXTSYSGRADENUM"       TYPE string,
 "COLLECTIONMANNAME"    TYPE string,
 "LOCKFLAG"             TYPE string,
 "CHECK_TYPE"           TYPE string,
 "OUTDATE"              TYPE datetime,
 "YFWEIGHT"             TYPE double,
 "YFSHEET"              TYPE double,
 "PREGOODSID"           TYPE string,
 "ISSPLIT"              TYPE double,
 "GRADENUMXH"           TYPE double,
 "GRADENUMWHDW"         TYPE string,
 "SPLITTIME"            TYPE double,
 "ISCLEAR"              TYPE double,
 "SINGLESHEETNUM"       TYPE double,
 "GRADENUMHZ"           TYPE string,
 "GRADENUMTHICKHZ"      TYPE double,
 "SINGLESHEET"          TYPE double,
 "LOCLV1"               TYPE string,
 "SINGLESHEETUNIT"      TYPE string,
 "DCEMP"                TYPE string,
 "QZEMP"                TYPE string,
 "DCEMP2"               TYPE string,
 "SHIPNO"               TYPE string,
 "SHIPNAME"             TYPE string,
 "SHIPCD"               TYPE string,
 "SHIPLEVEL"            TYPE string,
 "CMMEMO"               TYPE string,
 "CMMEMOCK"             TYPE string,
 "SHOPSIGNCD"           TYPE string,
 "PROCESSTYPENAME"      TYPE string,
 "PACKTYPENAME"         TYPE string,
 "SORT_EMP"             TYPE string,
 "CUSTOMERID"           TYPE string,
 "LVGOODSID"            TYPE string,
 "DISPERSESHEET"        TYPE double,
 "DBDEPTID"             TYPE string,
 "DBCUSTOMER"           TYPE string,
 "DBGULENDER"           TYPE string,
 "LOCKED_OBJECT"        TYPE string,
 "LOCKED_DATE"          TYPE datetime,
 "UNLOCKED_DATE"        TYPE datetime,
 "PREOWNERNAME"         TYPE string,
 "PLY"                  TYPE double default value '0',
 "TDSTATE"              type string default value '1',
 "OPSELECTED"           TYPE string,
 "OPLOCK"               TYPE string,
 "OPINUPLOAD"           TYPE string,
 "OPCHANGEUPLOAD"       TYPE string,
 "OPINBATCHID"          TYPE string,
 "OPCHANGEBATCHID"      TYPE string,
 "OPINUPLOAD_DATE"      TYPE datetime,
 "OUT_PACKAGE_STATUS"   TYPE string,
 "OUT_PACKAGE_DESC"     TYPE string,
 "GMPACKTYPE"           TYPE string,
 "HANDNO"               TYPE string,
 "SAVENO"               TYPE string,
 "DRAWNO"               TYPE string,
 "DANGEROUSLEVEL"       TYPE string,
 "ACCEPTANCECRITERIA"   TYPE string,
 "SHIPPINGMARK"         TYPE string,
 "LOCLV2"               TYPE string,
 "PAYEDFLAG"            TYPE string,
 "ORDERGOODSOWNERID"    TYPE string,
 "ORDERGOODSOWNERNAME"  TYPE string,
 "VF_DEPTNAME" type `expr` data type string value iilmap("t_common_dept_map",DEPTID)
 )
RECORD DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

create parser t_gg_sj_goods_parser
type rcd
schema t_gg_sj_goods_schema;

create table t_gg_sj_goods using t_gg_sj_goods_parser; 

create index t_gg_sj_goods_index on table t_gg_sj_goods PRIMARY KEY(GOODSID);

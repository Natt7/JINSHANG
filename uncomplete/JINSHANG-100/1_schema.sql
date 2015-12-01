create database db;
use db;

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
 "CREATDATE" type `expr` data type datetime value  iilmap("T_ZY_CK_CLEAR_map",GOODSID)
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_GG_SJ_GOODS_parser
TYPE rcd
SCHEMA T_GG_SJ_GOODS_schema;

CREATE TABLE T_GG_SJ_GOODS using T_GG_SJ_GOODS_parser; 

create schema T_ZY_RK_INBILLDETAIL_schema
source type CSV
fields(
  "GOODSID"              type string not null,
  "DEPTID"               type string not null,
  "PACKNUM"              type string,
  "BARCODE"              type string,
  "GOODSLOCID"           type string,
  "STOCKTYPE"            type string,
  "OWNERID"              type string,
  "OWNERNAME"            type string,
  "GOODSOWNERMANAGENO"   type string,
  "INBILLID"             type string,
  "GOODSOWNERPACKNO"     type string,
  "MANAGENO"             type string not null,
  "FEEBEGINDATE"         type datetime,
  "CONTRACTID"           type string,
  "GOODSSTATENO"         type string,
  "GOODSSTATENAME"       type string,
  "CHANGEOWNERTIMES"     type double,
  "GOODSTYPE"            type string,
  "GOODSTYPENAME"        type string,
  "KINDNO"               type string,
  "KINDNAME"            type string,
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
  "SHEETNUM"             type double,
  "UNIT"                 type string,
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
  "SENDFLAG"             type double,
  "R_RECORD_CREATE_DATE" type datetime,
  "R_RECORD_CREATE_USER" type string,
  "R_RECORD_UPDATE_DATE" type datetime,
  "R_RECORD_UPDATE_USER" type string,
  "R_RECORD_IS_DELETED"  type double,
  "INCUSTTIME"           type datetime,
  "FOREIGNLISTNO"        type string,
  "SIDEMARK"             type string,
  "LENGTH_PRODUCT_MAX"   type double,
  "R_RECORD_CHANGE_FLAG" type double,
  "SDPRICE"              type string,
  "INBILLEMPNAME"        type string,
  "EXTSYSGRADENUM"       type string,
  "HEAT_NUM"             type string,
  "ERRORMESSAGE"         type string,
  "CHECK_TYPE"           type string,
  "OUTDATE"              type datetime,
  "YFWEIGHT"             type double,
  "YFSHEET"              type double,
  "PREGOODSID"           type string,
  "SINGLESHEETNUM"       type double,
  "GRADENUMHZ"           type string,
  "GRADENUMTHICKHZ"      type double,
  "SINGLESHEET"          type double,
  "GRADENUMXH"           type double,
  "SHIPNO"               type string,
  "SHIPNAME"             type string,
  "SHIPCD"               type string,
  "SHIPLEVEL"            type string,
  "SORT_EMP"             type string,
  "DBRKFLAG"             type double,
  "DBCKFLAG"             type double,
  "DBOWNER"              type string,
  "DBGOODSID"            type string,
  "DISPERSESHEET"        type double,
  "PLY"                  type double,
  "OUT_PACKAGE_STATUS"   type string,
  "OUT_PACKAGE_DESC"     type string,
  "GMPACKTYPE"           type string,
  "HANDNO"               type string,
  "SAVENO"               type string,
  "DANGEROUSLEVEL"       type string,
  "ACCEPTANCECRITERIA"   type string,
  "SHIPPINGMARK"         type string,
  "GRADENUMWHDW"         type string,
  "LOCLV2"               type string,
  "PACKTYPE"             type string,
  "PAYEDFLAG"            type string,
  "COLLECTIONMANNAME"    type string,
  "LOCLV1"               type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_RK_INBILLDETAIL_parser
TYPE rcd
SCHEMA T_ZY_RK_INBILLDETAIL_schema;

CREATE TABLE T_ZY_RK_INBILLDETAIL using T_ZY_RK_INBILLDETAIL_parser; 

create schema T_ZY_JG_PROCARTICLEDTL_schema
source type CSV
fields(
  "PROCARTICLEDTLID"     type string not null,
  "DEPTID"               type string not null,
  "PROCESSID"            type string,
  "PACKNUM"              type string,
  "BARCODE"              type string,
  "GOODSLOCID"           type string,
  "OWNERID"              type string,
  "OWNERNAME"            type string,
  "GOODSOWNERMANAGENO"   type string,
  "GOODSOWNERPACKNO"     type string,
  "MANAGENO"             type string  not null,
  "FEEBEGINDATE"         type datetime,
  "CONTRACTID"           type string,
  "GOODSSTATENO"         type string,
  "GOODSSTATENAME"       type string,
  "CHANGEOWNERTIMES"     type double,
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
  "SHEETNUM"             type double,
  "PACKTYPE"             type string,
  "PACKTYPENAME"         type string,
  "UNIT"                 type string,
  "QUALITYMEMO"          type string,
  "FIRSTINOWNERID"       type string,
  "FIRSTINDATE"          type datetime,
  "PRINTFLAG"            type string,
  "QUALITY"              type string,
  "QAMEMBER"             type string,
  "QAFLAG"               type string,
  "PROCESSQUALITYID"     type string,
  "R_RECORD_CREATE_DATE" type datetime,
  "R_RECORD_CREATE_USER" type string,
  "R_RECORD_UPDATE_DATE" type datetime,
  "R_RECORD_UPDATE_USER" type string,
  "R_RECORD_IS_DELETED"  type double,
  "ORDERBY"              type double,
  "R_RECORD_CHANGE_FLAG" type double,
  "INSTRUCTION_ID"       type string,
  "SENDFLAG"             type double,
  "ACCEPTANCE_TIMES"     type double,
  "ACCEPTANCER"          type string,
  "ACCEPTANCE_TIME"      type datetime,
  "SKINWEIGHT"           type double,
  "CYYWEIGHT"            type double,
  "GOODSID"              type string,
  "ARTICLEMEMO1"         type string,
  "ARTICLEMEMO2"         type string,
  "ARTICLEMEMO3"         type string,
  "ARTICLEMEMO4"         type string,
  "ARTICLEMEMO5"         type string,
  "ARTICLEMEMO6"         type string,
  "ARTICLEMEMO7"         type string,
  "ARTICLEMEMO8"         type string,
  "ARTICLEMEMO9"         type string,
  "ARTICLEMEMO10"        type string,
  "ARTICLEYS"            type string,
  "CUSTOMERID"           type string,
  "CBXJGTYPE"            type string,
  "WALLWIDTH"            type double,
  "WOODTYPE"             type string,
  "WOODTYPENAME"         type string,
  "CHANXIAN"             type string,
  "DRAWNO"               type string,
  "ZCFLAG"               type string ,
  "CLASSGROUP"           type string,
  "LOCLV1"               type string,
  "LOCLV2"               type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_JG_PROCARTICLEDTL_parser
TYPE rcd
SCHEMA T_ZY_JG_PROCARTICLEDTL_schema;

CREATE TABLE T_ZY_JG_PROCARTICLEDTL using T_ZY_JG_PROCARTICLEDTL_parser; 

create schema T_ZY_GH_CHANGEOWNERLIST_schema
source type CSV
fields(
 "CHANGEOWNERID"        	type string not null,
 "DEPTID"               	type string not null,
 "PROOWNERNAME"         	type string,
 "PREOWNERNO"           	type string,
 "CONTRACTNO"           	type string,
 "PREMANAGENUM"         	type string,
 "NEWOWNERNAME"         	type string,
 "NEWOWNERNO"           	type string,
 "NEWMANAGENUM"         	type string,
 "CHANGEDATE"           	type datetime,
 "GETBIILLDATE"         	type datetime,
 "FOREIGNLISTNO"        	type string,
 "ORDERLISTNO"          	type string,
 "OUTCARBILLTIME"       	type datetime,
 "OUTCARBILLEMPNO"      	type string,
 "OUTCARBILLEMPNAME"    	type string,
 "OUTCARBILLMEMO"       	type string,
 "R_RECORD_CREATE_DATE" 	type datetime,
 "R_RECORD_CREATE_USER" 	type string,
 "R_RECORD_UPDATE_DATE" 	type datetime,
 "R_RECORD_UPDATE_USER" 	type string,
 "R_RECORD_IS_DELETED"  	type double,
 "NETWEIGHTSUM"         	type double,
 "GROSSWEIGHTSUM"       	type double,
 "SHEETNUMSUM"          	type double,
 "ORIGINSETTLE"         	type double,
 "R_RECORD_CHANGE_FLAG" 	type double,
 "ISSPLIT"              	type double,
 "OUTPASSWORD"          	type string,
 "INVOICEKINDID"        	type string,
 "INVOICEKINDNAME"      	type string,
 "SORTEMP"              	type string,
 "SORTEMPTELE"          	type string,
 "SETTLESTATUS"         	type string,
 "CONFIRM_DATE"         	type datetime,
 "CONFIRM_EMP"          	type string,
 "CONFIRM_FLAG"         	type string,
 "DTLCOUNT"             	type double,
 "ISSETTLED"            	type double,
 "JFSENDFLAG"           	type double,
 "JYZXFLAG"             	type double,
 "SENDMESSAGE"          	type string,
 "JYZXCHECKDATE"        	type datetime,
 "JYZXCHECKFLAG"        	type double,
 "IDCODE"               	type string,
 "USERNAME"             	type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_GH_CHANGEOWNERLIST_parser
TYPE rcd
SCHEMA T_ZY_GH_CHANGEOWNERLIST_schema;

CREATE TABLE T_ZY_GH_CHANGEOWNERLIST using T_ZY_GH_CHANGEOWNERLIST_parser; 

create schema T_ZY_GH_CHANGEOWNERDETAIL_schema
source type CSV
fields(
  "MANAGENO"               type string not null,
  "DEPTID"                 type string not null,
  "CHANGEOWNERNO"          type string,
  "PACKNUM"                type string,
  "GOODSID"                type string,
  "INBEGINTIME"            type datetime,
  "BARCODE"                type string,
  "GOODSLOCID"             type string,
  "OWNERNAME"              type string,
  "OWNERNO"                type string,
  "PREGOODSOWNERMANAGENUM" type string,
  "GOODSOWNERMANAGENUM"    type string,
  "GOODSOWNERPACKNUM"      type string,
  "PREMANAGENUM"           type string,
  "MANAGENUM"              type string,
  "CONTRACTNO"             type string,
  "GOODSSTATENAME"         type string,
  "GOODSSTATENO"           type string,
  "GOODSTYPENAME"          type string,
  "GOODSTYPE"              type string,
  "KINDNAME"               type string,
  "KINDNO"                 type string,
  "SHOPSIGNNAME"           type string,
  "SHOPSIGNID"             type string,
  "PRODAREANAME"           type string,
  "PRODAREAID"             type string,
  "GOODSBATCHNUM"          type string,
  "GRADENUM"               type string,
  "GRADENUMTHICK"          type double,
  "GRADENUMWIDTH"          type double,
  "GRADENUMLENGTH"         type double,
  "GROSSWEIGHT"            type double,
  "NETWEIGHT"              type double,
  "POUNDWEIGHT"            type double,
  "CHECKWEIGHT"            type double,
  "SHEETNUM"               type double,
  "QUALITYMEMO"            type string,
  "FIRSTINOWNERID"         type string,
  "FIRSTINDATE"            type datetime,
  "INBILLID"               type string,
  "INTYPE"                 type string,
  "PREMEMO"                type string,
  "MEMO"                   type string,
  "FOREIGNLISTNO"          type string,
  "PREFOREIGNLISTNO"       type string,
  "ORDERLISTNO"            type string,
  "PREORDERLISTNO"         type string,
  "R_RECORD_CREATE_DATE"   type datetime,
  "R_RECORD_CREATE_USER"   type string,
  "R_RECORD_UPDATE_DATE"   type datetime,
  "R_RECORD_UPDATE_USER"   type string,
  "R_RECORD_IS_DELETED"    type double,
  "PREINCUSTTIME"          type datetime,
  "INCUSTTIME"             type datetime,
  "SENDFLAG"               type double,
  "OUTCHANGESENDFLAG"      type double,
  "CHANGETIMES"            type double,
  "ORIGINOWNERNAME"        type string,
  "ORIGINOWNERNO"          type string,
  "R_RECORD_CHANGE_FLAG"   type double,
  "CUSTDAY"                type double,
  "SDPRICE"                type string,
  "NEWDATE"                type datetime,
  "PREGOODSID"             type string,
  "CHECK_TYPE"             type string,
  "SINGLESHEETNUM"         type double,
  "GRADENUMXH"             type double,
  "SIDEMARK"               type string,
  "SORT_EMP"               type string,
  "DISPERSESHEET"          type double,
  "PLY"                    type double ,
  "ORIGINSHEETNUM"         type double,
  "ORIGINNETWEIGHT"        type double,
  "ISSPLIT"                type double,
  "GMPACKTYPE"             type string,
  "PREFOREIGNLISTCODE"     type string,
  "CONFIRMFLAG"            type string ,
  "JYZXFLAG"               type double,
  "LOCLV1"                 type string,
  "LOCLV2"                 type string,
  "OUTNETWEIGHT"           type double
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_GH_CHANGEOWNERDETAIL_parser
TYPE rcd
SCHEMA T_ZY_GH_CHANGEOWNERDETAIL_schema;

CREATE TABLE T_ZY_GH_CHANGEOWNERDETAIL using T_ZY_GH_CHANGEOWNERDETAIL_parser; 

create schema T_ZY_CK_OUTPACK_schema
source type CSV
fields(
  "OUTPACKID"            type string not null,
  "DEPTID"               type string not null,
  "OUTBILLNO"            type string not null,
  "GOODSID"              type string,
  "PACKNUM"              type string,
  "BARCODE"              type string,
  "GOODSLOCID"           type string,
  "OWNERNAME"            type string,
  "OWNERNO"              type string,
  "GOODSOWNERMANAGENUM"  type string,
  "GOODSOWNERPACKNUM"    type string,
  "MANAGENUM"            type string,
  "INBEGINTIME"          type datetime,
  "CONTRACTNO"           type string,
  "OLDGOODSSTATENAME"    type string,
  "OLDGOODSSTATENO"      type string,
  "GOODSSTATENAME"       type string,
  "GOODSSTATENO"         type string,
  "GOODSTYPENAME"        type string,
  "GOODSTYPE"            type string,
  "KINDNAME"             type string,
  "KINDNO"               type string,
  "SHOPSIGNNAME"         type string,
  "SHOPSIGNID"           type string,
  "PRODAREANAME"         type string,
  "PRODAREAID"           type string,
  "GOODSBATCHNUM"        type string,
  "GRADENUM"             type string,
  "GRADENUMTHICK"        type double,
  "GRADENUMWIDTH"        type double,
  "GRADENUMLENGTH"       type double,
  "GROSSWEIGHT"          type double,
  "OUTGROSSWEIGHT"       type double,
  "OUTNETWEIGHT"         type double,
  "NETWEIGHT"            type double,
  "POUNDWEIGHT"          type double,
  "CHECKWEIGHT"          type double,
  "SHEETNUM"             type double,
  "PACKTYPE"             type string,
  "QUALITYMEMO"          type string,
  "FIRSTINOWNERID"       type string,
  "FIRSTINDATE"          type datetime,
  "INBILLID"             type string,
  "MATERIALGOODSID"      type string,
  "INTYPE"               type string,
  "MEMO"                 type string,
  "CUSTBILL"             type string,
  "SENDFLAG"             type double,
  "VELFLAG"              type double,
  "R_RECORD_CREATE_DATE" type datetime,
  "R_RECORD_CREATE_USER" type string,
  "R_RECORD_UPDATE_DATE" type datetime,
  "R_RECORD_UPDATE_USER" type string,
  "R_RECORD_IS_DELETED"  type double,
  "FOREIGNLISTNO"        type string,
  "CREATEID"             type string,
  "CREATERNAME"          type string,
  "SIDEMARK"             type string,
  "STOCKTYPE"            type string,
  "OUTBILLPICKOWNERNAME" type string,
  "R_RECORD_CHANGE_FLAG" type double,
  "INCUSTTIME"           type datetime,
  "CUSTDAY"              type double,
  "SDPRICE"              type string,
  "OUTTYPE"              type string,
  "EXTSYSKINDID"         type string,
  "EXTSYSSHOPSIGNID"     type string,
  "EXTSYSGRADENUM"       type string,
  "PRODSTOVENO"          type string,
  "CHECK_TYPE"           type string,
  "SINGLESHEETNUM"       type double,
  "SINGLESHEET"          type double,
  "GRADENUMXH"           type double,
  "OUTBILLPICKOWNERNO"   type string,
  "OUTPASSWORD"          type string,
  "SHIPNO"               type string,
  "SHIPNAME"             type string,
  "SHIPCD"               type string,
  "SHIPLEVEL"            type string,
  "SORT_EMP"             type string,
  "LENGTH_PRODUCT_MAX"   type double,
  "PACKTYPENAME"         type string,
  "DBCKFLAG"             type double,
  "DBOWNER"              type string,
  "DISPERSESHEET"        type double,
  "OUTCARNO"             type string,
  "OUTCUSTTIME"          type datetime,
  "PLY"                  type double,
  "ORIGINOUTSHEETNUM"    type double,
  "OUTSHEETNUM"          type double,
  "ORIGINOUTNETWEIGHT"   type double,
  "ISSPLIT"              type double,
  "PREFOREIGNLISTNO"     type string,
  "DRAWNO"               type string,
  "HANDNO"               type string,
  "SAVENO"               type string,
  "LOCLV2"               type string,
  "GRADENUMWHDW"         type string,
  "OPTFLAG"              type double,
  "PAYEDFLAG"            type string,
  "SALE_PRICE_AT"        type double,
  "PRICE"                type double,
  "CHANGEOWNERTIMES"     type double,
  "CONTRACT_ID"          type string,
  "CONTRACT_SUBID"       type string,
  "JYZXFLAG"             type double,
  "OUTBILLDATE"          type datetime,
  "ROLLPLY"              type double,
  "READYOUT"             type datetime,
  "VALIDDATE"            type datetime,
  "LOCKCOUNT"            type double ,
  "LOCLV1"               type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_CK_OUTPACK_parser
TYPE rcd
SCHEMA T_ZY_CK_OUTPACK_schema;

CREATE TABLE T_ZY_CK_OUTPACK using T_ZY_CK_OUTPACK_parser; 

create schema T_ZY_CK_CLEAR_schema
source type CSV
fields(
  "CLEARNO"              type string,
  "DEPTID"               type string,
  "PACKNUM"              type string,
  "GOODSID"              type string not null,
  "CREATDATE"            type datetime,
  "OPERATER"             type string,
  "MEMO"                 type string,
  "R_RECORD_CREATE_DATE" type datetime,
  "R_RECORD_CREATE_USER" type string,
  "R_RECORD_UPDATE_DATE" type datetime,
  "R_RECORD_UPDATE_USER" type string,
  "R_RECORD_IS_DELETED"  type double,
  "R_RECORD_CHANGE_FLAG" type double
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_CK_CLEAR_parser
TYPE rcd
SCHEMA T_ZY_CK_CLEAR_schema;

CREATE TABLE T_ZY_CK_CLEAR using T_ZY_CK_CLEAR_parser; 

create index T_ZY_CK_CLEAR_index on table T_ZY_CK_CLEAR(GOODSID);

create map T_ZY_CK_CLEAR_map on table T_ZY_CK_CLEAR
KEY (GOODSID)
VALUE (CREATDATE)
TYPE datetime
WHERE CREATDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d');

create schema T_ZY_JG_PROCMATERIALDTL_schema
source type CSV
fields(
 "PROCMATERIALDTLID"    type string not null,
 "DEPTID"               type string not null,
 "PROCESSID"            type string,
 "PACKNUM"              type string,
 "GOODSID"              type string,
 "BARCODE"              type string,
 "GOODSLOCID"           type string,
 "OWNERID"              type string,
 "OWNERNAME"            type string,
 "GOODSOWNERMANAGENO"   type string,
 "GOODSOWNERPACKNO"     type string,
 "MANAGENO"             type string,
 "FEEBEGINDATE"         type datetime,
 "CONTRACTID"           type string,
 "GOODSSTATENO"         type string,
 "GOODSSTATENAME"       type string,
 "CHANGEOWNERTIMES"     type double,
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
 "SHEETNUM"             type double,
 "PACKTYPE"             type string,
 "PACKTYPENAME"         type string,
 "UNIT"                 type string,
 "QUALITYMEMO"          type string,
 "FIRSTINOWNERID"       type string,
 "FIRSTINDATE"          type datetime,
 "INBILLID"             type string,
 "INTYPE"               type string,
 "R_RECORD_CREATE_DATE" type datetime,
 "R_RECORD_CREATE_USER" type string,
 "R_RECORD_UPDATE_DATE" type datetime,
 "R_RECORD_UPDATE_USER" type string,
 "R_RECORD_IS_DELETED"  type double,
 "ORDERBY"              type double,
 "R_RECORD_CHANGE_FLAG" type double,
 "SHOPSIGNCD"           type string,
 "CUSTOMERID"           type string,
 "CHANXIAN"             type string,
 "PLY"                  type double,
 "MEMO"                 type string,
 "JYZXFLAG"             type double,
 "LOCLV1"               type string,
 "LOCLV2"               type string,
 "SPECIALMEMO"          type string,
 "vf_PROCESSID" type `expr` data type string value  iilmap("PROCESSID_map",PROCESSID),
 "vf_DEPTID" type `expr` data type string value  iilmap("DEPTID_map",DEPTID)
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_JG_PROCMATERIALDTL_parser
TYPE rcd
SCHEMA T_ZY_JG_PROCMATERIALDTL_schema;

CREATE TABLE T_ZY_JG_PROCMATERIALDTL using T_ZY_JG_PROCMATERIALDTL_parser; 

create schema T_ZY_JG_PROCESS_schema
source type CSV
fields(
 "PROCESSID"            type string not null,
 "DEPTID"               type string,
 "CUSTOMERID"           type string,
 "PROCESSDEPT"          type string,
 "PROCESSDEPTNAME"      type string,
 "PROCESSTYPE"          type string,
 "PROCESSTYPENAME"      type string,
 "PROCESSMOLD"          type string,
 "PROCESSMOLDNAME"      type string,
 "PROCESSSTATE"         type double,
 "PLANENDDATE"          type datetime,
 "KINDNO"               type string,
 "KINDNAME"             type string,
 "PACKTYPE"             type string,
 "PACKTYPENAME"         type string,
 "WOODTYPE"             type string,
 "WOODTYPENAME"         type string,
 "STRAPTYPE"            type string,
 "STRAPTYPENAME"        type string,
 "PROCESSPRECISION"     type string,
 "ORDERINFO"            type string,
 "FEE"                  type double,
 "LENGTH"               type double,
 "WEIGTHT"              type double,
 "SHEET"                type double,
 "PIECENUM"             type double,
 "OUTCARBILLTIME"       type datetime,
 "OUTCARBILLEMPNO"      type string,
 "OUTCARBILLEMPNAME"    type string,
 "PLANNO"               type string,
 "PREWEIGHTSUM"         type double,
 "MENO"                 type string,
 "GRADENUMRANGE"        type string,
 "GRADENUMRANGENAME"    type string,
 "THICKRANGE"           type string,
 "THICKRANGENAME"       type string,
 "R_RECORD_CREATE_DATE" type datetime,
 "R_RECORD_CREATE_USER" type string,
 "R_RECORD_UPDATE_DATE" type datetime,
 "R_RECORD_UPDATE_USER" type string,
 "R_RECORD_IS_DELETED"  type double,
 "R_RECORD_CHANGE_FLAG" type double,
 "DENSITY"              type double,
 "PROCESSCUSTOMNO"      type string,
 "PROCESSCUSTOMNAME"    type string,
 "SETTLEDEPTNO"         type string,
 "SETTLEDEPTNAME"       type string,
 "SETTLE_STAUS"         type string,
 "SETTLE_STAUS_NAME"    type string,
 "SETTLE_NO"            type string,
 "SETTLE_DATE"          type datetime,
 "ACCEPTANCER"          type string,
 "ACCEPTANCE_TIME"      type datetime,
 "CHANXIAN"             type string,
 "MDDEPTNAME"           type string,
 "ARTICLEYS"            type string,
 "MATERIALGRADENUM"     type string,
 "MATERIALSHOPSIGN"     type string,
 "CBXJGTYPE"            type string,
 "JGMESSAGE"            type string,
 "JGSTATUS"             type string,
 "ARTICLEFEE"           type string,
 "ISSETTLED"            type double,
 "SPECIALDOWN"          type string,
 "ARTICLESHEET"         type double,
 "ARTICLEWEIGHT"        type double,
 "USERNAME"             type string,
 "JFSENDFLAG"           type double,
 "ISRECEIVED"           type string,
 "SPECIALMEMO"          type string,
 "TOPROCESSID"          type string,
 "JXLOCKED"             type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_JG_PROCESS_parser
TYPE rcd
SCHEMA T_ZY_JG_PROCESS_schema;

CREATE TABLE T_ZY_JG_PROCESS using T_ZY_JG_PROCESS_parser; 

create index T_ZY_JG_PROCESS_index on table T_ZY_JG_PROCESS(DEPTID);

create map PROCESSID_map on table T_ZY_JG_PROCESS
KEY (PROCESSID)
VALUE (1)
TYPE string
where OUTCARBILLTIME >= TO_DATE ('2012-07-02', '%Y-%m-%d');

create map DEPTID_map on table T_ZY_JG_PROCESS
KEY (DEPTID)
VALUE (1)
TYPE string
where OUTCARBILLTIME >= TO_DATE ('2012-07-02', '%Y-%m-%d');

create schema T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_schema
source type CSV
fields(
 "DEPTID"				type string,
 "CHANGEOWNERID"		type string,		
 "PREOWNERNO"           type string,        
 "NEWOWNERNO"			type string,        
 "PROOWNERNAME"         type string,        
 "CHANGEDATE"           type datetime,      
 "NEWOWNERNAME"			type string,
 "NETWEIGHT"			type double,        
 "GROSSWEIGHT"			type double,
 "SHEETNUM"				type double,
 "GOODSID"				type string,
 "CHANGEOWNERNO"		type string,
 "DEPTID_1"				type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_parser
TYPE rcd
SCHEMA T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_schema;

CREATE TABLE T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL using T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_parser; 

create index T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_index on table T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL(DEPTID);

create schema union_all_schema
source type CSV
fields(
 "GOODSID"              	type string,
 "OWNERID"             		type string,          
 "OWNERNAME"              	type string,          
 "GRADENUMXH"           	type double,          
 "SINGLESHEETNUM"           type double,          
 "NETWEIGHT"         		type double,          
 "GROSSWEIGHT"     			type double,          
 "SHEETNUM"         		type double
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER union_all_parser
TYPE rcd
SCHEMA union_all_schema;

CREATE TABLE union_all using union_all_parser; 

create index union_all_index on table union_all(OWNERID);

create schema join_1_schema
source type CSV
fields(
 "PREGOODSID"				type string,
 "OWNERID"					type string,
 "GRADENUMXH"           	type double,
 "SINGLESHEETNUM"			type double,
 "SIDEMARK"         		type string,
 "SHIPNAME"           		type string,
 "NETWEIGHT"				type double,
 "OWNERNAME"				type string,
 "GROSSWEIGHT"				type double,
 "SHEETNUM"					type double,
 "DEPTID"					type string,
 "R_RECORD_IS_DELETED"     	type double,
 "GOODSID"					type string,
 "GOODSID_1"				type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER join_1_parser
TYPE rcd
SCHEMA join_1_schema;

CREATE TABLE join_1 using join_1_parser; 

create index join_1_index on table join_1(OWNERID);

create statistics model join_1_model on table join_1
group by (PREGOODSID,OWNERID,SIDEMARK,SHIPNAME)
measures (sum(GRADENUMXH),sum(SINGLESHEETNUM),sum(NETWEIGHT),sum(GROSSWEIGHT),sum(SHEETNUM));

create schema join_2_schema
source type CSV
fields(
 "OWNERID"					type string,
 "OWNERNAME"				type string,
 "GRADENUMXH"           	type double,
 "SINGLESHEETNUM"			type double,
 "SIDEMARK"         		type string,
 "SHIPNAME"           		type string,
 "NETWEIGHT"				type double,
 "GROSSWEIGHT"				type double,
 "SHEETNUM"					type double,
 "PACKNUM"					type string,
 "MANAGENO"     			type string,
 "GRADENUM"					type string,
 "PREGOODSID"				type string,
 
 "GOODSLOCID"				type string,
 "DEPTID"					type string,
 "R_RECORD_IS_DELETED"		type double,
 "GOODSID"					type string,
 "KINDNAME"					type string,
 "SHOPSIGNNAME"				type string,
 "PRODAREANAME"				type string,
 "FIRSTINDATE"				type datetime
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER join_2_parser
TYPE rcd
SCHEMA join_2_schema;

CREATE TABLE join_2 using join_2_parser; 

create index join_2_index on table join_2(OWNERID);

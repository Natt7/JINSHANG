create database db;
use db;

create schema T_GG_SJ_GOODS_schema
source type CSV
fields(
 "goodsid"              		type string,
 "deptid"               		type string,
 "packnum"              		type string,
 "barcode"              		type string,
 "goodslocid"           		type string,
 "stocktype"            		type string,
 "ownerid"              		type string,
 "ownername"            		type string,
 "goodsownermanageno"   		type string,
 "inbillid"             		type string,
 "goodsownerpackno"     		type string,
 "manageno"             		type string,
 "feebegindate"         		type DATETIME,
 "contractid"           		type string,
 "goodsstateno"         		type string,
 "goodsstatename"       		type string,
 "changeownertimes"     		type double default value '0',
 "goodstype"            		type string,
 "goodstypename"        		type string,
 "kindno"               		type string,
 "kindname"             		type string,
 "shopsignid"           		type string,
 "shopsignname"         		type string,
 "prodareaid"           		type string,
 "prodareaname"         		type string,
 "goodsbatchno"         		type string,
 "prodstoveno"          		type string,
 "gradenum"             		type string,
 "gradenumthick"        		type double,
 "gradenumwidth"        		type double,
 "gradenumlength"       		type double,
 "grossweight"          		type double,
 "netweight"            		type double,
 "poundweight"          		type double,
 "checkweight"          		type double,
 "sheetnum"             		type double default value '1',
 "unit"                 		type string,
 "packtype"             		type string,
 "stockareaid"          		type string,
 "qualitymemo"          		type string,
 "firstinownerid"       		type string,
 "firstindate"          		type DATETIME,
 "outbillid"            		type string,
 "ldglistid"            		type string,
 "materialgoodsid"      		type string,
 "intype"               		type string,
 "outtype"              		type string,
 "billstate"            		type double,
 "outbilltime"          		type DATETIME,
 "memo"                 		type string,
 "extsysplanobjectid"   		type string,
 "extsyskindid"         		type string,
 "extsysshopsignid"     		type string,
 "extsysprodareaid"     		type string,
 "foreignlistno"        		type string,
 "sendflag"             		type double,
 "r_record_create_date" 		type DATETIME,
 "r_record_create_user" 		type string,
 "r_record_update_date" 		type DATETIME,
 "r_record_update_user" 		type string,
 "r_record_is_deleted"  		type double,
 "incusttime"           		type DATETIME,
 "sidemark"             		type string,
 "temp"                 		type string,
 "length_product_max"   		type double,
 "heat_num"             		type string,
 "test_lot_num"         		type string,
 "r_record_change_flag" 		type double,
 "sdprice"              		type string,
 "extsysgradenum"       		type string,
 "collectionmanname"    		type string,
 "lockflag"             		type string,
 "check_type"           		type string,
 "outdate"              		type DATETIME,
 "yfweight"             		type double,
 "yfsheet"              		type double,
 "pregoodsid"           		type string,
 "issplit"              		type double,
 "gradenumxh"           		type double,
 "gradenumwhdw"         		type string,
 "splittime"            		type double,
 "isclear"              		type double,
 "singlesheetnum"       		type double,
 "gradenumhz"           		type string,
 "gradenumthickhz"      		type double,
 "singlesheet"          		type double,
 "loclv1"               		type string,
 "singlesheetunit"      		type string,
 "dcemp"                		type string,
 "qzemp"                		type string,
 "dcemp2"               		type string,
 "shipno"               		type string,
 "shipname"             		type string,
 "shipcd"               		type string,
 "shiplevel"            		type string,
 "cmmemo"               		type string,
 "cmmemock"             		type string,
 "shopsigncd"           		type string,
 "processtypename"      		type string,
 "packtypename"         		type string,
 "sort_emp"             		type string,
 "customerid"           		type string,
 "lvgoodsid"            		type string,
 "dispersesheet"        		type double,
 "dbdeptid"             		type string,
 "dbcustomer"           		type string,
 "dbgulender"           		type string,
 "locked_object"        		type string,
 "locked_date"          		type DATETIME,
 "unlocked_date"        		type DATETIME,
 "preownername"         		type string,
 "ply"                  		type double default value '0',
 "tdstate"              		type string default value '1',
 "opselected"           		type string,
 "oplock"               		type string,
 "opinupload"           		type string,
 "opchangeupload"       		type string,
 "opinbatchid"          		type string,
 "opchangebatchid"      		type string,
 "opinupload_date"      		type DATETIME,
 "out_package_status"   		type string,
 "out_package_desc"     		type string,
 "gmpacktype"           		type string,
 "handno"               		type string,
 "saveno"               		type string,
 "drawno"               		type string,
 "dangerouslevel"       		type string,
 "acceptancecriteria"   		type string,
 "shippingmark"         		type string,
 "loclv2"               		type string,
 "payedflag"            		type string,
 "ordergoodsownerid"    		type string,
 "ordergoodsownername"  		type string
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_GG_SJ_GOODS_parser
TYPE rcd
SCHEMA T_GG_SJ_GOODS_schema;

CREATE TABLE T_GG_SJ_GOODS using T_GG_SJ_GOODS_parser; 

create schema T_ZY_RK_INBILL_schema
SOURCE TYPE CSV
FIELDS(
"inbillid" 						type string,
"deptid" 						type string,
"foreignlistno" 				type string,
"goodsbatchno" 					type string,
"intype" 						type string,
"feebegindate" 					type DATETIME,
"incusttime" 					type DATETIME,
"inbillownername" 				type string,
"inbillownerno" 				type string,
"inbillempno" 					type string,
"inbillempname" 				type string,
"inbilltime" 					type DATETIME,
"inbillmemo" 					type string,
"kindno" 						type string,
"kindname" 						type string,
"shopsignname" 					type string,
"prodareaname" 					type string,
"prodareaid" 					type string,
"remanageno" 					type string,
"shopsignid" 					type string,
"truckgroupname" 				type string,
"truckgroupno" 					type string,
"planno" 						type string,
"manageno" 						type string,
"sheetnumsum" 					type double,
"grossweightsum" 				type double,
"netweightsum" 					type double,
"goodsownermanageno" 			type string,
"firstindate" 					type DATETIME,
"gradenum" 						type string,
"r_record_create_date" 			type DATETIME,
"r_record_create_user" 			type string,
"r_record_update_date" 			type DATETIME,
"r_record_update_user" 			type string,
"r_record_is_deleted" 			type double,
"stocktype" 					type string,
"r_record_change_flag" 			type double,
"rktype" 						type string,
"trans_type" 					type string,
"finish_date" 					type DATETIME,
"check_date" 					type DATETIME,
"check_type" 					type string,
"sort_emp" 						type string,
"check_emp" 					type string,
"loclv1" 						type string,
"loclv2" 						type string,
"dcemp" 						type string,
"qzemp" 						type string,
"dcemp2" 						type string,
"sendmessage" 					type string,
"dtlcount" 						type double,
"sidemark" 						type string,
"ischecked" 					type double,
"sheetsumsum" 					type double,
"issettled" 					type double,
"handno" 						type string,
"saveno" 						type string,
"deptfrom" 						type string,
"jfsendflag" 					type double,
"checkdtlcount" 				type double
)
SCHEMA DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_RK_INBILL_parser
TYPE rcd
SCHEMA T_ZY_RK_INBILL_schema;

CREATE TABLE T_ZY_RK_INBILL using T_ZY_RK_INBILL_parser; 

CREATE SCHEMA T_ZY_CK_OUTBILL_schema
SOURCE TYPE CSV
FIELDS(                                                          
"outbillid"                     type string,
"deptid"                        type string,
"foreignlistno"                 type string,
"outbillownername"              type string,
"outbillownerno"                type string,
"outbillpickownername"          type string,
"outbillpickownerno"            type string,
"outtype"                       type string,
"outcusttime"                   type datetime,
"outbillempno"                  type string,
"outbillempname"                type string,
"outbilltime"                   type datetime,
"newmanagenum"                  type string,
"truckgroupno"                  type string,
"outcarno"                      type string,
"outbillmemo"                   type string,
"planno"                        type string,
"netweightsum"                  type double,
"sheetnumsum"                   type double,
"r_record_create_date"          type datetime,
"r_record_create_user"          type string,
"r_record_update_date"          type datetime,
"r_record_update_user"          type string,
"r_record_is_deleted"           type double,
"outstate"                      type string,
"invoicekindid"                 type string,
"invoicekindname"               type string,
"r_record_change_flag"          type double,
"printcount"                    type double,
"maxprintcount"                 type double,
"issplit"                       type double,
"outtypename"                   type string,
"check_type"                    type string,
"operator"                      type string,
"outcardrivername"              type string,
"idcode"                        type string,
"settlenum"                     type string,
"outpassword"                   type string,
"sendmessage"                   type string,
"dtlcount"                      type double,
"confirm_flag"                  type string default value '0',
"confirm_date"                  type datetime,
"confirm_emp"                   type string,
"issettled"                     type double,
"deptto"                        type string,
"trans_type"                    type string,
"jfsendflag"                    type double,
"jyzxflag"                      type double,
"username"                      type string,
"billlock"                      type string
	    )
SCHEMA DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_CK_OUTBILL_parser
TYPE rcd
SCHEMA T_ZY_CK_OUTBILL_schema;

CREATE TABLE T_ZY_CK_OUTBILL using T_ZY_CK_OUTBILL_parser;

create schema T_ZY_JG_PROCESS_schema
SOURCE TYPE CSV
FIELDS(
"processid" 					type string,
"deptid" 						type string,
"customerid" 					type string,
"processdept" 					type string,
"processdeptname" 				type string,
"processtype" 					type string,
"processtypename" 				type string,
"processmold" 					type string,
"processmoldname" 				type string,
"processstate" 					type double,
"planenddate" 					type datetime,
"kindno" 						type string,
"kindname" 						type string,
"packtype" 						type string,
"packtypename" 					type string,
"woodtype" 						type string,
"woodtypename" 					type string,
"straptype" 					type string,
"straptypename" 				type string,
"processprecision" 				type string,
"orderinfo" 					type string,
"fee" 							type double,
"length" 						type double,
"weigtht" 						type double,
"sheet" 						type double,
"piecenum" 						type double,
"outcarbilltime" 				type datetime,
"outcarbillempno" 				type string,
"outcarbillempname" 			type string,
"planno" 						type string,
"preweightsum" 					type double,
"meno" 							type string,
"gradenumrange" 				type string,
"gradenumrangename" 			type string,
"thickrange" 					type string,
"thickrangename" 				type string,
"r_record_create_date" 			type datetime,
"r_record_create_user" 			type string,
"r_record_update_date" 			type datetime,
"r_record_update_user" 			type string,
"r_record_is_deleted" 			type double,
"r_record_change_flag" 			type double,
"density" 						type double,
"processcustomno" 				type string,
"processcustomname" 			type string,
"settledeptno" 					type string,
"settledeptname" 				type string,
"settle_staus" 					type string,
"settle_staus_name" 			type string,
"settle_no" 					type string,
"settle_date" 					type datetime,
"acceptancer" 					type string,
"acceptance_time" 				type datetime,
"chanxian" 						type string,
"mddeptname" 					type string,
"articleys" 					type string,
"materialgradenum" 				type string,
"materialshopsign" 				type string,
"cbxjgtype" 					type string,
"jgmessage" 					type string,
"jgstatus" 						type string,
"articlefee" 					type string,
"issettled" 					type double,
"specialdown" 					type string,
"articlesheet" 					type double, 
"articleweight" 				type double,
"username" 						type string,
"jfsendflag" 					type double,
"isreceived" 					type string,
"specialmemo" 					type string,
"toprocessid" 					type string,
"jxlocked" 						type string
)
SCHEMA DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_JG_PROCESS_parser
TYPE rcd
SCHEMA T_ZY_JG_PROCESS_schema;

CREATE TABLE T_ZY_JG_PROCESS using T_ZY_JG_PROCESS_parser; 

create schema union_all_schema
source type csv
fields(
  "store_amount"       		type double,
  "store_in_amount"     	type double,
  "store_out_amount"      	type double, 
  "store_process_amount"    type double
  )
schema delimiter "CRLF"
field delimiter ","
text qualifier "DQM";

create parser union_all_parser
type rcd
schema union_all_schema;

create table union_all using union_all_parser;

create index union_all_index on table union_all(store_amount);

create statistics model union_all_model on table union_all
measures (sum(store_amount),sum(store_in_amount),sum(store_out_amount),sum(store_process_amount));

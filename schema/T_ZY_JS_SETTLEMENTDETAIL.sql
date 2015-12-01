create schema T_ZY_JS_SETTLEMENTDETAIL_schema
SOURCE TYPE CSV
FIELDS(
"manageno" type str,
"deptid" type str,
"settleno" type str,
"settlecd" type str,
"goodsid" type str,
"packnum" type str,
"node" type str,
"nodename" type str,
"businesstype" type str,
"businesstypename" type str,
"businessno" type str,
"feetype" type str,
"feetypename" type str,
"settleformula" type str,
"countunit" type double,
"settlenum" type double,
"settlesum" type double,
"unit" type str,
"weight" type double,
"grossweight" type double,
"generatedate" type DATETIME,
"priceno" type str,
"state" type double,
"deptno" type str,
"deptname" type str,
"ownerno" type str,
"ownername" type str,
"resourceno" type str,
"pregoodsid" type str,
"memo" type str,
"sendflag" type double,
"r_record_create_date" type DATETIME,
"r_record_create_user" type str,
"r_record_update_date" type DATETIME,
"r_record_update_user" type str,
"r_record_is_deleted" type double,
"invoicekindid" type str,
"invoicekindname" type str,
"r_record_change_flag" type double,
"settle_contract_id" type str,
"settle_contract_no" type str,
"sub_biz_type_id" type str,
"sub_biz_type_name" type str,
"first_in_date" type DATETIME,
"out_store_date" type DATETIME,
"free_days" type double,
"receive_fee" type double,
"jgbusinessno" type str,
"paytype" type str,
"billempname" type str,
"firstcountunit" type double,
"addfeelink" type str,
"settlelock" type str,
"jyzxflag" type double,
"foreignlistno" type str,
"yts" type double,
"mts" type double,
"direction" type str,
"settlesumused" type double,
"settledeptname" type str,
"kpamount" type double,
"username" type str,
"settlesumtax" type double,
"settlesumnotax" type double,
"cbcountunit" type double,
"cbsettlesum" type double,
"dtlinvoiceno" type str,
"invoicenodate" type str,
"dtlinvoicetypename" type str
)
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_JS_SETTLEMENTDETAIL_parser
TYPE rcd
SCHEMA T_ZY_JS_SETTLEMENTDETAIL_schema;

CREATE TABLE T_ZY_JS_SETTLEMENTDETAIL using T_ZY_JS_SETTLEMENTDETAIL_parser; 

create index T_ZY_JS_SETTLEMENTDETAIL_index on table T_ZY_JS_SETTLEMENTDETAIL(manageno);
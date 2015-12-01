create schema T_ZY_JS_SETTLEMENT_schema
SOURCE TYPE CSV
FIELDS(
"manageno" type str,
"settlecd" type str,
"deptid" type str,
"invoicekindid" type str,
"invoicekindname" type str,
"deptno" type str,
"deptname" type str,
"settledate" type datetime,
"invoicetypeid" type str,
"invoicetypename" type str,
"invoiceno" type str,
"chequeno" type str,
"chequesum" type double,
"chequeunit" type str,
"creditno" type str,
"creditamount" type double,
"cash" type double,
"earnest" type double,
"factsum" type double,
"borrow" type double,
"remit" type double,
"editor" type str,
"editorname" type str,
"creatdate" type datetime,
"flag" type double,
"memo" type str,
"resourceno" type str,
"invoiceflag" type double,
"r_record_create_date" type datetime,
"r_record_create_user" type str,
"r_record_update_date" type datetime,
"r_record_update_user" type str,
"r_record_is_deleted" type double,
"r_record_change_flag" type double,
"biz_id" type str,
"biz_type_id" type str,
"biz_type_name" type str,
"custom_id" type str,
"custom_name" type str,
"settle_data" type str,
"settle_weight" type str,
"should_sum" type double,
"sub_biz_type_id" type str,
"sub_biz_type_name" type str,
"weightsum" type double,
"grossweightsum" type double,
"ispay" type double,
"billempname" type str,
"foreignlistno" type str,
"jgbusinessno" type str,
"settledeptno" type str,
"settledeptname" type str,
"feekk" type double,
"kpusername" type str,
"kpamount" type double,
"kpdate" type datetime,
"settlelock" type str,
"jyzxflag" type double,
"jyzxsendflag" type double,
"jyzxfpsendflag" type double,
"jyzxispayfee" type double,
"sendmessage" type str,
"invoicebillno" type str,
"direction" type str,
"settletaxsum" type double,
"settlenotaxsum" type double
)
SCHEMA DELIMITER"LF"
FIELD DELIMITER","
TEXT QUALIFIER"DQM";

CREATE PARSER T_ZY_JS_SETTLEMENT_parser
TYPE rcd
SCHEMA T_ZY_JS_SETTLEMENT_schema;

CREATE TABLE T_ZY_JS_SETTLEMENT using T_ZY_JS_SETTLEMENT_parser; 

create index T_ZY_JS_SETTLEMENT_index on table T_ZY_JS_SETTLEMENT(manageno);
create schema T_ZY_JG_PROCMATERIALDTL_schema
SOURCE TYPE CSV
FIELDS(
"procmaterialdtlid" type str,
"deptid" type str,
"processid" type str,
"packnum" type str,
"goodsid" type str,
"barcode" type str,
"goodslocid" type str,
"ownerid" type str,
"ownername" type str,
"goodsownermanageno" type str,
"goodsownerpackno" type str,
"manageno" type str,
"feebegindate" type datetime,
"contractid" type str,
"goodsstateno" type str,
"goodsstatename" type str,
"changeownertimes" type double,
"goodstype" type str,
"goodstypename" type str,
"kindno" type str,
"kindname" type str,
"shopsignid" type str,
"shopsignname" type str,
"prodareaid" type str,
"prodareaname" type str,
"goodsbatchno" type str,
"prodstoveno" type str,
"gradenum" type str,
"gradenumthick" type double,
"gradenumwidth" type double,
"gradenumlength" type double,
"grossweight" type double,
"netweight" type double,
"poundweight" type double,
"checkweight" type double,
"sheetnum" type double,
"packtype" type str,
"packtypename" type str,
"unit" type str,
"qualitymemo" type str,
"firstinownerid" type str,
"firstindate" type datetime,
"inbillid" type str,
"intype" type str,
"r_record_create_date" type datetime,
"r_record_create_user" type str,
"r_record_update_date" type datetime,
"r_record_update_user" type str,
"r_record_is_deleted" type double,
"orderby" type double,
"r_record_change_flag" type double,
"shopsigncd" type str,
"customerid" type str,
"chanxian" type str,
"ply" type double,
"memo" type str,
"jyzxflag" type double,
"loclv1" type str,
"loclv2" type str,
"specialmemo" type str
)
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_JG_PROCMATERIALDTL_parser
TYPE rcd
SCHEMA T_ZY_JG_PROCMATERIALDTL_schema;

CREATE TABLE T_ZY_JG_PROCMATERIALDTL using T_ZY_JG_PROCMATERIALDTL_parser;

create index T_ZY_JG_PROCMATERIALDTL_index on table T_ZY_JG_PROCMATERIALDTL(procmaterialdtlid);

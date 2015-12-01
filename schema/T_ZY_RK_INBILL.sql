create schema T_ZY_RK_INBILL_schema
SOURCE TYPE CSV
FIELDS(
"inbillid" type str,
"deptid" type str,
"foreignlistno" type str,
"goodsbatchno" type str,
"intype" type str,
"feebegindate" type DATETIME,
"incusttime" type DATETIME,
"inbillownername" type str,
"inbillownerno" type str,
"inbillempno" type str,
"inbillempname" type str,
"inbilltime" type DATETIME,
"inbillmemo" type str,
"kindno" type str,
"kindname" type str,
"shopsignname" type str,
"prodareaname" type str,
"prodareaid" type str,
"remanageno" type str,
"shopsignid" type str,
"truckgroupname" type str,
"truckgroupno" type str,
"planno" type str,
"manageno" type str,
"sheetnumsum" type double,
"grossweightsum" type double,
"netweightsum" type double,
"goodsownermanageno" type str,
"firstindate" type DATETIME,
"gradenum" type str,
"r_record_create_date" type DATETIME,
"r_record_create_user" type str,
"r_record_update_date" type DATETIME,
"r_record_update_user" type str,
"r_record_is_deleted" type double,
"stocktype" type str,
"r_record_change_flag" type double,
"rktype" type str,
"trans_type" type str,
"finish_date" type DATETIME,
"check_date" type DATETIME,
"check_type" type str,
"sort_emp" type str,
"check_emp" type str,
"loclv1" type str,
"loclv2" type str,
"dcemp" type str,
"qzemp" type str,
"dcemp2" type str,
"sendmessage" type str,
"dtlcount" type double,
"sidemark" type str,
"ischecked" type double,
"sheetsumsum" type double,
"issettled" type double,
"handno" type str,
"saveno" type str,
"deptfrom" type str,
"jfsendflag" type double,
"checkdtlcount" type double
)
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_RK_INBILL_parser
TYPE rcd
SCHEMA T_ZY_RK_INBILL_schema;

CREATE TABLE T_ZY_RK_INBILL using T_ZY_RK_INBILL_parser; 

create index T_ZY_RK_INBILL_index on table T_ZY_RK_INBILL(inbillid);
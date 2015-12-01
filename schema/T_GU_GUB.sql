create schema T_GU_GUB_schema
source type CSV
fields(
 "gubillid"             type str,
 "deptid"               type str,
 "ownerid"              type str,
 "lenderid"             type str,
 "gutype"               type str,
 "sysbillid"            type str,
 "extbillid"            type str,
 "preenddate"           type DATETIME,
 "gubillstate"          type str,
 "weightsum"            type double,
 "sheetnumsum"          type double,
 "gubillmemo"           type str,
 "r_record_is_deleted"  type double,
 "r_record_create_user" type str,
 "r_record_create_date" type DATETIME,
 "r_record_update_user" type str,
 "r_record_update_date" type DATETIME,
 "r_record_change_flag" type double,
 "createdman"           type str,
 "ownername"            type str,
 "importfrom"           type str,
 "lendername"           type str,
 "releaseweight"        type double,
 "releasesheetnum"      type double
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "NULL";

CREATE PARSER T_GU_GUB_parser
TYPE rcd
SCHEMA T_GU_GUB_schema;

CREATE TABLE T_GU_GUB using T_GU_GUB_parser; 

CREATE INDEX T_GU_GUB_index ON TABLE T_GU_GUB (gubillid);
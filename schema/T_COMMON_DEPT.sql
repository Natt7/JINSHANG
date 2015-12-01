create schema T_COMMON_DEPT_schema
source type CSV
fields(
 "deptid"                type str,
 "deptcd"                type str,
 "deptname"              type str,
 "deptlevel"             type double,
 "deptdesc"              type str,
 "deptorder"             type double,
 "parentdeptid"          type str,
 "level1deptid"          type str,
 "level1deptcd"          type str,
 "level1deptname"        type str,
 "level2deptid"          type str,
 "level2deptcd"          type str,
 "level2deptname"        type str,
 "level3deptid"          type str,
 "level3deptcd"          type str,
 "level3deptname"        type str,
 "level4deptid"          type str,
 "level4deptcd"          type str,
 "level4deptname"        type str,
 "r_record_create_date"  type DATETIME,
 "r_record_create_user"  type str,
 "r_record_update_date"  type DATETIME,
 "r_record_update_user"  type str,
 "r_record_is_deleted"   type double,
 "r_record_change_flag"  type double,
 "deptaddress"           type str,
 "depttype"              type str default value  '22',
 "districtid"            type str,
 "districtname"          type str,
 "belongarea"            type str,
 "firstdis"              type str,
 "opselected"            type str default value '0',
 "opupload"              type str,
 "limittime"             type DATETIME,
 "contractno"            type str,
 "baosaas_customer_name" type str
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "NULL";

CREATE PARSER T_COMMON_DEPT_parser
TYPE rcd
SCHEMA T_COMMON_DEPT_schema;

CREATE TABLE T_COMMON_DEPT using T_COMMON_DEPT_parser; 

CREATE INDEX T_COMMON_DEPT_index ON TABLE T_COMMON_DEPT (deptid);
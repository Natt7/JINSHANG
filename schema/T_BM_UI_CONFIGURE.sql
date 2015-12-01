create schema T_BM_UI_CONFIGURE_schema
source type CSV
fields(
  "manage_no"            type str,
  "deptid"               type str,
  "configure_no"         type str,
  "configure_desc"       type str,
  "configure_grade"      type str,
  "configure_node_no"    type str,
  "cf_value1"            type str,
  "cf_value2"            type str,
  "cf_value3"            type double,
  "cf_value4"            type double,
  "configure_remark"     type str,
  "r_record_create_date" type DATETIME,
  "r_record_create_user" type str,
  "r_record_update_date" type DATETIME,
  "r_record_update_user" type str,
  "r_record_is_deleted"  type double,
  "r_record_change_flag" type double,
  "cf_value5"            type DATETIME
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "NULL";

CREATE PARSER T_BM_UI_CONFIGURE_parser
TYPE rcd
SCHEMA T_BM_UI_CONFIGURE_schema;

CREATE TABLE T_BM_UI_CONFIGURE using T_BM_UI_CONFIGURE_parser; 

CREATE INDEX T_BM_UI_CONFIGURE_index ON TABLE T_BM_UI_CONFIGURE (manage_no);
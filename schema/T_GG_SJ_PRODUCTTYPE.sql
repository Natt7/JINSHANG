create schema T_GG_SJ_PRODUCTTYPE_schema
source type CSV
fields(
 "kindno"               type str,
 "kindname"             type str,
 "parentid"             type str,
 "shortcut"             type str,
 "remark"               type str,
 "deptid"               type str,
 "kindsettleid"         type str,
 "r_record_create_date" type DATETIME,
 "r_record_create_user" type str,
 "r_record_update_date" type DATETIME,
 "r_record_update_user" type str,
 "r_record_is_deleted"  type double,
 "innercd"              type str,
 "r_record_change_flag" type double,
 "kindcheck"            type double,
 "kindmemo"             type str,
 "kindunit"             type str,
 "kindwei"              type double,
 "xhunit"               type str,
 "sheetunit"            type str,
 "gradenum"             type str,
 "lv1unit"              type str,
 "bwlno"                type str,
 "bwlnoparentid"        type str
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "NULL";

CREATE PARSER T_GG_SJ_PRODUCTTYPE_parser
TYPE rcd
SCHEMA T_GG_SJ_PRODUCTTYPE_schema;

CREATE TABLE T_GG_SJ_PRODUCTTYPE using T_GG_SJ_PRODUCTTYPE_parser; 

CREATE INDEX T_GG_SJ_PRODUCTTYPE_index ON TABLE T_GG_SJ_PRODUCTTYPE (kindno);
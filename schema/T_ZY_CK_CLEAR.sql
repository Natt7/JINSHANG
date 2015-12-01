CREATE SCHEMA T_ZY_CK_CLEAR_schema
SOURCE TYPE CSV
FIELDS(                                                          
"clearno"                                                  type str,
"deptid"                                                   type str,
"packnum"                                                  type str,
"goodsid"                                                  type str,
"creatdate"                                                type datetime,
"operater"                                                 type str,
"memo"                                                     type str,
"r_record_create_date"                                     type datetime,
"r_record_create_user"                                     type str,
"r_record_update_date"                                     type datetime,
"r_record_update_user"                                     type str,
"r_record_is_deleted"                                      type double,
"r_record_change_flag"                                     type double
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_ZY_CK_CLEAR_parser
TYPE rcd
SCHEMA T_ZY_CK_CLEAR_schema;

CREATE TABLE T_ZY_CK_CLEAR using T_ZY_CK_CLEAR_parser;

CREATE INDEX T_ZY_CK_CLEAR_index ON TABLE T_ZY_CK_CLEAR (clearno); 


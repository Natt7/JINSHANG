CREATE SCHEMA T_WL_STORE_schema
SOURCE TYPE CSV
FIELDS(                                                          
"dept_id"                                                  type str,
"store_short_name"                                         type str,
"lng"                                                      type double,
"lat"                                                      type double,
"hasvideo"                                                 type double default value "0",
"storelimit"                                               type double
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_WL_STORE_parser
TYPE rcd
SCHEMA T_WL_STORE_schema;

CREATE TABLE T_WL_STORE using T_WL_STORE_parser;

CREATE INDEX T_WL_STORE_index ON TABLE T_WL_STORE (dept_id); 


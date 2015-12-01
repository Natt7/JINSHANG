CREATE SCHEMA T_OWNER_schema
SOURCE TYPE CSV
FIELDS(                                                          
"seg_no"                                                   type str,
"owner_num"                                                type str,
"dept_id"                                                  type str,
"wprovider_id"                                             type str,
"owner_id"                                                 type str,
"dept_subid"                                               type str,
"use_flag"                                                 type str default value '0',
"wprovider_desc"                                           type str,
"memberid"                                                 type str,
"wprovider_id_n"                                           type str,
"deptid"                                                   type str,
"wprovider_address"                                        type str,
"if_branch"                                                type str
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 
                                                       
CREATE PARSER T_OWNER_parser
TYPE rcd
SCHEMA T_OWNER_schema;

CREATE TABLE T_OWNER using T_OWNER_parser;

CREATE INDEX T_OWNER_index ON TABLE T_OWNER (seg_no); 


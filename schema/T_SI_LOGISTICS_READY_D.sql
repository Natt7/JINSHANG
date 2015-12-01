CREATE SCHEMA T_SI_LOGISTICS_READY_D_schema
SOURCE TYPE CSV
FIELDS(                                                          
"seg_no"                                                   type str,
"pack_num"                                                 type str,
"weight_active"                                            type double,
"weight_theo"                                              type double,
"length_product"                                           type double,
"length_product_max"                                       type double,
"width_product"                                            type double,
"thick_product"                                            type double,
"type_product"                                             type str,
"n_pack"                                                   type double,
"ready_num"                                                type str,
"order_num"                                                type str,
"heat_num"                                                 type str,
"shopsign"                                                 type str,
"proc_mark"                                                type str,
"time_receive"                                             type datetime,
"aaa"                                                      type datetime,
"provider_id"                                              type str,
"provider_name"                                            type str
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_SI_LOGISTICS_READY_D_parser
TYPE rcd
SCHEMA T_SI_LOGISTICS_READY_D_schema;

CREATE TABLE T_SI_LOGISTICS_READY_D using T_SI_LOGISTICS_READY_D_parser;

CREATE INDEX T_SI_LOGISTICS_READY_D_index ON TABLE T_SI_LOGISTICS_READY_D (seg_no); 



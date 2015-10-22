CREATE SCHEMA T_SI_LOGISTICS_READY_M_schema
SOURCE TYPE CSV
FIELDS(                                                          
"seg_no"                                                   type str,
"ready_num"                                                type str,
"order_num"                                                type str,
"ready_date_chr"                                           type str,
"ready_t"                                                  type str,
"weight_ready_tot"                                         type double,
"n_ready_tot"                                              type double,
"trnp_mode_code"                                           type str,
"trnp_mode_name"                                           type str,
"dlv_spot_code"                                            type str,
"dlv_spot_name"                                            type str,
"private_route_code"                                       type str,
"private_route_name"                                       type str,
"proc_mark"                                                type str,
"time_receive"                                             type datetime,
"provider_id"                                              type str,
"provider_name"                                            type str
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_SI_LOGISTICS_READY_M_parser
TYPE rcd
SCHEMA T_SI_LOGISTICS_READY_M_schema;

CREATE TABLE T_SI_LOGISTICS_READY_M using T_SI_LOGISTICS_READY_M_parser;

CREATE INDEX T_SI_LOGISTICS_READY_M_index ON TABLE T_SI_LOGISTICS_READY_M (seg_no); 



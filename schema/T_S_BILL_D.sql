CREATE SCHEMA T_S_BILL_D_schema
SOURCE TYPE CSV
FIELDS(                                                          
"seg_no"                                                   type str,
"bill_id"                                                  type str,
"bill_subid"                                               type str,
"contract_id"                                              type str,
"contract_subid"                                           type str,
"s_resource_id"                                            type str,
"good_seg_no"                                              type str,
"good_id"                                                  type str,
"product_id"                                               type str,
"factory_product_id"                                       type str,
"plan_weight"                                              type double,
"plan_qty"                                                 type double,
"weight_unit"                                              type str,
"quantity_unit"                                            type str,
"unit_conversion"                                          type double,
"act_weight"                                               type double,
"act_qty"                                                  type double,
"settle_weight"                                            type double,
"settle_qty"                                               type double,
"sale_price_notax"                                         type double,
"settle_price_notax"                                       type double,
"tax_rate"                                                 type double,
"freight_price"                                            type double,
"out_price"                                                type double,
"other_amount"                                             type double,
"trans_charge_code"                                        type str,
"store_charge_code"                                        type str,
"ws_flag"                                                  type str default value '0',
"ws_date"                                                  type datetime,
"pack_id"                                                  type str,
"proc_mark"                                                type str,
"insert_time"                                              type datetime,
"spec"                                                     type str,
"wprovider_id"                                             type str,
"downloadflag"                                             type str default value '0',
"optflag"                                                  type str default value '0'
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM"; 

CREATE PARSER T_S_BILL_D_parser
TYPE rcd
SCHEMA T_S_BILL_D_schema;

CREATE TABLE T_S_BILL_D using T_S_BILL_D_parser;

CREATE INDEX T_S_BILL_D_index ON TABLE T_S_BILL_D (seg_no); 



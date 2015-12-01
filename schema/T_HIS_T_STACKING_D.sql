CREATE SCHEMA T_HIS_T_STACKING_D_schema
SOURCE TYPE CSV
FIELDS(
  "manu_id"                                                type str,
  "stacking_rec_num"                                       type str,
  "pick_num"                                               type str,
  "pack_num"                                               type str,
  "weight_active"                                          type double,
  "weight_theo"                                            type double,
  "n_pack"                                                 type double,
  "time_receive"                                           type datetime,
  "time_proc"                                              type datetime,
  "proc_mark"                                              type str,
  "error_text1"                                            type str,
  "error_text2"                                            type str,
  "ws_flag"                                                type str default value '0',
  "ws_datat"                                               type datetime,
  "seg_no"                                                 type str,
  "downloadflag"                                           type str default value '0',
  "length_product"                                         type double,
  "length_product_max"                                     type double,
  "length_product_min"                                     type double,
  "optflag"                                                type str,
  "heat_num"                                               type str,
  "test_lot_num"                                           type str,
  "order_num"                                              type str,
  "spec1"                                                  type str,
  "spec3"                                                  type str,
  "spec5"                                                  type str,
  "ppflag"                                                 type str default value '0',
  "scan_flag"                                              type str default value '0'
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_HIS_T_STACKING_D_parser
TYPE rcd
SCHEMA T_HIS_T_STACKING_D_schema;

CREATE TABLE T_HIS_T_STACKING_D using T_HIS_T_STACKING_D_parser;

CREATE INDEX T_HIS_T_STACKING_D_index ON TABLE T_HIS_T_STACKING_D (manu_id); 
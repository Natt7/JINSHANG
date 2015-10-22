CREATE SCHEMA T_HIS_T_STACKING_M_schema
SOURCE TYPE CSV
FIELDS(
"manu_id"                                                  type str,
"stacking_rec_num"                                         type str,
"pick_num"                                                 type str,
"order_num"                                                type str,
"company_code"                                             type str,
"ready_num"                                                type str,
"trnp_mode_code"                                           type str,
"carry_company_code"                                       type str,
"carry_company_name"                                       type str,
"n_stacking_rec"                                           type double,
"weight_strc"                                              type double,
"product_dscr"                                             type str,
"shopsign"                                                 type str,
"domestic_export"                                          type str,
"storehouse_code"                                          type str,
"lade_code"                                                type str,
"dlv_spot_code"                                            type str,
"private_route_code"                                       type str,
"dlv_spot_name"                                            type str,
"consignee_num"                                            type str,
"consignee_name"                                           type str,
"settle_user_num"                                          type str,
"settle_user_name"                                         type str,
"qlt_decide_code"                                          type str,
"vehicle_code"                                             type str,
"n_grass_pack"                                             type double,
"delivery_date_chr"                                        type str,
"t_delivery"                                               type str,
"dept"                                                     type str,
"user_id"                                                  type str,
"operator_name"                                            type str,
"product_code_fb1"                                         type str,
"product_code_fb2"                                         type str,
"product_code_fb3"                                         type str,
"expense_status"                                           type str,
"weight_theo"                                              type double,
"weight_type"                                              type str,
"stacking_type"                                            type str,
"code_all_thr_ready"                                       type str,
"stin_sths_code"                                           type str,
"time_receive"                                             type datetime,
"time_proc"                                                type datetime,
"proc_mark"                                                type str,
"error_text1"                                              type str,
"error_text2"                                              type str,
"stacking_print_batch_id"                                  type str,
"ws_flag"                                                  type str default value '0',
"ws_date"                                                  type datetime,
"seg_no"                                                   type str,
"proc_mark_seg"                                            type str,
"product_id"                                               type str,
"wprovider_id"                                             type str,
"insert_time"                                              type datetime,
"downloadflag"                                             type str default value '0',
"optflag"                                                  type str default value '0',
"product_adress"                                           type str,
"shopsgin"                                                 type str,
"owner_num"                                                type str,
"deptid"                                                   type str,
"trans_commission_subid"                                   type str,
"pay_style"                                                type str,
"getflag"                                                  type str,
"settle_flag"                                              type str,
"source_seg_no"                                            type str,
"operation_type"                                           type str,
"r_jk_update_date"                                         type datetime
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_HIS_T_STACKING_M_parser
TYPE rcd
SCHEMA T_HIS_T_STACKING_M_schema;

CREATE TABLE T_HIS_T_STACKING_M using T_HIS_T_STACKING_M_parser;

CREATE INDEX T_HIS_T_STACKING_M_index ON TABLE T_HIS_T_STACKING_M (manu_id); 

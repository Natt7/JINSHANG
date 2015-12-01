CREATE SCHEMA T_TM_CHECK_GOODS_LOG_schema
SOURCE TYPE CSV
FIELDS(                                                          
"request_sn"                                               type str,
"sys_id"                                                   type str,
"dept_id"                                                  type str,
"owner_id"                                                 type str,
"resource_num"                                             type str,
"pack_num"                                                 type str,
"goods_id"                                                 type str,
"act_type"                                                 type str,
"net_weight"                                               type double,
"gross_weight"                                             type double,
"create_date"                                              type datetime,
"business_type"                                            type str,
"stm_good_id"                                              type str,
"spec"                                                     type str,
"wprovider_id"                                             type str,
"wprovider_name"                                           type str,
"owner_name"                                               type str,
"provider_id"                                              type str,
"provider_name"                                            type str,
"kindname"                                                 type str,
"shopsignname"                                             type str,
"prodareaname"                                             type str,
"gradenumthick"                                            type double,
"gradenumwidth"                                            type double,
"gradenumlength"                                           type double,
"lock_flag"                                                type str,
"result_message"                                           type str,
"matching_rules"                                           type str,
"used_time"                                                type double,
"wms_resource_num"                                         type str,
"wms_pack_num"                                             type str,
"goodslocid"                                               type str,
"barcode"                                                  type str,
"wms_goods_id"                                             type str,
"modi_date"                                                type datetime,
"remark"                                                   type str,
"access_plat"                                              type str,
"goods_owner_id"                                           type str,
"vas_member_id"                                            type str,
"kind_no"                                                  type str,
"plan_qty"                                                 type double,
"rule_type"                                                type str,
"check_rules"                                              type str,
"wms_net_weight"                                           type double,
"wms_qty"                                                  type double,
"pack_flag"                                                type str
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_TM_CHECK_GOODS_LOG_parser
TYPE rcd
SCHEMA T_TM_CHECK_GOODS_LOG_schema;

CREATE TABLE T_TM_CHECK_GOODS_LOG using T_TM_CHECK_GOODS_LOG_parser;

CREATE INDEX T_TM_CHECK_GOODS_LOG_index ON TABLE T_TM_CHECK_GOODS_LOG (request_sn); 


CREATE SCHEMA T_ZY_CK_OUTBILL_schema
SOURCE TYPE CSV
FIELDS(                                                          
"outbillid"                                                type str,
"deptid"                                                   type str,
"foreignlistno"                                            type str,
"outbillownername"                                         type str,
"outbillownerno"                                           type str,
"outbillpickownername"                                     type str,
"outbillpickownerno"                                       type str,
"outtype"                                                  type str,
"outcusttime"                                              type datetime,
"outbillempno"                                             type str,
"outbillempname"                                           type str,
"outbilltime"                                              type datetime,
"newmanagenum"                                             type str,
"truckgroupno"                                             type str,
"outcarno"                                                 type str,
"outbillmemo"                                              type str,
"planno"                                                   type str,
"netweightsum"                                             type double,
"sheetnumsum"                                              type double,
"r_record_create_date"                                     type datetime,
"r_record_create_user"                                     type str,
"r_record_update_date"                                     type datetime,
"r_record_update_user"                                     type str,
"r_record_is_deleted"                                      type double,
"outstate"                                                 type str,
"invoicekindid"                                            type str,
"invoicekindname"                                          type str,
"r_record_change_flag"                                     type double,
"printcount"                                               type double,
"maxprintcount"                                            type double,
"issplit"                                                  type double,
"outtypename"                                              type str,
"check_type"                                               type str,
"operator"                                                 type str,
"outcardrivername"                                         type str,
"idcode"                                                   type str,
"settlenum"                                                type str,
"outpassword"                                              type str,
"sendmessage"                                              type str,
"dtlcount"                                                 type double,
"confirm_flag"                                             type str default value '0',
"confirm_date"                                             type datetime,
"confirm_emp"                                              type str,
"issettled"                                                type double,
"deptto"                                                   type str,
"trans_type"                                               type str,
"jfsendflag"                                               type double,
"jyzxflag"                                                 type double,
"username"                                                 type str,
"billlock"                                                 type str
	    )
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_ZY_CK_OUTBILL_parser
TYPE rcd
SCHEMA T_ZY_CK_OUTBILL_schema;

CREATE TABLE T_ZY_CK_OUTBILL using T_ZY_CK_OUTBILL_parser;

CREATE INDEX T_ZY_CK_OUTBILL_index ON TABLE T_ZY_CK_OUTBILL (outbillid); 
create schema T_SS_SMS_SEND_LOG_schema
SOURCE TYPE CSV
FIELDS(
"seg_no" type str,
"send_index" type str,
"send_id" type str,
"important_flag" type str,
"priority" type str,
"customer_id" type str,
"reciever_name" type str,
"destination_mobile" type str,
"sms_message" type str,
"sender_sign" type str,
"remark" type str,
"operator" type str,
"plan_send_date" type DATETIME,
"operate_date" type DATETIME,
"send_date" type DATETIME,
"business_no" type str,
"module_code" type str,
"deptid" type str
)
SCHEMA DELIMITER "LF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER T_SS_SMS_SEND_LOG_parser
TYPE rcd
SCHEMA T_SS_SMS_SEND_LOG_schema;

CREATE TABLE T_SS_SMS_SEND_LOG using T_SS_SMS_SEND_LOG_parser; 

create index T_SS_SMS_SEND_LOG_index on table T_SS_SMS_SEND_LOG(seg_no);
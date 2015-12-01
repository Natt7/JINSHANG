create schema T_GG_SJ_CUSTOMER_schema
source type CSV
fields(
 "ownerno"              type str,
 "deptid"               type str,
 "ownername"            type str,
 "ownernamecut"         type str,
 "ownershort"           type str,
 "ownertypeno"          type str,
 "sysno"                type str,
 "email"                type str,
 "tel"                  type str,
 "linkman"              type str,
 "fax"                  type str,
 "postalcode"           type str,
 "netaddress"           type str,
 "address"              type str,
 "bankname"             type str,
 "bankaccounts"         type str,
 "taxpayerno"           type str,
 "flag"                 type str,
 "remark"               type str,
 "minstorage"           type double,
 "accountreceivable"    type double,
 "r_record_create_date" type DATETIME,
 "r_record_create_user" type str,
 "r_record_update_date" type DATETIME,
 "r_record_update_user" type str,
 "r_record_is_deleted"  type double,
 "r_record_change_flag" type double,
 "memberid"             type str,
 "isbaosteel"           type str,
 "tellink"              type double,
 "invoicekindid"        type str,
 "invoicekindname"      type str,
 "jgfeeflag"            type str,
 "minweight"            type double,
 "ccfeeflag"            type str,
 "townerno"             type str,
 "saveimage"            type str,
 "bwlno"                type str,
 "username"             type str,
 "sendemail"            type str
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "NULL";

CREATE PARSER T_GG_SJ_CUSTOMER_parser
TYPE rcd
SCHEMA T_GG_SJ_CUSTOMER_schema;

CREATE TABLE T_GG_SJ_CUSTOMER using T_GG_SJ_CUSTOMER_parser; 

CREATE INDEX T_GG_SJ_CUSTOMER_index ON TABLE T_GG_SJ_CUSTOMER (ownerno);
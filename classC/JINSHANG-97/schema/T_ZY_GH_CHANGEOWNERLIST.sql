create database db;
use db;
create schema t_zy_gh_changeownerlist_schema
source type CSV
fields(
 "changeownerid"   type str,
 "deptid"   type str,
 "proownername"   type str,
 "preownerno"   type str,
 "contractno"   type str,
 "premanagenum"   type str,
 "newownername"   type str,
 "newownerno"   type str,
 "newmanagenum"   type str,
 "changedate"   type datetime format '%Y/%m/%d %H:%M:%S',
 "getbiilldate"   type datetime format '%Y/%m/%d %H:%M:%S',
 "foreignlistno" type str,
 "orderlistno"   type str,
 "outcarbilltime"   type datetime format '%Y/%m/%d %H:%M:%S',
 "outcarbillempno"   type str,
 "outcarbillempname"   type str,
 "outcarbillmemo"   type str,
 "r_record_create_date" type datetime format '%Y/%m/%d %H:%M:%S',
 "r_record_create_user" type str,
 "r_record_update_date" type datetime format '%Y/%m/%d %H:%M:%S',
 "r_record_update_user" type str,
 "r_record_is_deleted" type double,
 "netweightsum"        type double,
 "grossweightsum"      type double,
 "sheetnumsum"         type double,
 "originsettle"        type double,
 "r_record_change_flag" type double,
 "issplit"             type double,
 "outpassword"          type str,
 "invoicekindid"        type str,
 "invoicekindname"      type str,
 "sortemp"              type str,
 "sortemptele"          type str,
 "settlestatus"         type str,
 "confirm_date"         type datetime format '%Y/%m/%d %H:%M:%S',
 "confirm_emp"          type str,
 "confirm_flag"         type str default value '0',
 "dtlcount"           type double,
 "issettled"           type double,
 "jfsendflag"          type double,
 "jyzxflag"         type double,
 "sendmessage"       type str,
 "jyzxcheckdate"       type datetime format '%Y/%m/%d %H:%M:%S',
 "jyzxcheckflag"       type double,
 "idcode"               type str,
 "username"           type str
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";
CREATE PARSER t_zy_gh_changeownerlist_parser
TYPE rcd
SCHEMA t_zy_gh_changeownerlist_schema;

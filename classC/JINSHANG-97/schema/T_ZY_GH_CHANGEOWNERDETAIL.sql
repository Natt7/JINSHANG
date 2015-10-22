use db;
create schema t_zy_gh_changeownerdetail_schema
source type CSV
fields(
 "manageno" type str,
 "deptid" type str,
 "changeownerno" type str,
 "packnum" type str,
 "goodsid" type str,
 "inbegintime" type datetime format '%Y/%m/%d %H:%M:%S',
 "barcode" type str,
 "goodslocid" type str,
 "ownername" type str,
 "ownerno" type str,
 "pregoodsownermanagenum" type str,
 "goodsownermanagenum" type str,
 "goodsownerpacknum" type str,
 "premanagenum" type str,
 "managenum" type str,
 "contractno" type str,
 "goodsstatename" type str,
 "goodsstateno" type str,
 "goodstypename" type str,
 "goodstype" type str,
 "kindname" type str,
 "kindno" type str,
 "shopsignname" type str,
 "shopsignid" type str,
 "prodareaname" type str,
 "prodareaid" type str,
 "goodsbatchnum" type str,
 "gradenum" type str,
 "gradenumthick" type double,
 "gradenumwidth" type double,
 "gradenumlength" type double,
 "grossweight" type double,
 "netweight" type double,
 "poundweight" type double,
 "checkweight" type double,
 "sheetnum" type double,
 "qualitymemo" type str,
 "firstinownerid" type str,
 "firstindate" type datetime format '%Y/%m/%d %H:%M:%S',
 "inbillid" type str,
 "intype" type str,
 "prememo" type str,
 "memo" type str,
 "foreignlistno" type str,
 "preforeignlistno" type str,
 "orderlistno" type str,
 "preorderlistno" type str,
 "r_record_create_date" type datetime format '%Y/%m/%d %H:%M:%S',
 "r_record_create_user" type str,
 "r_record_update_date" type datetime format '%Y/%m/%d %H:%M:%S',
 "r_record_update_user" type str,
 "r_record_is_deleted" type double,
 "preincusttime" type datetime format '%Y/%m/%d %H:%M:%S',
 "incusttime" type datetime format '%Y/%m/%d %H:%M:%S',
 "sendflag" type double,
 "outchangesendflag" type double,
 "changetimes" type double,
 "originownername" type str,
 "originownerno" type str,
 "r_record_change_flag" type double,
 "custday" type double,
 "sdprice" type str,
 "newdate" type datetime format '%Y/%m/%d %H:%M:%S',
 "pregoodsid" type str,
 "check_type" type str,
 "singlesheetnum" type double,
 "gradenumxh" type double,
 "sidemark" type str,
 "sort_emp" type str,
 "dispersesheet" type double,
 "ply" type double default value "0",
 "originsheetnum" type double,
 "originnetweight" type double,
 "issplit" type double,
 "gmpacktype" type str,
 "preforeignlistcode" type str,
 "confirmflag" type str default value "0",
 "jyzxflag" type double,
 "loclv1" type str,
 "loclv2" type str,
 "outnetweight" type double
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";
CREATE PARSER t_zy_gh_changeownerdetail_parser
TYPE rcd
SCHEMA t_zy_gh_changeownerdetail_schema;

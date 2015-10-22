create schema t_zy_rk_inbilldetail_schema
SOURCE TYPE CSV
FIELDS(
"goodsid" type str,
"deptid" type str,
"packnum" type str,
"barcode" type str,
"goodslocid" type str,
"stocktype" type str,
"ownerid" type str,
"ownername" type str,
"goodsownermanageno" type str,
"inbillid" type str,
"goodsownerpackno" type str,
"manageno" type str,
"feebegindate" type datetime format '%Y/%m/%d %H:%M:%S',
"contractid" type str,
"goodsstateno" type str,
"goodsstatename" type str,
"changeownertimes" type double,
"goodstype" type str,
"goodstypename" type str,
"kindno" type str,
"kindname" type str,
"shopsignid" type str,
"shopsignname" type str,
"prodareaid" type str,
"prodareaname" type str,
"goodsbatchno" type str,
"prodstoveno" type str,
"gradenum" type str,
"gradenumthick" type double,
"gradenumwidth" type double,
"gradenumlength" type double,
"grossweight" type double,
"netweight" type double,
"poundweight" type double,
"checkweight" type double,
"sheetnum" type double,
"unit" type str,
"stockareaid" type str,
"qualitymemo" type str,
"firstinownerid" type str,
"firstindate" type datetime format '%Y/%m/%d %H:%M:%S',
"outbillid" type str,
"ldglistid" type str,
"materialgoodsid" type str,
"intype" type str,
"outtype" type str,
"billstate" type double,
"outbilltime" type datetime format '%Y/%m/%d %H:%M:%S',
"memo" type str,
"extsysplanobjectid" type str,
"extsyskindid" type str,
"extsysshopsignid" type str,
"extsysprodareaid" type str,
"sendflag" type double,
"r_record_create_date" type datetime format '%Y/%m/%d %H:%M:%S',
"r_record_create_user" type str,
"r_record_update_date" type datetime format '%Y/%m/%d %H:%M:%S',
"r_record_update_user" type str,
"r_record_is_deleted" type double,
"incusttime" type datetime format '%Y/%m/%d %H:%M:%S',
"foreignlistno" type str,
"sidemark" type str,
"length_product_max" type double,
"r_record_change_flag" type double,
"sdprice" type str,
"inbillempname" type str,
"extsysgradenum" type str,
"heat_num" type str,
"errormessage" type str,
"check_type" type str,
"outdate" type datetime format '%Y/%m/%d %H:%M:%S',
"yfweight" type double,
"yfsheet" type double,
"pregoodsid" type str,
"singlesheetnum" type double,
"gradenumhz" type str,
"gradenumthickhz" type double,
"singlesheet" type double,
"gradenumxh" type double,
"shipno" type str,
"shipname" type str,
"shipcd" type str,
"shiplevel" type str,
"sort_emp" type str,
"dbrkflag" type double,
"dbckflag" type double,
"dbowner" type str,
"dbgoodsid" type str,
"dispersesheet" type double,
"ply" type double,
"out_package_status" type str,
"out_package_desc" type str,
"gmpacktype" type str,
"handno" type str,
"saveno" type str,
"dangerouslevel" type str,
"acceptancecriteria" type str,
"shippingmark" type str,
"gradenumwhdw" type str,
"loclv2" type str,
"packtype" type str,
"payedflag" type str,
"collectionmanname" type str,
"loclv1" type str
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "DQM";

CREATE PARSER t_zy_rk_inbilldetail_parser
TYPE rcd
SCHEMA t_zy_rk_inbilldetail_schema;


create job job0(1)
begin
dataset file T_ZY_CK_CLEAR_1_dataset
(
	schema: "T_ZY_CK_CLEAR_schema",
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_CK_CLEAR.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_CK_CLEAR_syncher
(
    inputs: T_ZY_CK_CLEAR_1_dataset,
    database:db,
    operator:add, 
    table:T_ZY_CK_CLEAR
);
end;
run job job0(threads:8);

create job 1_job(1)
begin
dataset file T_ZY_JG_PROCESS_1_dataset
(
	schema: T_ZY_JG_PROCESS_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_JG_PROCESS.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_JG_PROCESS_syncher
(
    inputs: T_ZY_JG_PROCESS_1_dataset,
    database:db,
    operator:add, 
    table:T_ZY_JG_PROCESS
);
end;
run job 1_job (threads:8);


create service service_1(3)
begin
dataset file T_GG_SJ_GOODS_dataset
(
	schema: "T_GG_SJ_GOODS_schema",
    filename: "/home/natt/Data/jinshang_Data_New/T_GG_SJ_GOODS.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_RK_INBILLDETAIL_dataset
(
	schema: T_ZY_RK_INBILLDETAIL_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_RK_INBILLDETAIL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_JG_PROCARTICLEDTL_dataset
(
	schema: T_ZY_JG_PROCARTICLEDTL_schema,
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_JG_PROCARTICLEDTL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_GH_CHANGEOWNERLIST_dataset
(
	schema: T_ZY_GH_CHANGEOWNERLIST_schema,
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_GH_CHANGEOWNERLIST.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_GH_CHANGEOWNERDETAIL_dataset
(
	schema: T_ZY_GH_CHANGEOWNERDETAIL_schema,
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_GH_CHANGEOWNERDETAIL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_CK_OUTPACK_dataset
(
	schema: T_ZY_CK_OUTPACK_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_CK_OUTPACK.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_JG_PROCMATERIALDTL_dataset
(
	schema: T_ZY_JG_PROCMATERIALDTL_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_JG_PROCMATERIALDTL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_select
(
	fields: 
	 (
       (fname:"DEPTID"),
       (fname:"CHANGEOWNERID"),
       (fname:"NEWOWNERNO"),
       (fname:"NEWOWNERNAME"),
	   (fname:"PREOWNERNO"),
	   (fname:"PROOWNERNAME"),
	   (fname:"CHANGEDATE")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_dataset",
	 order_by:("DEPTID","CHANGEOWNERID"),
	 conditions:"DEPTID = '101'
	AND CHANGEDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERLIST"
);

dataproc select T_ZY_GH_CHANGEOWNERDETAIL_select
(
	fields: 
	 (
		(fname:"PREMANAGENUM"),
		(fname:"CASE WHEN ( MANAGENUM IS NULL OR MANAGENUM = '') THEN PREMANAGENUM ELSE MANAGENUM END ",alias:"MANAGENUM",type:"string"),
		(fname:"SHOPSIGNID"),
		(fname:"SHOPSIGNNAME"),
		(fname:"PRODAREAID"),
		(fname:"PRODAREANAME"),
		(fname:"GRADENUM"),
		(fname:"NETWEIGHT"),
		(fname:"GROSSWEIGHT"),
		(fname:"SHEETNUM"),
		(fname:"FIRSTINDATE"),
		(fname:"KINDNAME"),
		(fname:"GOODSLOCID"),
		(fname:"PACKNUM"),
		(fname:"CHANGEOWNERNO"),
		(fname:"DEPTID",alias:"DEPTID_1",type:"string"),
		(fname:"GRADENUMXH"),
		(fname:"SINGLESHEETNUM"),
		(fname:"OWNERNAME"),
		(fname:"GOODSOWNERMANAGENUM",alias:"GOODSOWNERMANAGENO",type:"string")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERDETAIL_dataset",
	 order_by:("DEPTID_1","CHANGEOWNERNO"),
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERDETAIL"
);

dataproc join T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join
(
	inputs:
		(left_input:T_ZY_GH_CHANGEOWNERLIST_select,right_input:T_ZY_GH_CHANGEOWNERDETAIL_select),
	join_keys:
	(
		("left_input.DEPTID","right_input.DEPTID_1"),
		("left_input.CHANGEOWNERID","right_input.CHANGEOWNERNO")
	),
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);



dataproc select T_GG_SJ_GOODS_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	 conditions:"GOODSSTATENO = '110'
		AND R_RECORD_IS_DELETED = 0
		AND DEPTID = '101'",
	 cache : "true",
	 into: "T_GG_SJ_GOODS"
);

dataproc select A_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_RK_INBILLDETAIL_dataset",
	 conditions:"DEPTID = '101'
		AND GOODSSTATENO = '20'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	 into: "T_ZY_RK_INBILLDETAIL"
);

dataproc select T_ZY_RK_INBILLDETAIL_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0-GRADENUMXH",alias:"GRADENUMXH",type:"double"),
	   (fname:"0-SINGLESHEETNUM",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"0-NETWEIGHT",alias:"NETWEIGHT",type:"double"),
       (fname:"0-GROSSWEIGHT",alias:"GROSSWEIGHT",type:"double"),
       (fname:"0-SHEETNUM",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "A_select",
	cache : "true",
	into: "T_ZY_RK_INBILLDETAIL"
);
 
 dataproc select B_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCARTICLEDTL_dataset",
	 conditions:"DEPTID = '101'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')
		AND GOODSSTATENO = '130'",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	 into: "T_ZY_JG_PROCARTICLEDTL"
);

 dataproc select T_ZY_JG_PROCARTICLEDTL_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"0-NETWEIGHT",alias:"NETWEIGHT",type:"double"),
       (fname:"0-GROSSWEIGHT",alias:"GROSSWEIGHT",type:"double"),
       (fname:"0-SHEETNUM",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "B_select",
	 cache : "true",
	 into: "T_ZY_JG_PROCARTICLEDTL"
);

dataproc select C_select
(
	 fields: 
	 (
       (fname:"NEWOWNERNO",alias:"OWNERID"),
       (fname:"NEWOWNERNAME",alias:"OWNERNAME"),
       (fname:"MANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_select
(
	 fields: 
	 (
       (fname:"NEWOWNERNO",alias:"OWNERID"),
       (fname:"NEWOWNERNAME",alias:"OWNERNAME"),
       (fname:"MANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"0-NETWEIGHT",alias:"NETWEIGHT",type:"double"),
       (fname:"0-GROSSWEIGHT",alias:"GROSSWEIGHT",type:"double"),
       (fname:"0-SHEETNUM",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "C_select",
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);

dataproc select T_ZY_CK_OUTPACK_select
(
	 fields: 
	 (
       (fname:"OWNERNO"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENUM",alias:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_CK_OUTPACK_dataset",
	 conditions:"DEPTID = '101'
		AND OUTCUSTTIME >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	group_by:(OWNERNO,OWNERNAME,MANAGENUM,GOODSOWNERMANAGENUM,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_ZY_CK_OUTPACK"
);

dataproc select T_GG_SJ_GOODS_2_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"PACKNUM"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 conditions:"CREATDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_GG_SJ_GOODS"
);

dataproc select T_ZY_JG_PROCMATERIALDTL_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCMATERIALDTL_dataset",
	 conditions:"vf_PROCESSID = '1'
	   and DEPTID = '101' ",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_ZY_JG_PROCMATERIALDTL"
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_1_select
(
	 fields: 
	 (
       (fname:"PREOWNERNO",alias:"OWNERID"),
       (fname:"PROOWNERNAME",alias:"OWNERNAME"),
       (fname:"PREMANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);
 
dataproc union 1_union
(
    inputs:("T_GG_SJ_GOODS_select","T_ZY_RK_INBILLDETAIL_select","T_ZY_JG_PROCARTICLEDTL_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_select","T_ZY_CK_OUTPACK_select","T_GG_SJ_GOODS_2_select","T_ZY_JG_PROCMATERIALDTL_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_1_select"),
	into:"union_all"
);

dataproc select union_select
(
	fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "1_union",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "union_all"
);
 
  dataproc statistics union_all_statistics
(
  inputs:union_select,
  table:union_all
);

end;

start service service_1 {                      
	  "running_name"   :   "idx_job",
	  "interval"	:	0,
	  "volume"	: 	1000000000,
	  "threads"	: 4
};


create service service_2(3)
begin
dataset file T_GG_SJ_GOODS_del_dataset
(
	schema: "T_GG_SJ_GOODS_schema",
    filename: "/home/natt/Data/jinshang_Data_New/T_GG_SJ_GOODS.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_RK_INBILLDETAIL_del_dataset
(
	schema: T_ZY_RK_INBILLDETAIL_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_RK_INBILLDETAIL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_JG_PROCARTICLEDTL_del_dataset
(
	schema: T_ZY_JG_PROCARTICLEDTL_schema,
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_JG_PROCARTICLEDTL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_GH_CHANGEOWNERLIST_del_dataset
(
	schema: T_ZY_GH_CHANGEOWNERLIST_schema,
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_GH_CHANGEOWNERLIST.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_GH_CHANGEOWNERDETAIL_del_dataset
(
	schema: T_ZY_GH_CHANGEOWNERDETAIL_schema,
    filename: "/home/natt/Data/jinshang_Data_New/T_ZY_GH_CHANGEOWNERDETAIL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_CK_OUTPACK_del_dataset
(
	schema: T_ZY_CK_OUTPACK_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_CK_OUTPACK.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataset file T_ZY_JG_PROCMATERIALDTL_del_dataset
(
	schema: T_ZY_JG_PROCMATERIALDTL_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_ZY_JG_PROCMATERIALDTL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_del_select
(
	fields: 
	 (
       (fname:"DEPTID"),
       (fname:"CHANGEOWNERID"),
       (fname:"NEWOWNERNO"),
       (fname:"NEWOWNERNAME"),
	   (fname:"PREOWNERNO"),
	   (fname:"PROOWNERNAME"),
	   (fname:"CHANGEDATE")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_del_dataset",
	 order_by:("DEPTID","CHANGEOWNERID"),
	 conditions:"DEPTID = '101'
	AND CHANGEDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERLIST"
);

dataproc select T_ZY_GH_CHANGEOWNERDETAIL_del_select
(
	fields: 
	 (
		(fname:"PREMANAGENUM"),
		(fname:"CASE WHEN ( MANAGENUM IS NULL OR MANAGENUM = '') THEN PREMANAGENUM ELSE MANAGENUM END ",alias:"MANAGENUM",type:"string"),
		(fname:"SHOPSIGNID"),
		(fname:"SHOPSIGNNAME"),
		(fname:"PRODAREAID"),
		(fname:"PRODAREANAME"),
		(fname:"GRADENUM"),
		(fname:"NETWEIGHT"),
		(fname:"GROSSWEIGHT"),
		(fname:"SHEETNUM"),
		(fname:"FIRSTINDATE"),
		(fname:"KINDNAME"),
		(fname:"GOODSLOCID"),
		(fname:"PACKNUM"),
		(fname:"CHANGEOWNERNO"),
		(fname:"DEPTID",alias:"DEPTID_1",type:"string"),
		(fname:"GRADENUMXH"),
		(fname:"SINGLESHEETNUM"),
		(fname:"OWNERNAME"),
		(fname:"GOODSOWNERMANAGENUM",alias:"GOODSOWNERMANAGENO",type:"string")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERDETAIL_del_dataset",
	 order_by:("DEPTID_1","CHANGEOWNERNO"),
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERDETAIL"
);

dataproc join T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_join
(
	inputs:
		(left_input:T_ZY_GH_CHANGEOWNERLIST_del_select,right_input:T_ZY_GH_CHANGEOWNERDETAIL_del_select),
	join_keys:
	(
		("left_input.DEPTID","right_input.DEPTID_1"),
		("left_input.CHANGEOWNERID","right_input.CHANGEOWNERNO")
	),
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);



dataproc select T_GG_SJ_GOODS_del_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_del_dataset",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	 conditions:"GOODSSTATENO = '110'
		AND R_RECORD_IS_DELETED = 0
		AND DEPTID = '101'",
	 cache : "true",
	 into: "T_GG_SJ_GOODS"
);

dataproc select A_del_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_RK_INBILLDETAIL_del_dataset",
	 conditions:"DEPTID = '101'
		AND GOODSSTATENO = '20'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	 into: "T_ZY_RK_INBILLDETAIL"
);

dataproc select T_ZY_RK_INBILLDETAIL_del_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0-GRADENUMXH",alias:"GRADENUMXH",type:"double"),
	   (fname:"0-SINGLESHEETNUM",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"0-NETWEIGHT",alias:"NETWEIGHT",type:"double"),
       (fname:"0-GROSSWEIGHT",alias:"GROSSWEIGHT",type:"double"),
       (fname:"0-SHEETNUM",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "A_del_select",
	cache : "true",
	into: "T_ZY_RK_INBILLDETAIL"
);
 
 dataproc select B_del_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCARTICLEDTL_del_dataset",
	 conditions:"DEPTID = '101'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')
		AND GOODSSTATENO = '130'",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	 into: "T_ZY_JG_PROCARTICLEDTL"
);

 dataproc select T_ZY_JG_PROCARTICLEDTL_del_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"0-NETWEIGHT",alias:"NETWEIGHT",type:"double"),
       (fname:"0-GROSSWEIGHT",alias:"GROSSWEIGHT",type:"double"),
       (fname:"0-SHEETNUM",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "B_del_select",
	 cache : "true",
	 into: "T_ZY_JG_PROCARTICLEDTL"
);

dataproc select C_del_select
(
	 fields: 
	 (
       (fname:"NEWOWNERNO",alias:"OWNERID"),
       (fname:"NEWOWNERNAME",alias:"OWNERNAME"),
       (fname:"MANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_join",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_select
(
	 fields: 
	 (
       (fname:"NEWOWNERNO",alias:"OWNERID"),
       (fname:"NEWOWNERNAME",alias:"OWNERNAME"),
       (fname:"MANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"0-NETWEIGHT",alias:"NETWEIGHT",type:"double"),
       (fname:"0-GROSSWEIGHT",alias:"GROSSWEIGHT",type:"double"),
       (fname:"0-SHEETNUM",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "C_del_select",
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);

dataproc select T_ZY_CK_OUTPACK_del_select
(
	 fields: 
	 (
       (fname:"OWNERNO"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENUM",alias:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_CK_OUTPACK_del_dataset",
	 conditions:"DEPTID = '101'
		AND OUTCUSTTIME >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	group_by:(OWNERNO,OWNERNAME,MANAGENUM,GOODSOWNERMANAGENUM,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_ZY_CK_OUTPACK"
);

dataproc select T_GG_SJ_GOODS_del_2_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"PACKNUM"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_del_dataset",
	 conditions:"CREATDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_GG_SJ_GOODS"
);

dataproc select T_ZY_JG_PROCMATERIALDTL_del_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCMATERIALDTL_del_dataset",
	 conditions:"vf_PROCESSID = '1'
	   and DEPTID = '101' ",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_ZY_JG_PROCMATERIALDTL"
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_1_select
(
	 fields: 
	 (
       (fname:"PREOWNERNO",alias:"OWNERID"),
       (fname:"PROOWNERNAME",alias:"OWNERNAME"),
       (fname:"PREMANAGENUM",alias:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_join",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL"
);
 
dataproc union 1_del_union
(
    inputs:("T_GG_SJ_GOODS_del_select","T_ZY_RK_INBILLDETAIL_del_select","T_ZY_JG_PROCARTICLEDTL_del_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_select","T_ZY_CK_OUTPACK_del_select","T_GG_SJ_GOODS_del_2_select","T_ZY_JG_PROCMATERIALDTL_del_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_del_1_select"),
	into:"union_all"
);

dataproc select union_del_select
(
	fields: 
	 (
       (fname:"OWNERID"),
       (fname:"OWNERNAME"),
       (fname:"MANAGENO"),
       (fname:"GOODSOWNERMANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM"),
       (fname:"GOODSLOCID"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "1_del_union",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,GOODSOWNERMANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,PRODAREANAME,FIRSTINDATE),
	cache : "true",
	into: "union_all"
);
 
  dataproc statistics union_all_del_statistics
(
  inputs:union_del_select,
  table:union_all,
  data_opr:delete
);

end;

start service service_2 {                      
	  "running_name"   :   "idx_job1",
	  "interval"	:	0,
	  "volume"	: 	1000000000,
	  "threads"	: 4
};

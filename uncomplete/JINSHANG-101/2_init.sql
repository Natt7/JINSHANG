
create job 1_job(1)
begin
dataset file T_ZY_CK_CLEAR_1_dataset
(
	schema: "T_ZY_CK_CLEAR_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_CK_CLEAR.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc index T_ZY_CK_CLEAR_index
(
 inputs:T_ZY_CK_CLEAR_1_dataset,
 table:T_ZY_CK_CLEAR
 );
 
dataproc doc T_ZY_CK_CLEAR_doc
(  
   inputs:T_ZY_CK_CLEAR_1_dataset,
   table:T_ZY_CK_CLEAR
);

   dataproc map T_ZY_CK_CLEAR_1_map
(  
   inputs:T_ZY_CK_CLEAR_1_dataset,
   table:T_ZY_CK_CLEAR
);
end;
run job 1_job (threads:8);

create job 2_job(1)
begin
dataset file T_ZY_JG_PROCESS_1_dataset
(
	schema: T_ZY_JG_PROCESS_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_JG_PROCESS.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc index P_index
(
 inputs:T_ZY_JG_PROCESS_1_dataset,
 table:T_ZY_JG_PROCESS
 );
 
dataproc doc P_doc
(  
   inputs:T_ZY_JG_PROCESS_1_dataset,
   table:T_ZY_JG_PROCESS
);

   dataproc map P_1_map
(  
   inputs:T_ZY_JG_PROCESS_1_dataset,
   table:T_ZY_JG_PROCESS
);
end;
run job 2_job (threads:8);


create job 3_job(3)
begin
dataset file T_GG_SJ_GOODS_dataset
(
	schema: "T_GG_SJ_GOODS_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_GG_SJ_GOODS.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_RK_INBILLDETAIL_dataset
(
	schema: T_ZY_RK_INBILLDETAIL_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_RK_INBILLDETAIL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_JG_PROCARTICLEDTL_dataset
(
	schema: T_ZY_JG_PROCARTICLEDTL_schema,
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_JG_PROCARTICLEDTL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_GH_CHANGEOWNERLIST_dataset
(
	schema: T_ZY_GH_CHANGEOWNERLIST_schema,
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_GH_CHANGEOWNERLIST.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_GH_CHANGEOWNERDETAIL_dataset
(
	schema: T_ZY_GH_CHANGEOWNERDETAIL_schema,
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_GH_CHANGEOWNERDETAIL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_CK_OUTPACK_dataset
(
	schema: T_ZY_CK_OUTPACK_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_CK_OUTPACK.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_JG_PROCMATERIALDTL_dataset
(
	schema: T_ZY_JG_PROCMATERIALDTL_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_JG_PROCMATERIALDTL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_CK_CLEAR_dataset
(
	schema: T_ZY_CK_CLEAR_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_CK_CLEAR.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_JG_PROCESS_dataset
(
	schema: T_ZY_JG_PROCESS_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_JG_PROCESS.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
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
	AND CHANGEDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')"
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
		(fname:"GOODSOWNERPACKNUM"),
		(fname:"PACKNUM"),
		(fname:"CHANGEOWNERNO"),
		(fname:"DEPTID",alias:"DEPTID_1",type:"string"),
		(fname:"GRADENUMXH"),
		(fname:"SINGLESHEETNUM"),
		(fname:"OWNERNAME"),
		(fname:"GOODSOWNERMANAGENUM",alias:"GOODSOWNERMANAGENO",type:"string")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERDETAIL_dataset",
	 order_by:("DEPTID_1","CHANGEOWNERNO")
);

dataproc join T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join
(
	inputs:
		(left_input:T_ZY_GH_CHANGEOWNERLIST_select,right_input:T_ZY_GH_CHANGEOWNERDETAIL_select),
	join_keys:
	(
		("left_input.DEPTID","right_input.DEPTID_1"),
		("left_input.CHANGEOWNERID","right_input.CHANGEOWNERNO")
	)
);



dataproc select T_GG_SJ_GOODS_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"MANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNO"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 conditions:"GOODSSTATENO = '110'
		AND R_RECORD_IS_DELETED = 0
		AND DEPTID = '101'",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

dataproc select T_ZY_RK_INBILLDETAIL_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"MANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNO"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_RK_INBILLDETAIL_dataset",
	 conditions:"DEPTID = '101'
		AND GOODSSTATENO = '20'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	  group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

 dataproc select T_ZY_JG_PROCARTICLEDTL_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"MANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNO"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"\'null\'",alias:"SIDEMARK",type:"string"),
	   (fname:"\'null\'",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCARTICLEDTL_dataset",
	 conditions:"DEPTID = '101'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')
		AND GOODSSTATENO = '130'",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_select
(
	 fields: 
	 (
       (fname:"NEWOWNERNO",alias:"OWNERID",type:"string"),
       (fname:"MANAGENUM",alias:"MANAGENO",type:"string"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNUM"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"\'null\'",alias:"SIDEMARK",type:"string"),
	   (fname:"\'null\'",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

dataproc select T_ZY_CK_OUTPACK_select
(
	 fields: 
	 (
       (fname:"OWNERNO"),
       (fname:"MANAGENUM",alias:"MANAGENO",type:"string"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNUM"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_CK_OUTPACK_dataset",
	 conditions:"DEPTID = '101'
		AND OUTCUSTTIME >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

dataproc select T_GG_SJ_GOODS_2_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"MANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNO"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 conditions:"CREATDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

dataproc select T_ZY_JG_PROCMATERIALDTL_select
(
	 fields: 
	 (
       (fname:"OWNERID"),
       (fname:"MANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNO"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"\'null\'",alias:"SIDEMARK",type:"string"),
	   (fname:"\'null\'",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCMATERIALDTL_dataset",
	 conditions:"vf_PROCESSID = '1'
	   and vf_DEPTID = '1' ",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_1_select
(
	 fields: 
	 (
       (fname:"PREOWNERNO",alias:"OWNERID",type:"string"),
       (fname:"PREMANAGENUM",alias:"MANAGENO",type:"string"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNUM"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"0",alias:"GRADENUMXH",type:"double"),
	   (fname:"0",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"\'null\'",alias:"SIDEMARK",type:"string"),
	   (fname:"\'null\'",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join",
	 group_by:(OWNERID,MANAGENO,PACKNUM,GRADENUM,GOODSLOCID,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE,SIDEMARK,SHIPNAME)
);
 
dataproc union 1_union
(
    inputs:("T_GG_SJ_GOODS_select","T_ZY_RK_INBILLDETAIL_select","T_ZY_JG_PROCARTICLEDTL_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_select","T_ZY_CK_OUTPACK_select","T_GG_SJ_GOODS_2_select","T_ZY_JG_PROCMATERIALDTL_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_1_select")
);

dataproc select union_select
(
	fields: 
	 (
       (fname:"OWNERID"),
	   (fname:"\'null\'",alias:"OWNERNAME",type:"string"),
       (fname:"MANAGENO"),
	   (fname:"PACKNUM"),
       (fname:"GRADENUM",alias:"GRADENUM",type:"string"),
       (fname:"GOODSLOCID",alias:"GOODSLOCID",type:"string"),
       (fname:"KINDNAME"),
	   (fname:"SHOPSIGNNAME"),
	   (fname:"GOODSOWNERPACKNO"),
       (fname:"PRODAREANAME"),
       (fname:"FIRSTINDATE"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "1_union",
	 group_by:(OWNERID,OWNERNAME,MANAGENO,PACKNUM,KINDNAME,SHOPSIGNNAME,GOODSOWNERPACKNO,PRODAREANAME,FIRSTINDATE)
);
 
  dataproc statistics union_all_statistics
(
  inputs:union_select,
  table:union_all
);

end;

run job 3_job (threads:8);

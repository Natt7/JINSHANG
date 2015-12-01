
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
		(fname:"GOODSID"),
		(fname:"NETWEIGHT"),
		(fname:"GROSSWEIGHT"),
		(fname:"SHEETNUM"),
		(fname:"CHANGEOWNERNO"),
		(fname:"DEPTID",alias:"DEPTID_1",type:"string")
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

dataproc index T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_index
(
 inputs:T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join,
 table:T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL
 );
 
dataproc doc T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_doc
(
   inputs:T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join,
   table:T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL,
   format:T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_parser,
   fields:("DEPTID","CHANGEOWNERID","PREOWNERNO","NEWOWNERNO","PROOWNERNAME","CHANGEDATE","NEWOWNERNAME","NETWEIGHT","GROSSWEIGHT","SHEETNUM","GOODSID","CHANGEOWNERNO","DEPTID_1")
);



dataproc select T_GG_SJ_GOODS_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"GRADENUMXH"),
	   (fname:"SINGLESHEETNUM"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 conditions:"GOODSSTATENO = '110'
		AND R_RECORD_IS_DELETED = 0
		AND DEPTID = '101'",
	 order_by:("GOODSID")	 
);

dataproc select T_ZY_RK_INBILLDETAIL_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"GRADENUMXH"),
	   (fname:"SINGLESHEETNUM"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_ZY_RK_INBILLDETAIL_dataset",
	 conditions:"DEPTID = '101'
		AND GOODSSTATENO = '110'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	  order_by:("GOODSID")
);

dataproc select T_ZY_JG_PROCARTICLEDTL_select
(
	 fields: 
	 (
       (fname:"PROCARTICLEDTLID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"\'0\'",alias:"GRADENUMXH",type:"double"),
	   (fname:"\'0\'",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_ZY_JG_PROCARTICLEDTL_dataset",
	 conditions:"DEPTID = '101'
		AND FIRSTINDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')
		AND GOODSSTATENO = '130'",
	 order_by:("OWNERID")
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"NEWOWNERNO",alias:"OWNERID",type:"string"),
       (fname:"NEWOWNERNAME",alias:"OWNERNAME",type:"string"),
       (fname:"\'0\'",alias:"GRADENUMXH",type:"double"),
	   (fname:"\'0\'",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join",
	 order_by:("GOODSID")
);

dataproc select T_ZY_CK_OUTPACK_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"OWNERNO"),
	   (fname:"OWNERNAME"),
       (fname:"GRADENUMXH"),
	   (fname:"SINGLESHEETNUM"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_ZY_CK_OUTPACK_dataset",
	 conditions:"DEPTID = '101'
		AND OUTCUSTTIME >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	order_by:("GOODSID")
);

dataproc select T_GG_SJ_GOODS_2_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"GRADENUMXH"),
	   (fname:"SINGLESHEETNUM"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 conditions:"CREATDATE >= TO_DATE ('2012-07-02', '%Y-%m-%d')",
	 order_by:("GOODSID")
);

dataproc select T_ZY_JG_PROCMATERIALDTL_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"\'0\'",alias:"GRADENUMXH",type:"double"),
	   (fname:"\'0\'",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_ZY_JG_PROCMATERIALDTL_dataset",
	 conditions:"vf_PROCESSID = 1
	   and vf_DEPTID = 1 ",
	 order_by:("GOODSID")
);

dataproc select T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_1_select
(
	 fields: 
	 (
       (fname:"GOODSID"),
       (fname:"PREOWNERNO",alias:"OWNERID",type:"string"),
       (fname:"PROOWNERNAME",alias:"OWNERNAME",type:"string"),
       (fname:"\'0\'",alias:"GRADENUMXH",type:"double"),
	   (fname:"\'0\'",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"NETWEIGHT"),
       (fname:"GROSSWEIGHT"),
       (fname:"SHEETNUM")
	 ),
	 inputs: "T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_join",
	order_by:("GOODSID")
);

dataproc union 1_union
(
    inputs:("T_GG_SJ_GOODS_select","T_ZY_RK_INBILLDETAIL_select","T_ZY_JG_PROCARTICLEDTL_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_select","T_ZY_CK_OUTPACK_select","T_GG_SJ_GOODS_2_select","T_ZY_JG_PROCMATERIALDTL_select","T_ZY_GH_CHANGEOWNERLIST_T_ZY_GH_CHANGEOWNERDETAIL_1_select")
);

dataproc select T_GG_SJ_GOODS_3_select
(
	fields:
	(
		(fname:"PREGOODSID"),
		(fname:"SIDEMARK"),
		(fname:"SHIPNAME"),
		(fname:"R_RECORD_IS_DELETED"),
		(fname:"DEPTID"),
		(fname:"GOODSID",alias:"GOODSID_1",type:"string")
	),
	inputs:"T_GG_SJ_GOODS_dataset",
	conditions:"DEPTID = '101'
	   and R_RECORD_IS_DELETED = 0 ",
	order_by:("GOODSID_1")
);

dataproc select 1_union_select
(
	fields:
	(
		(fname:"OWNERID"),
		(fname:"OWNERNAME"),
		(fname:"GRADENUMXH"),
		(fname:"SINGLESHEETNUM"),
		(fname:"NETWEIGHT"),
		(fname:"GROSSWEIGHT"),
		(fname:"SHEETNUM"),
		(fname:"GOODSID")
	),
	inputs:"1_union",
	order_by:("GOODSID")
);

dataproc leftjoin T_GG_SJ_GOODS_3_1_union_join
(
	inputs:
		(left_input:T_GG_SJ_GOODS_3_select,right_input:1_union_select),
	join_keys:
	(
		("left_input.GOODSID_1","right_input.GOODSID")
	)
);

dataproc select leftjoin_select
(
	fields: 
	 (
       (fname:"PREGOODSID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_3_1_union_join",
	 group_by:(PREGOODSID,OWNERID,SIDEMARK,SHIPNAME)
);

dataproc select leftjoin_1_select
(
	fields: 
	 (
       (fname:"PREGOODSID"),
       (fname:"OWNERID"),
	   (fname:"OWNERNAME"),
       (fname:"sum(GRADENUMXH)",alias:"GRADENUMXH",type:"double"),
	   (fname:"sum(SINGLESHEETNUM)",alias:"SINGLESHEETNUM",type:"double"),
	   (fname:"SIDEMARK",alias:"SIDEMARK",type:"string"),
	   (fname:"SHIPNAME",alias:"SHIPNAME",type:"string"),
       (fname:"sum(NETWEIGHT)",alias:"NETWEIGHT",type:"double"),
       (fname:"sum(GROSSWEIGHT)",alias:"GROSSWEIGHT",type:"double"),
       (fname:"sum(SHEETNUM)",alias:"SHEETNUM",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_3_1_union_join",
	 group_by:(PREGOODSID,OWNERID,SIDEMARK,SHIPNAME)
);


dataproc statistics union_all_statistics
(
  inputs:leftjoin_select,
  table:join_1
);

dataproc select T_GG_SJ_GOODS_4_select
(
	fields:
	(
		(fname:"GOODSLOCID"),
		(fname:"DEPTID"),
		(fname:"R_RECORD_IS_DELETED"),
		(fname:"GOODSID",type:"string"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"PRODAREANAME"),
		(fname:"FIRSTINDATE"),
		(fname:"PACKNUM"),
		(fname:"GRADENUM"),  
		(fname:"MANAGENO")
	),
	inputs:"T_GG_SJ_GOODS_dataset",
	conditions:"DEPTID = '101'
	   and R_RECORD_IS_DELETED = 0 ",
	order_by:("GOODSID")
);

dataproc select leftjoin_2_select
(
	fields:
	(
		(fname:"OWNERID"),
		(fname:"\'0\'",alias:"OWNERNAME",type:"string"),
		(fname:"GRADENUMXH"),
		(fname:"SINGLESHEETNUM"),
		(fname:"SIDEMARK"),      
		(fname:"SHIPNAME"),      
		(fname:"NETWEIGHT"),     
		(fname:"GROSSWEIGHT"),   
		(fname:"SHEETNUM"),      
		(fname:"PREGOODSID")     
	),
	inputs:"leftjoin_1_select",
	order_by:("PREGOODSID")
);

dataproc leftjoin T_GG_SJ_GOODS_4_join
(
	inputs:
		(left_input:T_GG_SJ_GOODS_4_select,right_input:leftjoin_2_select),
	join_keys:
	(
		("left_input.GOODSID","right_input.PREGOODSID")
	)
);

dataproc index join_2_1_index
(
 inputs:T_GG_SJ_GOODS_4_join,
 table:join_2
 );
 
dataproc doc join_2_doc
(  
   inputs:T_GG_SJ_GOODS_4_join,
   table:join_2,
   format:join_2_parser,
   fields:("OWNERID","OWNERNAME","GRADENUMXH","SINGLESHEETNUM","SIDEMARK","SHIPNAME","NETWEIGHT","GROSSWEIGHT","SHEETNUM","PACKNUM","MANAGENO","GRADENUM","PREGOODSID","GOODSLOCID","DEPTID","R_RECORD_IS_DELETED","GOODSID","KINDNAME","SHOPSIGNNAME","PRODAREANAME","FIRSTINDATE")
);

end;

run job 3_job (threads:8);


create job 1_job(6)
begin
dataset file T_ZY_CK_OUTBILL_1_dataset
(
	schema: "T_ZY_CK_OUTBILL_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_CK_OUTBILL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc index T_ZY_CK_OUTBILL_index
(
 inputs:T_ZY_CK_OUTBILL_1_dataset,
 table:T_ZY_CK_OUTBILL
 );
 
dataproc doc T_ZY_CK_OUTBILL_doc
(  
   inputs:T_ZY_CK_OUTBILL_1_dataset,
   table:T_ZY_CK_OUTBILL
);

   dataproc map T_ZY_CK_CLEAR_1_map
(  
   inputs:T_ZY_CK_OUTBILL_1_dataset,
   table:T_ZY_CK_OUTBILL
);
end;
run job 1_job (threads:8);


create job 2_job(2)
begin
dataset file T_ZY_GH_CHANGEOWNERLIST_1_dataset
(
	schema: "T_ZY_GH_CHANGEOWNERLIST_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_GH_CHANGEOWNERLIST.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc index T_ZY_GH_CHANGEOWNERLIST_index
(
 inputs:T_ZY_GH_CHANGEOWNERLIST_1_dataset,
 table:T_ZY_GH_CHANGEOWNERLIST
 );
 
dataproc doc T_ZY_GH_CHANGEOWNERLIST_doc
(  
   inputs:T_ZY_GH_CHANGEOWNERLIST_1_dataset,
   table:T_ZY_GH_CHANGEOWNERLIST
);

   dataproc map T_ZY_GH_CHANGEOWNERLIST_1_map
(  
   inputs:T_ZY_GH_CHANGEOWNERLIST_1_dataset,
   table:T_ZY_GH_CHANGEOWNERLIST
);
end;
run job 2_job (threads:8);

create job 3_job(3)
begin
dataset file T_ZY_JG_PROCESS_1_dataset
(
	schema: "T_ZY_JG_PROCESS_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_JG_PROCESS.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc index T_ZY_JG_PROCESS_index
(
 inputs:T_ZY_JG_PROCESS_1_dataset,
 table:T_ZY_JG_PROCESS
 );
 
dataproc doc T_ZY_JG_PROCESS_doc
(  
   inputs:T_ZY_JG_PROCESS_1_dataset,
   table:T_ZY_JG_PROCESS
);

   dataproc map T_ZY_JG_PROCESS_1_map
(  
   inputs:T_ZY_JG_PROCESS_1_dataset,
   table:T_ZY_JG_PROCESS
);
end;
run job 3_job (threads:8);

create job 4_job(4)
begin
dataset file T_XTSZ_BIND_1_dataset
(
	schema: "T_XTSZ_BIND_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_XTSZ_BIND.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc index T_XTSZ_BIND_index
(
 inputs:T_XTSZ_BIND_1_dataset,
 table:T_XTSZ_BIND
 );
 
dataproc doc T_XTSZ_BIND_doc
(  
   inputs:T_XTSZ_BIND_1_dataset,
   table:T_XTSZ_BIND
);

   dataproc map T_XTSZ_BIND_1_map
(  
   inputs:T_XTSZ_BIND_1_dataset,
   table:T_XTSZ_BIND
);
end;
run job 4_job (threads:8);



create job 5_job(3)
begin
dataset file T_XTSZ_BIND_dataset
(
	schema: "T_XTSZ_BIND_schema",
    filename: "/home/zhaoshun/Data/jinshang_New/T_XTSZ_BIND.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

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

dataset file T_ZY_CK_OUTBILL_dataset
(
	schema: T_ZY_CK_OUTBILL_schema,
	filename: "/home/zhaoshun/Data/jinshang_New/T_ZY_CK_OUTBILL.txt",
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

dataproc select T_GG_SJ_GOODS_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_GG_SJ_GOODS_dataset",
	order_by:("DEPTID"),
	conditions:"GOODSSTATENO = '110'
	and DEPT_ID = '1' "
);

dataproc select T_ZY_RK_INBILLDETAIL_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_RK_INBILLDETAIL_dataset",
	order_by:("DEPTID"),
	conditions:"TO_CHAR (FIRSTINDATE, '%Y-%m-%d') > '2012-07-16'
	and DEPT_ID = '1'"
);

dataproc select T_ZY_GH_CHANGEOWNERDETAIL_select 
(
	fields:
	(
		(fname:"MANAGENUM"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_GH_CHANGEOWNERDETAIL_dataset",
	order_by:("DEPTID"),
	conditions:"vf_DEPTID = '1' 
	and CHANGEOWNERID = '1'"
);

dataproc select T_ZY_JG_PROCARTICLEDTL_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_JG_PROCARTICLEDTL_dataset",
	order_by:("DEPTID"),
	conditions:"DEPTID = '101'
	and TO_CHAR (ACCEPTANCE_TIME, '%Y-%m-%d') > '2012-07-16'
	and DEPT_ID = '1'"
);

dataproc select T_ZY_CK_OUTPACK_select 
(
	fields:
	(
		(fname:"MANAGENUM"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_CK_OUTPACK_dataset",
	order_by:("DEPTID"),
	conditions:"DEPT_ID = '1'
	and vf_DEPTID = '1'"
);

dataproc select T_ZY_GH_CHANGEOWNERDETAIL_2_select 
(
	fields:
	(
		(fname:"MANAGENUM"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_GH_CHANGEOWNERDETAIL_dataset",
	order_by:("DEPTID"),
	conditions:"vf_DEPTID = '1' 
	and CHANGEOWNERID = '1'"
);

dataproc select T_ZY_JG_PROCMATERIALDTL_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_JG_PROCMATERIALDTL_dataset",
	order_by:("DEPTID"),
	conditions:"DEPTID LIKE '080%'
	and vf_DEPTID = '1'
	and DEPT_ID = '1'"
);

dataproc union union_1_1
(
	inputs:("T_GG_SJ_GOODS_select","T_ZY_RK_INBILLDETAIL_select","T_ZY_GH_CHANGEOWNERDETAIL_select","T_ZY_JG_PROCARTICLEDTL_select","T_ZY_CK_OUTPACK_select","T_ZY_GH_CHANGEOWNERDETAIL_2_select","T_ZY_JG_PROCMATERIALDTL_select")
);

dataproc select union_1_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"NETWEIGHT")
	),
	inputs:"union_1_1",
	order_by:("MANAGENO")
);

dataproc select union_2_select
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"30",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"union_1_1",
	order_by:("MANAGENO")
);

dataproc index T_ZY_CK_OUTBILL_index
(
 inputs:union_1_select,
 table:union_1
 );
 
dataproc doc T_ZY_CK_OUTBILL_doc
(  
   inputs:union_1_select,
   table:union_1,
   format:union_1_parser,
   fields:("MANAGENO","KINDNAME","SHOPSIGNNAME","GRADENUM","PRODAREANAME","DEPTID","NETWEIGHT")
);

dataproc select T_ZY_RK_INBILLDETAIL_2_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"10",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_RK_INBILLDETAIL_dataset",
	order_by:("MANAGENO"),
	conditions:"TO_CHAR (FIRSTINDATE, '%Y-%m-%d') >= '2012-07-16'
	and TO_CHAR (FIRSTINDATE, '%Y-%m-%d') <= '2015-07-16'
	and DEPT_ID = '1' 
	and OWNER_ID = '1'"
);

dataproc select T_ZY_CK_OUTPACK_2_select 
(
	fields:
	(
		(fname:"MANAGENUM"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"20",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_CK_OUTPACK_dataset",
	order_by:("DEPTID"),
	conditions:"DEPT_ID = '1' 
	and OWNER_ID = '1'
	and vf_2_DEPTID = '1' 
	and vf_2_OUTBILLID = '1'"
);

dataproc select T_ZY_GH_CHANGEOWNERDETAIL_3_select 
(
	fields:
	(
		(fname:"MANAGENUM"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"11",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_GH_CHANGEOWNERDETAIL_dataset",
	order_by:("DEPTID"),
	conditions:"NEWOWNERNO = OWNER_ID
	and vf_2_DEPTID = '1' 
	and vf_2_CHANGEOWNERID = '1'"
);

dataproc select T_ZY_GH_CHANGEOWNERDETAIL_4_select 
(
	fields:
	(
		(fname:"MANAGENUM"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"21",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_GH_CHANGEOWNERDETAIL_dataset",
	order_by:("DEPTID"),
	conditions:"PREOWNERNO = OWNER_ID
	and vf_2_DEPTID = '1' 
	and vf_2_CHANGEOWNERID = '1'"
);

dataproc select T_ZY_JG_PROCARTICLEDTL_2_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"12",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_JG_PROCARTICLEDTL_dataset",
	order_by:("DEPTID"),
	conditions:"DEPTID LIKE '080%'
	and TO_CHAR (ACCEPTANCE_TIME, '%Y-%m-%d') >= '2012-07-16'
	and TO_CHAR (ACCEPTANCE_TIME, '%Y-%m-%d') <= '2015-07-16'
	and DEPT_ID = '1' 
	and OWNER_ID = '1'"
);

dataproc select T_ZY_JG_PROCMATERIALDTL_2_select 
(
	fields:
	(
		(fname:"MANAGENO"),
		(fname:"KINDNAME"),
		(fname:"SHOPSIGNNAME"),
		(fname:"GRADENUM"),
		(fname:"PRODAREANAME"),
		(fname:"DEPTID"),
		(fname:"22",alias:"GOODTYPE",type:"double"),
		(fname:"NETWEIGHT")
	),
	inputs:"T_ZY_JG_PROCMATERIALDTL_dataset",
	order_by:("DEPTID"),
	conditions:"DEPTID LIKE '080%'
	and vf_DEPTID = '1'
	and vf_PROCESSID = '1'
	and vf_2_DEPTID = '1' 
	and vf_2_PROCESSID = '1'"
);

dataproc union union_all_1
(
	inputs:("union_2_select","T_ZY_RK_INBILLDETAIL_2_select","T_ZY_CK_OUTPACK_2_select","T_ZY_GH_CHANGEOWNERDETAIL_3_select","T_ZY_GH_CHANGEOWNERDETAIL_4_select","T_ZY_JG_PROCARTICLEDTL_2_select","T_ZY_JG_PROCMATERIALDTL_2_select")
);

dataproc select union_all_1_select
(
	fields:(
		(fname:"nvl (MANAGENO,'NULL')",alias:"MANAGENO",type:"string"),
		(fname:"nvl (KINDNAME,'NULL')",alias:"KINDNAME",type:"string"),
		(fname:"nvl (SHOPSIGNNAME,'NULL')",alias:"SHOPSIGNNAME",type:"string"),
		(fname:"nvl (PRODAREANAME,'NULL')",alias:"PRODAREANAME",type:"string"),
		(fname:"sum(case GOODTYPE when 10 then NETWEIGHT else 0 end)",alias:"INSTOCK",type:"double"),
		(fname:"sum(case GOODTYPE when 20 then NETWEIGHT else 0 end)",alias:"OUTSTOCK",type:"double"),
		(fname:"sum(case GOODTYPE when 11 then NETWEIGHT else 0 end)",alias:"CHANGINSTOCK",type:"double"),
		(fname:"sum(case GOODTYPE when 21 then NETWEIGHT else 0 end)",alias:"CHANGOUTSTOCK",type:"double"),
		(fname:"sum(case GOODTYPE when 12 then NETWEIGHT else 0 end)",alias:"PROCESSINSTOCK",type:"double"),
		(fname:"sum(case GOODTYPE when 22 then NETWEIGHT else 0 end)",alias:"PROCESSOUTSTOCK",type:"double"),
		(fname:"sum(case GOODTYPE when 30 then NETWEIGHT else 0 end)",alias:"ENDSTOCK",type:"double")
	),
	inputs: "union_all_1"
);

dataproc select union_all_1_1_select
(
	fields:(
		(fname:"MANAGENO",type:"string"),
		(fname:"KINDNAME",type:"string"),
		(fname:"SHOPSIGNNAME",type:"string"),
		(fname:"PRODAREANAME",type:"string"),
		(fname:"INSTOCK",type:"double"),
		(fname:"OUTSTOCK",type:"double"),
		(fname:"CHANGINSTOCK",type:"double"),
		(fname:"CHANGOUTSTOCK",type:"double"),
		(fname:"PROCESSINSTOCK",type:"double"),
		(fname:"PROCESSOUTSTOCK",type:"double"),
		(fname:"ENDSTOCK",type:"double"),
		(fname:"ENDSTOCK-INSTOCK+OUTSTOCK",alias:"BEGINSTOCK",type:"double")
	),
	inputs: "union_all_1_select",
	group_by:(MANAGENO,KINDNAME,SHOPSIGNNAME,PRODAREANAME)
);

dataproc index union_all_2_index
(
 inputs:union_all_1_1_select,
 table:union_all
 );
 
dataproc doc union_all_2_doc
(  
   inputs:union_all_1_1_select,
   table:union_all,
   format:union_all_parser,
   fields:("MANAGENO","KINDNAME","SHOPSIGNNAME","PRODAREANAME","INSTOCK","OUTSTOCK","CHANGINSTOCK","CHANGOUTSTOCK","PROCESSINSTOCK","PROCESSOUTSTOCK","ENDSTOCK","BEGINSTOCK")
);

end;

run job 5_job (threads:8);

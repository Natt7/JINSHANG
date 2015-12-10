create job 1_job(2)
begin
dataset file T_GG_SJ_GOODS_dataset
(
	schema: T_GG_SJ_GOODS_schema,
    filename: "/home/natt/jsdata/T_GG_SJ_GOODS.csv",
	serverid: 0,
	charset:utf-8,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_RK_INBILL_dataset
(
	schema: T_ZY_RK_INBILL_schema,
	filename: "/home/natt/jsdata/T_ZY_RK_INBILL.csv",
	serverid: 0,
	charset:utf-8,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_CK_OUTBILL_dataset
(
	schema: T_ZY_CK_OUTBILL_schema,
    filename: "/home/natt/jsdata/T_ZY_CK_OUTBILL.csv",
	serverid: 0,
	charset:utf-8,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_JG_PROCESS_dataset
(
	schema: T_ZY_JG_PROCESS_schema,
	filename: "/home/natt/jsdata/T_ZY_JG_PROCESS.csv",
	serverid: 0,
	charset:utf-8,
	splitter: (block_size: 10000000)
);

dataproc select 1_select
(
	 fields: 
	 (
       (fname:"netweight",alias:"store_amount",type:"double"),
       (fname:"0",alias:"store_in_amount",type:"double"),
       (fname:"0",alias:"store_out_amount",type:"double"),
       (fname:"0",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 order_by:("store_process_amount"),
	 conditions:" goodsstateno = '110'
		AND deptid NOT LIKE '03%'
		AND deptid NOT LIKE 'ZZ%'
		AND deptid NOT LIKE 'MG%' "
);

dataproc select 2_select
(
	 fields: 
	 (
       (fname:"0",alias:"store_amount",type:"double"),
       (fname:"netweightsum",alias:"store_in_amount",type:"double"),
       (fname:"0",alias:"store_out_amount",type:"double"),
       (fname:"0",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_ZY_RK_INBILL_dataset",
	 order_by:("store_process_amount"),
	 conditions:" deptid NOT LIKE '03%'
		AND deptid NOT LIKE 'ZZ%'
		AND deptid NOT LIKE 'MG%' "
);
 
 dataproc select 3_select
(
	 fields: 
	 (
       (fname:"0",alias:"store_amount",type:"double"),
       (fname:"0",alias:"store_in_amount",type:"double"),
       (fname:"netweightsum",alias:"store_out_amount",type:"double"),
       (fname:"0",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_ZY_CK_OUTBILL_dataset",
	 order_by:("store_process_amount"),
	 conditions:" deptid NOT LIKE '03%'
		AND deptid NOT LIKE 'ZZ%'
		AND deptid NOT LIKE 'MG%' "
);

dataproc select 4_select
(
	 fields: 
	 (
       (fname:"0",alias:"store_amount",type:"double"),
       (fname:"0",alias:"store_in_amount",type:"double"),
       (fname:"0",alias:"store_out_amount",type:"double"),
       (fname:"preweightsum",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCESS_dataset",
	 order_by:("store_process_amount"),
	 conditions:" deptid NOT LIKE '03%'
		AND deptid NOT LIKE 'ZZ%'
		AND deptid NOT LIKE 'MG%' "
);
 
dataproc union 1_union
(
    inputs:("1_select","2_select","3_select","4_select")
);

dataproc select union_select
(
	fields: 
	 (
       (fname:"store_amount",type:"double"),
       (fname:"store_in_amount",type:"double"),
       (fname:"store_out_amount",type:"double"),
       (fname:"store_process_amount",type:"double")
	 ),
	inputs:"1_union",
	cache:true
);
 
  dataproc statistics union_all_statistics
(
  inputs:union_select,
  table:union_all
);

end;

run job 1_job (threads:8);

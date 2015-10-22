create job 1_job(2)
begin
dataset file T_GG_SJ_GOODS_dataset
(
	schema: T_GG_SJ_GOODS_schema,
    filename: "/home/zhaoshun/Data/jingshang_data/T_GG_SJ_GOODS.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_RK_INBILL_dataset
(
	schema: T_ZY_RK_INBILL_schema,
	filename: "/home/zhaoshun/Data/jingshang_data/T_ZY_RK_INBILL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_CK_OUTBILL_dataset
(
	schema: T_ZY_CK_OUTBILL_schema,
    filename: "/home/zhaoshun/Data/jingshang_data/T_ZY_CK_OUTBILL.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataset file T_ZY_JG_PROCESS_dataset
(
	schema: T_ZY_JG_PROCESS_schema,
	filename: "/home/zhaoshun/Data/jingshang_data/T_ZY_JG_PROCESS.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc select 1_select
(
	 fields: 
	 (
       (fname:"netweight",alias:"store_amount",type:"double"),
       (fname:"\'0\'",alias:"store_in_amount",type:"double"),
       (fname:"\'0\'",alias:"store_out_amount",type:"double"),
       (fname:"\'0\'",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_GG_SJ_GOODS_dataset",
	 order_by:("store_process_amount")
);

dataproc select 2_select
(
	 fields: 
	 (
       (fname:"\'0\'",alias:"store_amount",type:"double"),
       (fname:"netweightsum",alias:"store_in_amount",type:"double"),
       (fname:"\'0\'",alias:"store_out_amount",type:"double"),
       (fname:"\'0\'",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_ZY_RK_INBILL_dataset",
	 order_by:("store_process_amount")
);
 
 dataproc select 3_select
(
	 fields: 
	 (
       (fname:"\'0\'",alias:"store_amount",type:"double"),
       (fname:"\'0\'",alias:"store_in_amount",type:"double"),
       (fname:"netweightsum",alias:"store_out_amount",type:"double"),
       (fname:"\'0\'",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_ZY_CK_OUTBILL_dataset",
	 order_by:("store_process_amount")
);

dataproc select 4_select
(
	 fields: 
	 (
       (fname:"\'0\'",alias:"store_amount",type:"double"),
       (fname:"\'0\'",alias:"store_in_amount",type:"double"),
       (fname:"\'0\'",alias:"store_out_amount",type:"double"),
       (fname:"preweightsum",alias:"store_process_amount",type:"double")
	 ),
	 inputs: "T_ZY_JG_PROCESS_dataset",
	 order_by:("store_process_amount")
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

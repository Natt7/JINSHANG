create job add_2_job(2)
begin

dataset file T_ZY_RK_INBILL_dataset_11
(
	schema: T_ZY_RK_INBILL_schema,
	filename: "/home/zhaoshun/Data/jingshang_data/T_ZY_RK_INBILL_add.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc select union_select
(   
	inputs: "T_ZY_RK_INBILL_dataset_11",
	fields: 
	 (
       (fname:"\'0\'",alias:"store_amount",type:"double"),
       (fname:"netweightsum",alias:"store_in_amount",type:"double"),
       (fname:"\'0\'",alias:"store_out_amount",type:"double"),
       (fname:"\'0\'",alias:"store_process_amount",type:"double")
	 ),
	distinct: true,
	cache:true
); 

  dataproc statistics T_ZY_RK_INBILL_add_statistics
(
	inputs:union_select,
	table:union_all
);

end;

run job add_2_job (threads:8);
create job add_1_job(2)
begin

dataset file T_GG_SJ_GOODS_dataset_11
(
	schema: T_GG_SJ_GOODS_schema,
    filename: "/home/zhaoshun/jinshang110/add/T_GG_SJ_GOODS_add.csv",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc select union_select
(   
	inputs: "T_GG_SJ_GOODS_dataset_11",
	 fields: 
	 (
       (fname:"netweight",alias:"store_amount",type:"double"),
       (fname:"0",alias:"store_in_amount",type:"double"),
       (fname:"0",alias:"store_out_amount",type:"double"),
       (fname:"0",alias:"store_process_amount",type:"double")
	 ),
	 distinct: true,
	 cache:true,
	 conditions:" goodsstateno = '110'
		AND deptid NOT LIKE '03%'
		AND deptid NOT LIKE 'ZZ%'
		AND deptid NOT LIKE 'MG%' "
);

  dataproc statistics T_GG_SJ_GOOS_statistics
(
	inputs:"union_select",
	table:union_all
);

end;

run job add_1_job (threads:8);

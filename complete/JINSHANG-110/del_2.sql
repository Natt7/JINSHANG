create job del_2_job(2)
begin

dataset file T_ZY_RK_INBILL_dataset_22
(
	schema: T_ZY_RK_INBILL_schema,
	filename: "/home/natt/syncdata/oraclesyncdata/t_zy_rk_inbill/delete/delete.csv",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc select union_select
(   
	inputs: "T_ZY_RK_INBILL_dataset_22",
	fields: 
	 (
       (fname:"0",alias:"store_amount",type:"double"),
       (fname:"netweightsum",alias:"store_in_amount",type:"double"),
       (fname:"0",alias:"store_out_amount",type:"double"),
       (fname:"0",alias:"store_process_amount",type:"double")
	 ),
	distinct: true,
	data_opr:delete,
    cache:true,
	conditions:" deptid NOT LIKE '03%'
		AND deptid NOT LIKE 'ZZ%'
		AND deptid NOT LIKE 'MG%' "
); 

  dataproc statistics T_ZY_RK_INBILL_del_statistics
(
	inputs:union_select,
	table:union_all,
	data_opr:delete
);

end;

run job del_2_job (threads:8);
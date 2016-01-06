create job 2_job(8)
begin

dataset file T_GG_SJ_GOODS_dataset
(
	schema: "T_GG_SJ_GOODS_schema",
    filename: "/home/natt/Data/jinshang_Data_New/T_GG_SJ_GOODS.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_GG_SJ_GOODS_syncher
(
    inputs: T_GG_SJ_GOODS_dataset,
    database:db,
    operation:add, 
    table:T_GG_SJ_GOODS,
	stream:true,
	services : 
	(
		(dataprocname : T_GG_SJ_GOODS_dataset,
		serviceid: idx_job)
	)
);
end;

run job 2_job (threads:8);

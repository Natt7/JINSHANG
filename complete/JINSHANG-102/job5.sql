create job 5_job(8)
begin

dataset file T_ZY_JG_PROCARTICLEDTL_dataset
(
	schema: T_ZY_JG_PROCARTICLEDTL_schema,
    filename: "/home/zhaoshun/Data/jinshang-102/T_ZY_JG_PROCARTICLEDTL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_JG_PROCARTICLEDTL_syncher
(
    inputs: T_ZY_JG_PROCARTICLEDTL_dataset,
    database:db,
    operation:add, 
    table:T_ZY_JG_PROCARTICLEDTL,
	stream:true,
	services : 
	(
		(dataprocname : T_ZY_JG_PROCARTICLEDTL_dataset,
		serviceid: idx_job)
	)
);
end;

run job 5_job (threads:8);

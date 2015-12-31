create job 7_job(8)
begin

dataset file T_ZY_JG_PROCMATERIALDTL_dataset
(
	schema: T_ZY_JG_PROCMATERIALDTL_schema,
	filename: "/home/zhaoshun/Data/jinshang-102/T_ZY_JG_PROCMATERIALDTL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_JG_PROCMATERIALDTL_syncher
(
    inputs: T_ZY_JG_PROCMATERIALDTL_dataset,
    database:db,
    operation:add, 
    table:T_ZY_JG_PROCMATERIALDTL,
	stream:true,
	services : 
	(
		(dataprocname : T_ZY_JG_PROCMATERIALDTL_dataset,
		serviceid: idx_job)
	)
);
end;

run job 7_job (threads:8);

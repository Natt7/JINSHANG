create job 4_job(8)
begin

dataset file T_ZY_RK_INBILLDETAIL_dataset
(
	schema: T_ZY_RK_INBILLDETAIL_schema,
	filename: "/home/zhaoshun/Data/jinshang-102/T_ZY_RK_INBILLDETAIL.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_RK_INBILLDETAIL_syncher
(
    inputs: T_ZY_RK_INBILLDETAIL_dataset,
    database:db,
    operation:add, 
    table:T_ZY_RK_INBILLDETAIL,
	stream:true,
	services : 
	(
		(dataprocname : T_ZY_RK_INBILLDETAIL_dataset,
		serviceid: idx_job)
	)
);
end;

run job 4_job (threads:8);

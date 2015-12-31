create job 6_job(8)
begin

dataset file T_ZY_GH_CHANGEOWNERLIST_dataset
(
	schema: T_ZY_GH_CHANGEOWNERLIST_schema,
    filename: "/home/zhaoshun/Data/jinshang-102/T_ZY_GH_CHANGEOWNERLIST.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_GH_CHANGEOWNERLIST_syncher
(
    inputs: T_ZY_GH_CHANGEOWNERLIST_dataset,
    database:db,
    operation:add, 
    table:T_ZY_GH_CHANGEOWNERLIST,
	stream:true,
	services : 
	(
		(dataprocname : T_ZY_GH_CHANGEOWNERLIST_dataset,
		serviceid: idx_job)
	)
);
end;

run job 6_job (threads:8);

create job t_zy_ck_clear_insert_q1(zykie)
begin
dataset file T_ZY_CK_CLEAR1_1_dataset
(
	schema: "T_ZY_CK_CLEAR_schema",
    filename: "/home/natt/syncdata/oraclesyncdata/t_zy_ck_clear/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_CK_CLEAR_syncher
(
    inputs: T_ZY_CK_CLEAR1_1_dataset,
    database:db,
    operator:add, 
    table:T_ZY_CK_CLEAR
);
end;
run job t_zy_ck_clear_insert_q1(threads:8);

create job t_zy_jg_process_insert_q1(zykie)
begin
dataset file T_ZY_JG_PROCESS1_1_dataset
(
	schema: T_ZY_JG_PROCESS_schema,
	filename: "/home/natt/syncdata/oraclesyncdata/t_zy_jg_process/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_JG_PROCESS_syncher
(
    inputs: T_ZY_JG_PROCESS1_1_dataset,
    database:db,
    operator:add, 
    table:T_ZY_JG_PROCESS
);
end;
run job t_zy_jg_process_insert_q1(threads:8);

create job t_gg_sj_goods_insert_q1(zykie)
begin
dataset file T_GG_SJ_GOODS2_dataset
(
	schema: "T_GG_SJ_GOODS_schema",
    filename: "/home/natt/syncdata/oraclesyncdata/t_gg_sj_goods/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);
dataproc syncher T_GG_SJ_GOODS_syncher
(
    inputs: T_GG_SJ_GOODS2_dataset,
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
run job t_gg_sj_goods_insert_q1(threads:8);

create job t_zy_rk_inbilldetail_insert_q1(zykie)
begin
dataset file T_ZY_RK_INBILLDETAIL2_dataset
(
	schema: T_ZY_RK_INBILLDETAIL_schema,
	filename: "/home/natt/syncdata/oraclesyncdata/t_zy_rk_inbilldetail/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_RK_INBILLDETAIL_syncher
(
    inputs: T_ZY_RK_INBILLDETAIL2_dataset,
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
run job t_zy_rk_inbilldetail_insert_q1(threads:8);

create job t_zy_jg_procarticledtl_insert_q1(zykie)
begin
dataset file T_ZY_JG_PROCARTICLEDTL2_dataset
(
	schema: T_ZY_JG_PROCARTICLEDTL_schema,
    filename: "/home/natt/syncdata/oraclesyncdata/t_zy_jg_procarticledtl/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_JG_PROCARTICLEDTL_syncher
(
    inputs: T_ZY_JG_PROCARTICLEDTL2_dataset,
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
run job t_zy_jg_procarticledtl_insert_q1(threads:8);

create job t_zy_gh_changeownerlist_insert_q1(zykie)
begin
dataset file T_ZY_GH_CHANGEOWNERLIST2_dataset
(
	schema: T_ZY_GH_CHANGEOWNERLIST_schema,
    filename: "/home/natt/syncdata/oraclesyncdata/t_zy_gh_changeownerlist/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_GH_CHANGEOWNERLIST_syncher
(
    inputs: T_ZY_GH_CHANGEOWNERLIST2_dataset,
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
run job t_zy_gh_changeownerlist_insert_q1(threads:8);

create job t_zy_jg_procmaterialdtl_insert_q1(zykie)
begin
dataset file T_ZY_JG_PROCMATERIALDTL2_dataset
(
	schema: T_ZY_JG_PROCMATERIALDTL_schema,
	filename: "/home/natt/syncdata/oraclesyncdata/t_zy_jg_procmaterialdtl/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_JG_PROCMATERIALDTL_syncher
(
    inputs: T_ZY_JG_PROCMATERIALDTL2_dataset,
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
run job t_zy_jg_procmaterialdtl_insert_q1(threads:8);

create job t_zy_gh_changeownerdetail_insert_q1(zykie)
begin
dataset file T_ZY_GH_CHANGEOWNERDETAIL2_dataset
(
	schema: T_ZY_GH_CHANGEOWNERDETAIL_schema,
    filename: "/home/natt/syncdata/oraclesyncdata/t_zy_gh_changeownerdetail/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_GH_CHANGEOWNERDETAIL_syncher
(
    inputs: T_ZY_GH_CHANGEOWNERDETAIL2_dataset,
    database:db,
    operation:add, 
    table:T_ZY_GH_CHANGEOWNERDETAIL,
	stream:true,
	services : 
	(
		(dataprocname : T_ZY_GH_CHANGEOWNERDETAIL_dataset,
		serviceid: idx_job)
	)
);
end;
run job t_zy_gh_changeownerdetail_insert_q1(threads:8);

create job t_zy_ck_outpack_insert_q1(zykie)
begin
dataset file T_ZY_CK_OUTPACK2_dataset
(
	schema: T_ZY_CK_OUTPACK_schema,
	filename: "/home/natt/syncdata/oraclesyncdata/t_zy_ck_outpack/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000)
);

dataproc syncher T_ZY_CK_OUTPACK_syncher
(
    inputs: T_ZY_CK_OUTPACK2_dataset,
    database:db,
    operation:add, 
    table:T_ZY_CK_OUTPACK,
	stream:true,
	services : 
	(
		(dataprocname : T_ZY_CK_OUTPACK_dataset,
		serviceid: idx_job)
	)
);
end;
run job t_zy_ck_outpack_insert_q1(threads:8);


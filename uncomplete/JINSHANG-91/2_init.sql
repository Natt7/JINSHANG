create job 1_job(t3_schema)
begin
dataset file v_t_gg_sj_goods_out_dataset
(
	schema:"v_t_gg_sj_goods_out_schema",
	charset:"UTF8",
	filename:"/home/zhaoshun/Data/jingshang_data/V_T_GG_SJ_GOODS_OUT.txt",
	serverid:"0",
	splitter:( block_size:10000000 ) 
);

dataproc index v_t_gg_sj_goods_out_ind
(
	inputs:v_t_gg_sj_goods_out_dataset,
	table:v_t_gg_sj_goods_out
);

dataproc doc v_t_gg_sj_goods_out_doc
(
	inputs:v_t_gg_sj_goods_out_dataset,
	format:v_t_gg_sj_goods_out_parser,
	table:v_t_gg_sj_goods_out
);

dataproc map v_t_gg_sj_goods_out_map
(  
   inputs:v_t_gg_sj_goods_out_dataset,
   table:v_t_gg_sj_goods_out
);

end;

run job 1_job (threads:8);


create job 2_job(t3_schema)
begin
dataset file t_gg_tx_dl_bil_d_dataset
(
	schema:t_gg_tx_dl_bil_d_schema,
	charset:"UTF8",
	filename:"/home/zhaoshun/Data/jingshang_data/T_GG_TX_DL_BIL_D.txt",
	serverid: 0 ,
	splitter:( block_size:10000000 ) 
);

dataproc select t_gg_tx_dl_bil_d_select
(
	fields:
	(
		(fname:"bill_date",type:"datetime"),
		(fname:"resource_num",type:"string"),
		(fname:"bill_num",type:"string"),
		(fname:"out_settle_type",type:"string"),
		(fname:"deptid",type:"string"),
		(fname:"owner_num",type:"string"),
		(fname:"vf_netweight",type:"string"),
		(fname:"shopsign",type:"double"),
		(fname:"pack_num",type:"double"),
		(fname:"vf_packnum",type:"string")
	),
	inputs:t_gg_tx_dl_bil_d_dataset,
	cache:true
);

dataproc statistics t_statistics
(
	inputs:t_gg_tx_dl_bil_d_select,
	table:t_t
);

end;

run job 2_job (threads:8);

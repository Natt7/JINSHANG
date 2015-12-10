create job del_1_job(2)
begin

dataset file t_gg_sj_goods_dataset_22
(
	schema: t_gg_sj_goods_schema,
    filename: "/home/zhaoshun/Data/jingshang_data/T_GG_SJ_GOODS_del.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc select t_gg_sj_goods_select
(   
	fields:
	(
		(fname:"GOODSID",type:"string"),
		(fname:"DEPTID",type:"string"),
		(fname:"GRADENUM",type:"string"),
		(fname:"SHOPSIGNID",type:"string"),
		(fname:"SHOPSIGNNAME",type:"string"),
		(fname:"PRODAREAID",type:"string"),
		(fname:"PRODAREANAME",type:"string"),
		(fname:"KINDNO",type:"string"),
		(fname:"KINDNAME",type:"string"),
		(fname:"OWNERNAME",type:"string"),
		(fname:"GOODSOWNERPACKNO",type:"string"),
		(fname:"NETWEIGHT",type:"double"),
		(fname:"GROSSWEIGHT",type:"double"),
		(fname:"SHEETNUM",type:"double")
	),
	inputs: "t_gg_sj_goods_dataset_22",
	distinct: true,
	data_opr:delete,
	cache:true
); 

  dataproc statistics T_GG_SJ_GOODS_statistics_del
(
	inputs:t_gg_sj_goods_select,
	table:t_gg_sj_goods,
	data_opr:delete
);

end;

run job del_1_job (threads:8);

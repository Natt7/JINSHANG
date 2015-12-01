create job add_1_job(2)
begin
dataset file t_gg_sj_goods_dataset_11
(
	schema: t_gg_sj_goods_schema,
    filename: "/home/zhaoshun/Data/jingshang_data/T_GG_SJ_GOODS_add.txt",
	serverid: 0,
	splitter: (block_size: 10000000)
);

dataproc select t_gg_sj_goods_select11
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
	inputs: "t_gg_sj_goods_dataset_11",
	distinct: true
); 

dataproc distinct t_gg_sj_goods_dis 
(
	inputs:
	(   
		left_input:"t_gg_sj_goods_select11",
		right_input:"t_gg_sj_goods_select.output.cache"
	),
	left_fields:("GOODSID","DEPTID","GRADENUM","SHOPSIGNID"),
	right_fields:("GOODSID","DEPTID","GRADENUM","SHOPSIGNID"),
	leftadd:true,
	rightadd:false
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
	inputs: "t_gg_sj_goods_dis",
	cache:true
); 

dataproc statistics T_GG_SJ_GOOS_statistics
(
	inputs:"t_gg_sj_goods_select",
	table:t_gg_sj_goods
);

end;

run job add_1_job (threads:8);

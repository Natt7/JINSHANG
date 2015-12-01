create job t_common_dept_job(t_common)
begin
dataset file t_common_dept_dataset
(
	schema:t_common_dept_schema,
	filename: "/home/zhaoshun/Data/jingshang_data/T_COMMON_DEPT.txt",
	serverid: 0,
	splitter: (block_size: 10000000)		  		  
);

dataproc index t_common_dept_index
(
		inputs: t_common_dept_dataset,
		table: t_common_dept
);	
  dataproc doc t_common_dept_doc
(  
   inputs:t_common_dept_dataset,
   table:t_common_dept
);

dataproc map t_common_dept_map
(  
   inputs:t_common_dept_dataset,
   table:t_common_dept
);

end;

run job t_common_dept_job(threads:8);


create job t_gg_sj_goods_job(t_gg_sj)
begin
dataset file t_gg_sj_goods_dataset
(
	schema:t_gg_sj_goods_schema,
	filename:"/home/zhaoshun/Data/jingshang_data/T_GG_SJ_GOODS.txt",
	serverid: 0,
	splitter:(block_size: 10000000)		  
);

dataproc index tt_1_index
(
	inputs: t_gg_sj_goods_dataset,
	table: t_1
);	

  dataproc doc t_1_doc   
(  
   inputs:t_gg_sj_goods_dataset,
   table:t_1,
   format:t_1_parser
);

end;

run job t_gg_sj_goods_job (threads:8);

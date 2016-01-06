create job t_common_dept_job(t_common)
begin
dataset file t_common_dept_dataset
(
	schema:t_common_dept_schema,
	filename: "/home/natt/Data/jinshang_Data_New/T_COMMON_DEPT.csv",
	serverid: 0,
	splitter: (block_size: 10000000)		  		  
);
dataproc syncher t_common_dept_syncher 
( 
inputs:t_common_dept_dataset, 
database:db, 
operator:add, 
table:t_common_dept
); 
end;
run job t_common_dept_job(threads:8);


create job t_gg_sj_goods_job(t_gg_sj)
begin
dataset file t_gg_sj_goods_dataset
(
	schema:t_gg_sj_goods_schema,
	filename:"/home/natt/Data/jinshang_Data_New/T_GG_SJ_GOODS.csv",
	serverid: 0,
	splitter:(block_size: 10000000)		  
);
dataproc syncher t_gg_sj_goods_syncher 
( 
inputs:t_gg_sj_goods_dataset, 
database:db, 
operator:add, 
table:t_gg_sj_goods
); 
end;
run job t_gg_sj_goods_job (threads:8);

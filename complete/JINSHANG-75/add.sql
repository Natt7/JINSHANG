create job t_common_dept_insert_q1(zykie)
begin
dataset file t_common_dept1_dataset
(
	schema:t_common_dept_schema,
	filename: "/home/natt/syncdata/oraclesyncdata/t_common_dept/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000000)		  		  
);
dataproc syncher t_common_dept_syncher 
( 
inputs:t_common_dept1_dataset, 
database:db, 
operator:add, 
table:t_common_dept
); 
end;
run job t_common_dept_insert_q1(threads:8);

create job t_gg_sj_goods_insert_q1(zykie)
begin
dataset file t_gg_sj_goods1_dataset
(
	schema:t_gg_sj_goods_schema,
	filename:"/home/natt/syncdata/oraclesyncdata/t_gg_sj_goods/insert/insert.csv",
	serverid: 0,
	splitter:(block_size: 10000000)		  
);
dataproc syncher t_gg_sj_goods_syncher 
( 
inputs:t_gg_sj_goods1_dataset, 
database:db, 
operator:add, 
table:t_gg_sj_goods
); 
end;
run job t_gg_sj_goods_insert_q1(threads:8);
create job t_common_dept_insert_q1(zykie)
begin
dataset file t_common_dept1_dataset
(
	schema:T_COMMON_DEPT_schema,
	filename: "/home/zhaoshun/syncdata/oraclesyncdata/t_common_dept/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000000)		  		  
);
dataproc syncher t_common_dept_syncher 
( 
inputs:t_common_dept1_dataset, 
database:db, 
operator:add, 
table:T_COMMON_DEPT
); 
end;
run job t_common_dept_insert_q1(threads:8);


create job t_bm_ui_configure_insert_q1(zykie)
begin
dataset file T_BM_UI_CONFIGURE1_dataset
(
	schema:T_BM_UI_CONFIGURE_schema,
	filename: "/home/zhaoshun/syncdata/oraclesyncdata/t_bm_ui_configure/insert/insert.csv",
	serverid: 0,
	splitter: (block_size: 10000000)		  		  
);
dataproc syncher t_common_dept_syncher 
( 
inputs:T_BM_UI_CONFIGURE1_dataset, 
database:db, 
operator:add, 
table:T_BM_UI_CONFIGURE
); 
end;
run job t_bm_ui_configure_insert_q1(threads:8);

create job t_gg_sj_goods_insert_q1(zykie)
begin
dataset file T_GG_SJ_GOODS1_dataset
(
	schema:T_GG_SJ_GOODS_schema,
	filename:"/home/zhaoshun/syncdata/oraclesyncdata/t_gg_sj_goods/insert/insert.csv",
	serverid:0,
	splitter:(block_size: 10000000)		  
);
dataproc select T_GG_SJ_GOODS1_select
(
	fields: 
	(
     (fname:"nvl (deptid,'NULL')",alias:"deptid",type:"str"),	  
     (fname:"iilmap('T_COMMON_DEPT_map')",alias:"vf_deptname",type:"str"),
     (fname:"nvl (gradenum, 'NULL')",alias:"gradenum",type:"str"),
	 (fname:"nvl (shopsignid, 'NULL')",alias:"shopsignid",type:"str"),
	 (fname:"nvl (shopsignname, 'NULL')",alias:"shopsignname",type:"str"),
     (fname:"nvl (prodareaid, 'NULL')",alias:"prodareaid",type:"str"),
     (fname:"nvl (prodareaname, 'NULL')",alias:"prodareaname",type:"str"),
	 (fname:"nvl (kindno, 'NULL')",alias:"kindno",type:"str"),
	 (fname:"nvl (kindname, 'NULL')",alias:"kindname",type:"str"),
	 (fname:"nvl (ownername, 'NULL')",alias:"ownername",type:"str"),
	 (fname:"nvl (goodsownerpackno, 'NULL')",alias:"goodsownerpackno",type:"str"),
	 (fname:"nvl (netweight, 0)",alias:"netweight",type:"str"),
	 (fname:"nvl (grossweight, 0)",alias:"grossweight",type:"str"),
	 (fname:"nvl (sheetnum,  0)",alias:"sheetnum",type:"str"),
	 (fname:"iilmap('T_BM_UI_CONFIGURE_map',1)",alias:"vf_count",type:"str")
	),
	 inputs: "T_GG_SJ_GOODS1_dataset"
);

dataproc select T_GG_SJ_GOODS12_select
(
	fields: 
	(
     (fname:"deptid",type:"str"), 
     (fname:"vf_deptname",type:"str"),
     (fname:"gradenum",type:"str"),
	 (fname:"shopsignid",type:"str"),
	 (fname:"shopsignname",type:"str"),
     (fname:"prodareaid",type:"str"),
     (fname:"prodareaname",type:"str"),
	 (fname:"kindno",type:"str"),
	 (fname:"kindname",type:"str"),
	 (fname:"ownername",type:"str"),
	 (fname:"goodsownerpackno",type:"str"),
	 (fname:"sum(netweight)",alias:"sumnetweight",type:"str"),
	 (fname:"sum(grossweight)",alias:"sumgrossweight",type:"str"),
	 (fname:"sum(sheetnum)",alias:"sumsheetnum",type:"str"),
	 (fname:"vf_count",type:"str"),
	 (fname:"case vf_count when '0' then '101%'  else '101' end",alias:"vf_countcase",type:"str") 
	),
	 inputs: "T_GG_SJ_GOODS1_select",
	 group_by:(deptid,vf_deptname,gradenum,shopsignid,shopsignname,prodareaid,prodareaname,kindno,kindname,ownername,goodsownerpackno,vf_count,vf_countcase)
);
dataproc syncher T_GG_SJ_GOODS1_syncher
(
    inputs: T_GG_SJ_GOODS12_select,
    database:db,
    operator:add, 
    table:T_GG_SJ_GOODS1
);
end;
run job t_gg_sj_goods_insert_q1(threads:8);
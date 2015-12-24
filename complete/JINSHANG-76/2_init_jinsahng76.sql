
create job T_COMMON_DEPT_job(2)
begin
dataset file T_COMMON_DEPT_dataset
(
	schema: "T_COMMON_DEPT_schema",
	filename: "/home/zhaoshun/Data/jinshang_add_del/T_COMMON_DEPT.csv",
	serverid: "0",
	splitter: (block_size: 10000000)		  		  
);
dataproc syncher T_COMMON_DEPT_syncher
(
    inputs: T_COMMON_DEPT_dataset,
    database:db,
    operator:add, 
    table:T_COMMON_DEPT
);
end;
run job T_COMMON_DEPT_job(threads:8);


create job T_BM_UI_CONFIGURE_job(2)
begin
dataset file T_BM_UI_CONFIGURE_dataset
(
	schema: "T_BM_UI_CONFIGURE_schema",
	filename: "/home/zhaoshun/Data/jinshang_add_del/T_BM_UI_CONFIGURE.csv",
	serverid: "0",
	splitter: (block_size: 10000000)			  		  
);
dataproc syncher T_BM_UI_CONFIGURE2_syncher
(
    inputs: T_BM_UI_CONFIGURE_dataset,
    database:db,
    operator:add, 
    table:T_BM_UI_CONFIGURE
);
end;
run job T_BM_UI_CONFIGURE_job(threads:8);


create job T_GG_SJ_GOODS_job(2)
begin
dataset file T_GG_SJ_GOODS_dataset
(
	schema:T_GG_SJ_GOODS_schema,
	filename:"/home/zhaoshun/Data/jinshang_add_del/T_GG_SJ_GOODS.csv",
	serverid:0,
	splitter:(block_size: 10000000)		  
);
dataproc select T_GG_SJ_GOODS_select
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
	 inputs: "T_GG_SJ_GOODS_dataset"
);

dataproc select T_GG_SJ_GOODS1_select
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
	 inputs: "T_GG_SJ_GOODS_select",
	 group_by:(deptid,vf_deptname,gradenum,shopsignid,shopsignname,prodareaid,prodareaname,kindno,kindname,ownername,goodsownerpackno,vf_count,vf_countcase)
);
dataproc syncher T_GG_SJ_GOODS1_syncher
(
    inputs: T_GG_SJ_GOODS1_select,
    database:db,
    operator:add, 
    table:T_GG_SJ_GOODS1
);
end;
run job T_GG_SJ_GOODS_job (threads:8);

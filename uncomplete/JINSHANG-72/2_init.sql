
create job T_COMMON_DEPT_job(2)
begin
dataset file T_COMMON_DEPT_dataset
(
	schema: "T_COMMON_DEPT_schema",
	filename: "/home/zhaoshun/Data/jinshang_New/T_COMMON_DEPT.txt",
	serverid: "0",
	splitter: (block_size: 10000000)		  		  
);

dataproc index T_COMMON_DEPT_index1
(
		inputs: T_COMMON_DEPT_dataset,
		table: T_COMMON_DEPT
);	
  dataproc doc T_COMMON_DEPT_doc
(  
   inputs:T_COMMON_DEPT_dataset,
   table:T_COMMON_DEPT
);

dataproc map T_COMMON_DEPT_map
(  
   inputs:T_COMMON_DEPT_dataset,
   table:T_COMMON_DEPT
);

end;
run job T_COMMON_DEPT_job(threads:8);

create job T_XTSZ_BIND_job(2)
begin
dataset file T_XTSZ_BIND_dataset
(
	schema: "T_XTSZ_BIND_schema",
	filename: "/home/zhaoshun/Data/jinshang_New/T_XTSZ_BIND.txt",
	serverid: "0",
	splitter: (block_size: 10000000)			  		  
);

dataproc index T_XTSZ_BIND_index
(
		inputs:T_XTSZ_BIND_dataset,
		table: T_XTSZ_BIND
);	
  dataproc doc T_BM_UI_CONFIGURE_doc
(  
   inputs:T_XTSZ_BIND_dataset,
   table:T_XTSZ_BIND
);

dataproc map T_XTSZ_BIND_map
(  
   inputs:T_XTSZ_BIND_dataset,
   table:T_XTSZ_BIND
);

end;
run job T_XTSZ_BIND_job(threads:8);

create job T_GG_SJ_GOODS_job(2)
begin
dataset file T_GG_SJ_GOODS_dataset
(
	schema:T_GG_SJ_GOODS_schema,
	filename:"/home/zhaoshun/Data/jinshang_New/T_GG_SJ_GOODS.txt",
	serverid:0,
	splitter:(block_size: 10000000)		  
);
dataproc select T_GG_SJ_GOODS_select
(
	fields: 
	(
     (fname:"nvl (DEPTID,'NULL')",alias:"DEPTID",type:"string"),
	 (fname:"nvl (OWNERNAME, 'NULL')",alias:"OWNERNAME",type:"string"),
	 (fname:"nvl (GOODSOWNERPACKNO, 'NULL')",alias:"GOODSOWNERPACKNO",type:"string"),
	 (fname:"GOODSSTATENO",type:"string"),
	 (fname:"nvl (KINDNO, 'NULL')",alias:"KINDNO",type:"string"),
	 (fname:"nvl (KINDNAME, 'NULL')",alias:"KINDNAME",type:"string"),
	 (fname:"nvl (SHOPSIGNID, 'NULL')",alias:"SHOPSIGNID",type:"string"),
	 (fname:"nvl (SHOPSIGNNAME, 'NULL')",alias:"SHOPSIGNNAME",type:"string"),
	 (fname:"nvl (PRODAREAID, 'NULL')",alias:"PRODAREAID",type:"string"),
	 (fname:"nvl (PRODAREANAME, 'NULL')",alias:"PRODAREANAME",type:"string"),
     (fname:"nvl (GRADENUM, 'NULL')",alias:"GRADENUM",type:"string"),
	 (fname:"nvl (GROSSWEIGHT, 0)",alias:"GROSSWEIGHT",type:"double"),
	 (fname:"nvl (NETWEIGHT, 0)",alias:"NETWEIGHT",type:"double"),
	 (fname:"nvl (SHEETNUM,  0)",alias:"SHEETNUM",type:"double"),
	 (fname:"FIRSTINDATE",type:"datetime"),
	 (fname:"iilmap('T_COMMON_DEPT_map',nvl (DEPTID,'NULL'))",alias:"DEPTNAME_1",type:"string"),
	 (fname:"iilmap('T_XTSZ_BIND_map_1',DEPTID)",alias:"vf_DEPTID",type:"string"),
	 (fname:"iilmap('T_XTSZ_BIND_map_2',OWNERID)",alias:"vf_OWNERID",type:"string")
	),
	 inputs: "T_GG_SJ_GOODS_dataset"
);

dataproc select T_GG_SJ_GOODS1_select
(
	fields: 
	(
     (fname:"DEPTID",type:"string"), 
     (fname:"DEPTNAME_1",type:"string"),
     (fname:"GRADENUM",type:"string"),
	 (fname:"SHOPSIGNID",type:"string"),
	 (fname:"SHOPSIGNNAME",type:"string"),
     (fname:"PRODAREAID",type:"string"),
	 (fname:"GOODSSTATENO",type:"string"),
     (fname:"PRODAREANAME",type:"string"),
	 (fname:"FIRSTINDATE",type:"datetime"),
	 (fname:"KINDNO",type:"string"),
	 (fname:"KINDNAME",type:"string"),
	 (fname:"OWNERNAME",type:"string"),
	 (fname:"GOODSOWNERPACKNO",type:"string"),
	 (fname:"sum(NETWEIGHT)",alias:"SUMNETWEIGHT",type:"double"),
	 (fname:"sum(GROSSWEIGHT)",alias:"SUMGROSSWEIGHT",type:"double"),
	 (fname:"sum(SHEETNUM)",alias:"SUMSHEETNUM",type:"double"),
	 (fname:"vf_DEPTID",type:"string"),
	 (fname:"vf_OWNERID",type:"string")
	),
	 inputs: "T_GG_SJ_GOODS_select",
	 conditions:"vf_DEPTID = '1'
	            AND vf_OWNERID = '1'
                AND GOODSSTATENO = '10'
				AND KINDNAME like '%热轧卷%'
				AND SHOPSIGNNAME like '%SS330%'
				AND GRADENUM like '%1037%'
				AND PRODAREANAME like '%宝钢%'
				AND GOODSOWNERPACKNO like '%15377%'
				AND FIRSTINDATE >= TO_DATE ('2012-07-16', '%Y-&m-%d')
				AND FIRSTINDATE < TO_DATE ('2016-07-16', '%Y-&m-%d') + 1",
	group_by:(DEPTID,GRADENUM,SHOPSIGNID,SHOPSIGNNAME,PRODAREAID,PRODAREANAME,KINDNO,KINDNAME,OWNERNAME,GOODSOWNERPACKNO)
);

 dataproc index T_GG_SJ_GOODS1_index
(
	inputs: T_GG_SJ_GOODS1_select,
	table: T_GG_SJ_GOODS1
);	

  dataproc doc T_GG_SJ_GOODS1_doc   
(  
   inputs:T_GG_SJ_GOODS1_select,
   table:T_GG_SJ_GOODS1,
   format:T_GG_SJ_GOODS1_parser,   
   fields:("DEPTID","DEPTNAME_1","GRADENUM","SHOPSIGNID","SHOPSIGNNAME","PRODAREAID","PRODAREANAME","KINDNO","KINDNAME","OWNERNAME","GOODSOWNERPACKNO","SUMNETWEIGHT","SUMGROSSWEIGHT","SUMSHEETNUM","vf_DEPTID","vf_OWNERID")
);

end;
run job T_GG_SJ_GOODS_job (threads:8);

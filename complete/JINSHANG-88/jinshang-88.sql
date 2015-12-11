SELECT sum(t.netweightsum),	COUNT (*)
FROM t_zy_gh_changeownerlist t
WHERE R_RECORD_CREATE_DATE>to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
  AND t.jyzxflag=1;


SELECT sum(weightsum)
FROM t_gu_gub
WHERE R_RECORD_CREATE_DATE>to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd');


SELECT sum(releaseweight)
FROM t_gu_gub
WHERE R_RECORD_CREATE_DATE>to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd');


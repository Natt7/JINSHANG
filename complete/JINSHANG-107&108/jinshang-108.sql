SELECT sumdate,
       sum(sumweight)
FROM t_chart_detailstorage
WHERE owner_num='PD'
  AND sumdate>=to_char(sysdate-365,'yyyymmdd')
  AND sumdate LIKE '______15'
  AND deptid NOT LIKE 'A%'
  AND deptid!='0301'
  AND deptid!='4501'
GROUP BY sumdate
ORDER BY sumdate;
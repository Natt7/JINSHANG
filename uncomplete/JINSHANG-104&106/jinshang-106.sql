SELECT kindname,
       round(avg(sysdate-firstindate),0) avgday
FROM t_gg_sj_goods t
WHERE goodsstateno=20
  AND EXISTS
    (SELECT 1
     FROM WL.T_OWNER W
     WHERE SEG_NO='00103'
       AND T.DEPTID=W.DEPTID
       AND t.ownerid=w.owner_id
       AND deptid NOT LIKE 'A%'
       AND deptid!='0301'
       AND deptid!='4501')
GROUP BY kindname;
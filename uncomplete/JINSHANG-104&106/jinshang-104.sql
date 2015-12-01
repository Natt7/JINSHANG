SELECT kindname,
       sum(netweight) netweight,
       round(avg(sysdate-firstindate),0) avgday
FROM t_gg_sj_goods t
WHERE deptid='0106'
  AND goodsstateno=20
  AND EXISTS
    (SELECT 1
     FROM WL.T_OWNER W
     WHERE SEG_NO='00103'
       AND T.DEPTID=W.DEPTID
       AND t.ownerid=w.owner_id)
GROUP BY kindname;

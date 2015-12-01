INSERT INTO SHOW.PDGM_KCAGE
SELECT deptid,
       sum(a),
       sum(b),
       sum(c),
       sum(d)
FROM
  ( SELECT deptid,
           sum(netweight) a,
           0 b,
             0 c,
               0 d
   FROM wmsdba.t_gg_sj_goods t
   WHERE goodsstateno=20
     AND firstindate>=sysdate-30
     AND exists
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.ownerid=w.owner_id
          AND deptid NOT LIKE 'A%'
          AND deptid!='0301'
          AND deptid!='4501')
   GROUP BY deptid
   UNION ALL SELECT deptid,
                    0 a,
                      sum(netweight) b,
                      0 c,
                        0 d
   FROM wmsdba.t_gg_sj_goods t
   WHERE goodsstateno=20
     AND firstindate>=sysdate-60
     AND firstindate<sysdate-30
     AND exists
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.ownerid=w.owner_id
          AND deptid NOT LIKE 'A%'
          AND deptid!='0301'
          AND deptid!='4501')
   GROUP BY deptid
   UNION ALL SELECT deptid,
                    0 a,
                      0 b,
                        sum(netweight) c,
                        0 d
   FROM wmsdba.t_gg_sj_goods t
   WHERE goodsstateno=20
     AND firstindate>=sysdate-180
     AND firstindate<sysdate-60
     AND exists
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.ownerid=w.owner_id
          AND deptid NOT LIKE 'A%'
          AND deptid!='0301'
          AND deptid!='4501')
   GROUP BY deptid
   UNION ALL SELECT deptid,
                    0 a,
                      0 b,
                        0 c,
                          sum(netweight) d
   FROM wmsdba.t_gg_sj_goods t
   WHERE goodsstateno=20
     AND firstindate<sysdate-180
     AND exists
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.ownerid=w.owner_id
          AND deptid NOT LIKE 'A%'
          AND deptid!='0301'
          AND deptid!='4501')
   GROUP BY deptid)
GROUP BY deptid;


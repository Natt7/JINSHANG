SELECT sum(netweight),
       sum(sheetnum),
       sum(kdwt),
       sum(zrrk),
       sum(jrrk),
       sum(zrck),
       sum(jrck),
       sum(byrk),
       sum(byck),
       sum(warn)
FROM
  ( SELECT sum(netweight) netweight,
           sum(sheetnum) sheetnum,
           0 kdwt,
             0 zrrk,
               0 jrrk,
                 0 zrck,
                   0 jrck,
                     0 byrk,
                       0 byck,
                         0 warn
   FROM wmsdba.t_gg_sj_goods t
   WHERE goodsstateno=20
     AND deptid='0106'
     AND exists
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.ownerid=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    sum(netweight),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0 warn
   FROM wmsdba.t_gg_sj_goods t
   WHERE goodsstateno=20
     AND deptid='0106'
     AND exists
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.ownerid=w.owner_id)
     AND exists
       (SELECT 1
        FROM wl.t_s_bill_d d
        WHERE t.packnum=d.pack_id
          AND d.seg_no='00103')
   UNION ALL SELECT 0,
                    0,
                    0,
                    sum(netweightsum),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
   FROM wmsdba.t_zy_rk_inbill t
   WHERE deptid='0106'
     AND r_record_create_date>=to_date(to_char(sysdate-1,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND r_record_create_date<to_date (to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND EXISTS
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.inbillownerno=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    0,
                    0,
                    sum(netweightsum),
                    0,
                    0,
                    0,
                    0,
                    0
   FROM wmsdba.t_zy_rk_inbill t
   WHERE deptid='0106'
     AND r_record_create_date>=to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND EXISTS
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.inbillownerno=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    0,
                    0,
                    0,
                    sum(netweightsum),
                    0,
                    0,
                    0,
                    0
   FROM wmsdba.t_zy_ck_outbill t
   WHERE deptid='0106'
     AND r_record_create_date>=to_date(to_char(sysdate-1,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND r_record_create_date<to_date (to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND EXISTS
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.OUTBILLOWNERNO=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    sum(netweightsum),
                    0,
                    0,
                    0
   FROM wmsdba.t_zy_ck_outbill t
   WHERE deptid='0106'
     AND r_record_create_date>=to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND EXISTS
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.OUTBILLOWNERNO=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    sum(netweightsum),
                    0,
                    0
   FROM wmsdba.t_zy_rk_inbill t
   WHERE deptid='0106'
     AND r_record_create_date>=to_date(to_char(sysdate,'yyyy-mm'),'yyyy-mm')
     AND EXISTS
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.inbillownerno=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    sum(netweightsum),
                    0
   FROM wmsdba.t_zy_ck_outbill t
   WHERE deptid='0106'
     AND r_record_create_date>=to_date(to_char(sysdate,'yyyy-mm'),'yyyy-mm')
     AND EXISTS
       (SELECT 1
        FROM WL.T_OWNER W
        WHERE SEG_NO='00103'
          AND T.DEPTID=W.DEPTID
          AND t.OUTBILLOWNERNO=w.owner_id)
   UNION ALL SELECT 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    storelimit
   FROM wmsdba.t_wl_store t
   WHERE DEPT_ID='0106');



SELECT rptdate,
       Sum(nt)        nt,
       Sum(injs)      injs,
       Sum(OUTWEIGHT) OUTWEIGHT,
       Sum(outjs)     outjs
FROM   (SELECT To_char(FIRSTINDATE, 'yyyy-mm-dd') AS RPTDATE,
               Sum(NETWEIGHT)                     AS NT,
               Count(*)                           AS injs,
               0                                  OUTWEIGHT,
               0                                  outjs
        FROM   T_ZY_RK_InBillDetail
        WHERE  ( GOODSSTATENO = '20' )
               AND ( DEPTID = '0301' )
               AND ( FirstInDate >= To_date('2015/7/1', 'yyyy-mm-dd') )
               AND ( FirstInDate < To_date('2015/9/1', 'yyyy-mm-dd') )
               AND OWNERID = 'KH00001'
               AND ( 1 = 2
                      OR MANAGENO LIKE 'M%' )
        GROUP  BY To_char(FIRSTINDATE, 'yyyy-mm-dd')
        UNION ALL
        SELECT To_char(b.CHANGEDATE, 'yyyy-mm-dd') AS rptdate,
               Sum(NETWEIGHT)                      AS nt,
               Count(*)                            AS injs,
               0                                   OUTWEIGHT,
               0                                   outjs
        FROM   T_ZY_GH_ChangeOwnerDetail a,
               T_ZY_GH_ChangeOwnerlist b
        WHERE  a.DEPTID = b.deptid
               AND a.CHANGEOWNERNO = b.CHANGEOWNERID
               AND a.DeptID = '0301'
               AND NEWOWNERNO = 'KH00001'
               AND ( 1 = 2
                      OR a.PREMANAGENUM LIKE 'M%' )
               AND changedate >= To_date('2015/7/1', 'yyyy-mm-dd')
               AND changedate < To_date('2015/9/1', 'yyyy-mm-dd')
        GROUP  BY To_char(b.CHANGEDATE, 'yyyy-mm-dd')
        UNION ALL
        SELECT To_char(b.OUTCUSTTIME, 'yyyy-mm-dd') AS rptdate,
               0                                    nt,
               0                                    injs,
               Sum(a.NETWEIGHT)                     AS OUTWEIGHT,
               COUNT                                AS outjs
        FROM   t_zy_ck_outPack a,
               t_zy_ck_outbill b
        WHERE  a.deptid = b.deptid
               AND a.OUTBILLNO = b.OUTBILLID
               AND a.DEPTID = '0301'
               AND a.OWNERNO = 'KH00001'
               AND ( 1 = 2
                      OR MANAGENUM LIKE 'M%' )
               AND a.GOODSSTATENO = '40'
               AND b.outcusttime >= To_date('2015/7/1', 'yyyy-mm-dd')
               AND b.outcusttime < To_date('2015/9/1', 'yyyy-mm-dd')
        GROUP  BY To_char(b.outcusttime, 'yyyy-mm-dd')
        UNION ALL
        SELECT To_char(b.changedate, 'yyyy-mm-dd') AS rptdate,
               0                                   nt,
               0                                   injs,
               Sum(netweight)                      AS OUTWEIGHT,
               Count(*)                            AS outjs
        FROM   T_ZY_GH_ChangeOwnerDetail a,
               T_ZY_GH_ChangeOwnerlist b
        WHERE  a.deptid = b.deptid
               AND a.changeownerno = b.changeownerid
               AND a.DeptID = '0301'
               AND preownerno = 'KH00001'
               AND ( 1 = 2
                      OR b.newmanagenum LIKE 'M%' )
               AND changedate >= To_date('2015/7/1', 'yyyy-mm-dd')
               AND changedate < To_date('2015/9/1', 'yyyy-mm-dd')
        GROUP  BY To_char(b.changedate, 'yyyy-mm-dd'))
GROUP BY rptdate;

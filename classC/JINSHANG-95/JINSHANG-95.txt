JINSHANG-95

SELECT rptdate,
       Sum(nt)        nt,
       Sum(injs)      injs,
       Sum(OUTWEIGHT) OUTWEIGHT,
       Sum(outjs)     outjs
FROM   (SELECT To_char(FirstInDate, 'yyyy-mm-dd') AS rptdate,
               Sum(netweight)                     AS nt,
               Count(*)                           AS injs,
               0                                  OUTWEIGHT,
               0                                  outjs
        FROM   T_ZY_RK_InBillDetail
        WHERE  ( goodsstateno = '20' )
               AND ( DeptID = '0301' )
               AND ( FirstInDate >= To_date('2015/7/1', 'yyyy-mm-dd') )
               AND ( FirstInDate < To_date('2015/9/1', 'yyyy-mm-dd') )
               AND ownerid = 'KH00001'
               AND ( 1 = 2
                      OR MANAGENO LIKE 'M%')
        GROUP  BY To_char(FirstInDate, 'yyyy-mm-dd')
        UNION ALL
        SELECT To_char(b.changedate, 'yyyy-mm-dd') AS rptdate,
               Sum(netweight)                      AS nt,
               Count(*)                            AS injs,
               0                                   OUTWEIGHT,
               0                                   outjs
        FROM   T_ZY_GH_ChangeOwnerDetail a,
               T_ZY_GH_ChangeOwnerlist b
        WHERE  a.deptid = b.deptid
               AND a.changeownerno = b.changeownerid
               AND a.DeptID = '0301'
               AND newownerno = 'KH00001'
               AND ( 1 = 2
                      OR a.premanagenum LIKE 'M%' )
               AND changedate >= To_date('2015/7/1', 'yyyy-mm-dd')
               AND changedate < To_date('2015/9/1', 'yyyy-mm-dd')
        GROUP  BY To_char(b.changedate, 'yyyy-mm-dd')
        UNION ALL
        SELECT To_char(bill_date, 'yyyy-mm-dd') AS rptdate,
               0                                nt,
               0                                injs,
               Sum(unit_weight)                 AS OUTWEIGHT,
               Count(*)                         AS outjs
        FROM   (SELECT a.bill_num,
                       a.bill_date,
                       pack_id     pack_num,
                       plan_weight unit_weight
                FROM   (SELECT *
                        FROM   T_GG_TX_DL_BIL_M
                        WHERE  ( DeptID = '0301' )
                               AND ( OWNER_NUM = 'GM0' )
                               AND ( BILL_DATE >= To_date('2015/7/1', 'yyyy-mm-dd') )
                               AND ( BILL_DATE < To_date('2015/9/1', 'yyyy-mm-dd') )
                               AND billstate >= '20'
                               AND ( 1 = 2
                                      OR resource_num LIKE 'M%' )) a
                       LEFT JOIN wl.t_s_bill_d b
                              ON a.seg_no = b.seg_no
                                 AND a.resource_num = b.factory_product_id
                                 AND a.BILL_NUM = b.BILL_ID) t3
        GROUP  BY To_char(bill_date, 'yyyy-mm-dd'))
GROUP  BY rptdate;


1.里层条件不能永远都写死，必须传到外层给我们JQL输入的where条件做过滤。

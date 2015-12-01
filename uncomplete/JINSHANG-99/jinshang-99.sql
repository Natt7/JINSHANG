
SELECT pp.STOCKFLAG,
       INWeight,
       OUTWeight,
       ChangeOwnerWeight,
       KCWeight,
       KCSheetnum,
       js
FROM
  (SELECT STOCKFLAG,
          SUM(INWeight) INWeight,
          SUM(OUTWeight) OUTWeight,
          SUM(KCWeight) KCWeight,
          SUM(KCSheetnum) KCSheetnum,
          SUM(js) js
   FROM
     (SELECT tb1.*,
             tb2.netweight INWeight,
             tb3.netweight OUTWeight,
             tb5.netweight KCWeight,
             tb5.sheetnum KCSheetnum,
             tb5.js js
      FROM
        (SELECT goodsid,
                substr(goodslocid,1,1) stockflag
         FROM t_gg_sj_goods
         WHERE deptid='0301') tb1
      LEFT JOIN
        (SELECT goodsid,
                netweight
         FROM t_zy_rk_inbilldetail
         WHERE deptid='0301'
           AND goodsstateno='20'
           AND firstindate<TO_DATE('2015/8/4','yyyy-mm-dd')
           AND firstindate>=to_date('2015/7/3','yyyy-mm-dd') )tb2 ON tb1.goodsid=tb2.goodsid
      LEFT JOIN
        (SELECT goodsid,
                netweight
         FROM t_zy_ck_outpack
         WHERE deptid='0301'
           AND OutCustTime<to_date('2015/8/4','yyyy-mm-dd')
           AND OutCustTime>=to_date('2015/7/3','yyyy-mm-dd') )tb3 ON tb1.goodsid=tb3.goodsid
      LEFT JOIN
        ( SELECT goodsid,
                 sum(netweight) AS netweight,
                 sum(js) js,
                 sum(sheetnum) sheetnum
         FROM
           (SELECT goodsid,
                   netweight,
                   sheetnum,
                   1 js
            FROM t_gg_sj_goods
            WHERE deptid='0301'
              AND goodsstateno='20'
              AND R_RECORD_IS_DELETED=0
            UNION ALL SELECT goodsid,-netweight,-sheetnum,
                                                 -1 js
            FROM t_zy_rk_inbilldetail
            WHERE deptid='0301'
              AND (intype='20'
                   OR intype IS NULL)
              AND firstindate>=to_date('2015/8/4','yyyy-mm-dd')
              AND goodsstateno='20'
            UNION ALL SELECT goodsid,-netweight,-sheetnum,
                                                 -1 js
            FROM T_GG_SJ_Goods
            WHERE deptid='0301'
              AND intype='60'
              AND firstindate>=to_date('2015/8/4','yyyy-mm-dd')
            UNION ALL SELECT goodsid,
                             netweight,
                             sheetnum,
                             1 js
            FROM t_zy_ck_outpack
            WHERE deptid='0301'
              AND goodsstateno IN ('40',
                                   '30')
              AND OutCustTime>=to_date('2015/8/4','yyyy-mm-dd')
            UNION ALL SELECT PROCMATERIALDTLID,
                             netweight,
                             sheetnum,
                             1 js
            FROM T_ZY_JG_ProcMaterialDtl
            WHERE deptid='0301'
              AND r_record_create_date>=to_date('2015/8/4','yyyy-mm-dd')) tbx
         GROUP BY goodsid) tb5 ON tb1.goodsid=tb5.goodsid ) ttt
   WHERE NOT (INWeight IS NULL
              AND OUTWeight IS NULL
              AND KCWeight = 0
              AND KCSheetnum = 0
              AND js = 0)
   GROUP BY STOCKFLAG) pp
LEFT JOIN
  ( SELECT substr(goodslocid,1,1)STOCKFLAG ,
           sum(netweight) ChangeOwnerWeight
   FROM t_zy_gh_changeownerdetail
   WHERE deptid='0301'
     AND r_record_create_date<TO_DATE('2015/8/4','yyyy-mm-dd')
     AND r_record_create_date>=to_date('2015/7/3','yyyy-mm-dd')
   GROUP BY substr(goodslocid,1,1)) GH ON pp.STOCKFLAG=GH.STOCKFLAG;


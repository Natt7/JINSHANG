SELECT *
FROM
  ( SELECT rownum AS rownum_,
           aa.*
   FROM
     ( SELECT /*+ index(g,T_GG_SJ_GOODS_INDX02) */ nvl (DEPTID, 'null') AS DEPTID,

        ( SELECT deptname
         FROM wmsdba.t_common_dept d
         WHERE d.deptid = g.deptid ) AS DEPTNAME,
                                                   nvl (GRADENUM, 'null') AS GRADENUM,
                                                   nvl (SHOPSIGNID, 'null') AS SHOPSIGNID,
                                                   nvl (SHOPSIGNNAME, 'null') AS SHOPSIGNNAME,
                                                   nvl (PRODAREAID, 'null') AS PRODAREAID,
                                                   nvl (PRODAREANAME, 'null') AS PRODAREANAME,
                                                   nvl (KINDNO, 'null') AS KINDNO,
                                                   nvl (KINDNAME, 'null') AS KINDNAME,
                                                   nvl (ownername, 'null') AS OWNERSHORT,
                                                   nvl (GOODSOWNERPACKNO, 'null') AS GOODSOWNERPACKNO,
                                                   nvl (SUM(NETWEIGHT), 0) AS NETWEIGHT,
                                                   nvl (SUM(GROSSWEIGHT), 0) AS GROSSWEIGHT,
                                                   nvl (SUM(SHEETNUM), 0) AS SHEETNUM
      FROM wmsdba.t_gg_sj_goods g
      WHERE 1 = 1
        AND ( DEPTID LIKE DECODE (
                                    ( SELECT COUNT(1)
                                     FROM wmsdba.t_bm_ui_configure c
                                     WHERE c.configure_no = 'COMM'
                                       AND DEPTID = '0301' ), 0, substr('0301', 0, 2) || '%','0301' ) )
        AND goodsstateno = '20'
        AND KINDNAME LIKE '%' || '²»Ðâ¸ÖÏß²Ä' || '%'
        AND SHOPSIGNNAME LIKE '%' || 'MR T-2.5BA' || '%'
        AND GRADENUM LIKE '%' || '11' || '%'
        AND PRODAREANAME LIKE '%' || 'ºª¸Ö' || '%'
      GROUP BY g.deptid,
               GRADENUM,
               SHOPSIGNID,
               SHOPSIGNNAME,
               PRODAREAID,
               PRODAREANAME,
               KINDNO,
               KINDNAME,
               ownername,
               GOODSOWNERPACKNO ) aa )
WHERE rownum_ > 0
  AND rownum_ <= 10
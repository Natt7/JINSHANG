SELECT *
FROM
  (SELECT rownum AS rownum_,
          aa.*
   FROM
     (SELECT /*+ index(g,T_GG_SJ_GOODS_INDX02) */ nvl(DEPTID, 'null') AS DEPTID,

        (SELECT deptname
         FROM wmsdba.t_common_dept d
         WHERE d.deptid = g.deptid) AS DEPTNAME,
                                                  nvl(GRADENUM, 'null') AS GRADENUM,
                                                  nvl(SHOPSIGNID, 'null') AS SHOPSIGNID,
                                                  nvl(SHOPSIGNNAME, 'null') AS SHOPSIGNNAME,
                                                  nvl(PRODAREAID, 'null') AS PRODAREAID,
                                                  nvl(PRODAREANAME, 'null') AS PRODAREANAME,
                                                  nvl(KINDNO, 'null') AS KINDNO,
                                                  nvl(KINDNAME, 'null') AS KINDNAME,
                                                  nvl(ownername, 'null') AS OWNERSHORT,
                                                  nvl(GOODSOWNERPACKNO, 'null') AS GOODSOWNERPACKNO,
                                                  nvl(SUM(NETWEIGHT), 0) AS NETWEIGHT,
                                                  nvl(SUM(GROSSWEIGHT), 0) AS GROSSWEIGHT,
                                                  nvl(SUM(SHEETNUM), 0) AS SHEETNUM
      FROM wmsdba.t_gg_sj_goods g,
           ST.T_XTSZ_BIND b
      WHERE 1 = 1
        AND g.deptid = b.dept_id
        AND g.ownerid = b.owner_id
        AND b.alive_flag = '1'
        AND b.seg_no = '080001'
        AND goodsstateno = '20'
        AND KINDNAME LIKE '%' ||'²»Ðâ¸Ö'|| '%'
        AND SHOPSIGNNAME LIKE '%'|| 'spcd'|| '%'
        AND GRADENUM LIKE '%' ||'11*11*11'|| '%'
        AND PRODAREANAME LIKE '%'||'°ÍÎ÷'|| '%'
        AND GOODSOWNERPACKNO LIKE '%' ||'123'|| '%'
        AND FIRSTINDATE >= to_date('2015-07-16', 'yyyy-MM-dd')
        AND FIRSTINDATE < to_date('2015-07-16', 'yyyy-MM-dd') + 1
      GROUP BY g.deptid,
               GRADENUM,
               SHOPSIGNID,
               SHOPSIGNNAME,
               PRODAREAID,
               PRODAREANAME,
               KINDNO,
               KINDNAME,
               ownername,
               GOODSOWNERPACKNO) aa)
WHERE rownum_ > 0
  AND rownum_ <= 10
SELECT *
FROM
  (SELECT rownum AS rownum_,
          aa.*
   FROM
     (SELECT nvl(a.manageno,'null') AS MANAGENO,
             nvl(a.kindname,'null') AS KINDNAME,
             nvl(a.shopsignname,'null') AS SHOPSIGNNAME,
             nvl(a.prodareaname,'null') AS PRODAREANAME,
             sum(decode(a.goodtype, '10', a.netweight, 0)) AS INSTOCK,
             sum(decode(a.goodtype, '20', a.netweight, 0)) AS OUTSTOCK,
             sum(decode(a.goodtype, '11', a.netweight, 0)) AS CHANGINSTOCK ,
             sum(decode(a.goodtype, '21', a.netweight, 0)) AS CHANGOUTSTOCK,
             sum(decode(a.goodtype, '12', a.netweight, 0)) AS PROCESSINSTOCK,
             sum(decode(a.goodtype, '22', a.netweight, 0)) AS PROCESSOUTSTOCK,
             sum(decode(a.goodtype, '30', a.netweight, 0)) AS ENDSTOCK,
             sum(decode(a.goodtype, '30', a.netweight, 0)) - sum(decode(a.goodtype, '10', a.netweight, 0)) + sum(decode(a.goodtype, '20', a.netweight, 0)) AS BEGINSTOCK
      FROM
        (SELECT t1.manageno,
                t1.kindname,
                t1.shopsignname,
                t1.gradenum,
                t1.prodareaname,
                t1.deptid,
                '10' goodtype,
                     t1.netweight
         FROM wmsdba.t_zy_rk_inbilldetail t1
         WHERE to_char(t1.firstindate, 'yyyy-mm-dd') >= ?
           AND to_char(t1.firstindate, 'yyyy-mm-dd') <= ?
           AND t1.deptid LIKE ?||'%'
         UNION ALL SELECT t2.managenum,
                          t2.kindname,
                          t2.shopsignname,
                          t2.gradenum,
                          t2.prodareaname,
                          t2.deptid,
                          '20',
                          t2.netweight
         FROM wmsdba.t_zy_ck_outpack t2,
              wmsdba.t_zy_ck_outbill t3
         WHERE t2.deptid = t3.deptid
           AND t2.outbillno = t3.outbillid
           AND to_char(t2.OutCustTime, 'yyyy-mm-dd') >= ?
           AND to_char(t2.OutCustTime, 'yyyy-mm-dd') <= ?
           AND t2.deptid LIKE ?||'%'
         UNION ALL SELECT t4.managenum,
                          t4.kindname,
                          t4.shopsignname,
                          t4.gradenum,
                          t4.prodareaname,
                          t4.deptid,
                          '11',
                          t4.netweight
         FROM wmsdba.t_zy_gh_changeownerdetail t4,
              wmsdba.t_zy_gh_changeownerlist t5
         WHERE t4.deptid = t5.deptid
           AND t4.changeownerno = t5.changeownerid
           AND to_char(t5.changedate, 'yyyy-mm-dd') >= ?
           AND to_char(t5.changedate, 'yyyy-mm-dd') <= ?
           AND t4.deptid LIKE ?||'%'
         UNION ALL SELECT t4.managenum,
                          t4.kindname,
                          t4.shopsignname,
                          t4.gradenum,
                          t4.prodareaname,
                          t4.deptid,
                          '21',
                          t4.netweight
         FROM wmsdba.t_zy_gh_changeownerdetail t4,
              wmsdba.t_zy_gh_changeownerlist t5
         WHERE t4.deptid = t5.deptid
           AND t4.changeownerno = t5.changeownerid
           AND to_char(t5.changedate, 'yyyy-mm-dd') >= ?
           AND to_char(t5.changedate, 'yyyy-mm-dd') <= ?
           AND t4.deptid LIKE ?||'%'
         UNION ALL SELECT t6.manageno,
                          t6.kindname,
                          t6.shopsignname,
                          t6.gradenum,
                          t6.prodareaname,
                          t6.deptid,
                          '12',
                          t6.netweight
         FROM wmsdba.t_zy_jg_procarticledtl t6
         WHERE t6.deptid LIKE ?||'%'
           AND to_char(t6.ACCEPTANCE_TIME, 'yyyy-mm-dd') >= ?
           AND to_char(t6.acceptance_time, 'yyyy-mm-dd') <= ?
           AND t6.deptid LIKE ?||'%'
         UNION ALL SELECT t7.manageno,
                          t7.kindname,
                          t7.shopsignname,
                          t7.gradenum,
                          t7.prodareaname,
                          t7.deptid,
                          '22',
                          t7.netweight
         FROM wmsdba.t_zy_jg_procmaterialdtl t7,
              wmsdba.t_zy_jg_process t8
         WHERE t7.deptid LIKE ?||'%'
           AND t7.deptid = t8.deptid
           AND t7.processid = t8.processid
           AND to_char(t8.outcarbilltime, 'yyyy-mm-dd') >= ?
           AND to_char(t8.outcarbilltime, 'yyyy-mm-dd') <= ?
           AND t7.deptid LIKE ?||'%'
         UNION ALL SELECT b.manageno,
                          b.kindname,
                          b.shopsignname,
                          b.gradenum,
                          b.prodareaname,
                          b.deptid,
                          '30',
                          b.netweight
         FROM
           (SELECT /*+ index(t,T_GG_SJ_GOODS_INDX02) */ t.manageno,
                                                        t.kindname,
                                                        t.shopsignname,
                                                        t.gradenum,
                                                        t.prodareaname,
                                                        t.deptid,
                                                        t.netweight
            FROM wmsdba.t_gg_sj_goods t
            WHERE 1=1
              AND t.goodsstateno = '20'
              AND t.deptid LIKE ?||'%'
            UNION ALL SELECT t1.manageno,
                             t1.kindname,
                             t1.shopsignname,
                             t1.gradenum,
                             t1.prodareaname,
                             t1.deptid,
                             0 - t1.netweight
            FROM wmsdba.t_zy_rk_inbilldetail t1
            WHERE to_char(t1.firstindate, 'yyyy-mm-dd') > ?
              AND t1.deptid LIKE ?||'%'
            UNION ALL SELECT t4.managenum,
                             t4.kindname,
                             t4.shopsignname,
                             t4.gradenum,
                             t4.prodareaname,
                             t4.deptid,
                             0 - t4.netweight
            FROM wmsdba.t_zy_gh_changeownerdetail t4,
                 wmsdba.t_zy_gh_changeownerlist t5
            WHERE t4.deptid = t5.deptid
              AND t4.changeownerno = t5.changeownerid
              AND to_char(t5.changedate, 'yyyy-mm-dd') > ?
              AND t4.deptid LIKE ?||'%'
            UNION ALL SELECT t6.manageno,
                             t6.kindname,
                             t6.shopsignname,
                             t6.gradenum,
                             t6.prodareaname,
                             t6.deptid,
                             0 - t6.netweight
            FROM wmsdba.t_zy_jg_procarticledtl t6
            WHERE t6.deptid LIKE ?||'%'
              AND to_char(t6.ACCEPTANCE_TIME, 'yyyy-mm-dd') > ?
              AND t6.deptid LIKE ?||'%'
            UNION ALL SELECT t2.managenum,
                             t2.kindname,
                             t2.shopsignname,
                             t2.gradenum,
                             t2.prodareaname,
                             t2.deptid,
                             t2.netweight
            FROM wmsdba.t_zy_ck_outpack t2,
                 wmsdba.t_zy_ck_outbill t3
            WHERE t2.deptid = t3.deptid
              AND t2.outbillno = t3.outbillid
              AND to_char(t3.outbilltime, 'yyyy-mm-dd') > ?
              AND t2.deptid LIKE ?||'%'
            UNION ALL SELECT t4.managenum,
                             t4.kindname,
                             t4.shopsignname,
                             t4.gradenum,
                             t4.prodareaname,
                             t4.deptid,
                             t4.netweight
            FROM wmsdba.t_zy_gh_changeownerdetail t4,
                 wmsdba.t_zy_gh_changeownerlist t5
            WHERE t4.deptid = t5.deptid
              AND t4.changeownerno = t5.changeownerid
              AND to_char(t5.changedate, 'yyyy-mm-dd') > ?
              AND t4.deptid LIKE ?||'%'
            UNION ALL SELECT t7.manageno,
                             t7.kindname,
                             t7.shopsignname,
                             t7.gradenum,
                             t7.prodareaname,
                             t7.deptid,
                             t7.netweight
            FROM wmsdba.t_zy_jg_procmaterialdtl t7,
                 wmsdba.t_zy_jg_process t8
            WHERE t7.deptid LIKE ?||'%'
              AND t7.deptid = t8.deptid
              AND t7.processid = t8.processid
              AND to_char(t8.outcarbilltime, 'yyyy-mm-dd') > ?
              AND t7.deptid LIKE ?||'%') b) a
      GROUP BY a.manageno,
               a.kindname,
               a.shopsignname,
               a.prodareaname)aa)
WHERE rownum_ > ?
  AND rownum_ <= ?
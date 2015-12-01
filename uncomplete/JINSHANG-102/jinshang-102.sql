
SELECT *
FROM
  (SELECT ownerid,
          ownername,
          manageno,
          goodsownermanageno,
          packnum,
          gradenum,
          goodslocid,
          kindname,
          shopsignname,
          prodareaname,
          firstindate,
          sum(gradenumxh) gradenumxh,
          sum(singlesheetnum) singlesheetnum,
          sum(netweight) netweight,
          sum(grossweight) grossweight,
          sum(sheetnum) sheetnum
   FROM
     ( SELECT ownerid,
              ownername,
              manageno,
              goodsownermanageno,
              packnum,
              gradenum,
              goodslocid,
              kindname,
              shopsignname,
              prodareaname,
              firstindate,
              sum(gradenumxh) gradenumxh,
              sum(singlesheetnum) singlesheetnum,
              sum(netweight) netweight,
              sum(grossweight) grossweight,
              sum(sheetnum) sheetnum
      FROM T_GG_SJ_Goods
      WHERE goodsstateno='20'
        AND r_record_is_deleted=0
        AND deptid='0301'
      GROUP BY ownerid,
               ownername,
               manageno,
               goodsownermanageno,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,ownername,manageno,goodsownermanageno,packnum,gradenum,goodslocid,kindname,shopsignname, prodareaname,firstindate,sum(gradenumxh) gradenumxh,sum(singlesheetnum) singlesheetnum, -sum(netweight) netweight,-sum(grossweight) grossweight,-sum(sheetnum) sheetnum
      FROM T_ZY_RK_InBillDetail
      WHERE deptid='0301'
        AND goodsstateno='20'
        AND firstindate>=to_date('2015/7/2','yyyy-mm-dd')
      GROUP BY ownerid,
               ownername,
               manageno,
               goodsownermanageno,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,
                       ownername,
                       manageno,
                       goodsownermanageno,
                       packnum,
                       gradenum,
                       goodslocid,
                       kindname,
                       shopsignname,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum, -sum(netweight) netweight,-sum(grossweight) grossweight,-sum(sheetnum) sheetnum
      FROM T_ZY_JG_ProcArticleDtl
      WHERE deptid='0301'
        AND firstindate>=to_date('2015/7/2','yyyy-mm-dd')
        AND goodsstateno='130'
      GROUP BY ownerid,
               ownername,
               manageno,
               goodsownermanageno,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT newownerno aownerid,
                       newownername ownername,
                       managenum manageno,
                       goodsownermanageno,
                       packnum,
                       gradenum,
                       goodslocid,
                       kindname,
                       shopsignname,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum, -sum(netweight) netweight,-sum(grossweight) grossweight,-sum(sheetnum) sheetnum
      FROM
        (SELECT a.newownerno,a.newownername,(CASE WHEN (managenum IS NULL
                                                        OR managenum = '') THEN premanagenum ELSE managenum END) managenum,
                                                                                                                 b.shopsignid,
                                                                                                                 b.shopsignname,
                                                                                                                 b.prodareaid,
                                                                                                                 b.prodareaname,
                                                                                                                 b.gradenum,
                                                                                                                 b.netweight,
                                                                                                                 b.grossweight,
                                                                                                                 b.sheetnum,
                                                                                                                 b.firstindate,
                                                                                                                 b.kindname,
                                                                                                                 b.goodslocid,
                                                                                                                 b.packnum,
                                                                                                                 b.goodsownermanagenum goodsownermanageno
         FROM
           (SELECT deptid,
                   ChangeOwnerID,
                   newownerno,
                   newownername
            FROM T_ZY_GH_ChangeOwnerList
            WHERE DeptID='0301'
              AND changedate>=to_date('2015/7/2','yyyy-mm-dd')) a ,
                                                                T_ZY_GH_ChangeOwnerDetail b
         WHERE a.changeownerid=b.changeownerno
           AND a.deptid=b.deptid ) tb1
      GROUP BY newownerno,
               newownername,
               managenum,
               goodsownermanageno,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerno,
                       ownername,
                       managenum manageno,
                       GOODSOWNERMANAGENUM goodsownermanageno,
                       packnum,
                       gradenum,
                       goodslocid,
                       kindname,
                       shopsignname,
                       prodareaname,
                       firstindate,
                       sum(gradenumxh) gradenumxh,
                       sum(singlesheetnum) singlesheetnum,
                       sum(netweight) netweight,
                       sum(grossweight) grossweight,
                       sum(sheetnum) sheetnum
      FROM T_ZY_CK_OutPack
      WHERE deptid='0301'
        AND OutCustTime>=to_date('2015/7/2','yyyy-mm-dd')
      GROUP BY ownerno,
               ownername,
               managenum,
               GOODSOWNERMANAGENUM,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,
                       ownername,
                       manageno,
                       goodsownermanageno,
                       a.packnum,
                       gradenum,
                       goodslocid,
                       kindname,
                       shopsignname,
                       prodareaname,
                       firstindate,
                       sum(gradenumxh) gradenumxh,
                       sum(singlesheetnum) singlesheetnum,
                       sum(netweight) netweight,
                       sum(grossweight) grossweight,
                       sum(sheetnum) sheetnum
      FROM T_GG_SJ_Goods a,
           T_ZY_CK_CLEAR b
      WHERE a.goodsid=b.goodsid
        AND a.deptid='0301'
        AND CREATDATE>=to_date('2015/7/2','yyyy-mm-dd')
      GROUP BY ownerid,
               ownername,
               manageno,
               goodsownermanageno,
               a.packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,
                       ownername,
                       manageno,
                       goodsownermanageno,
                       packnum,
                       gradenum,
                       goodslocid,
                       kindname,
                       shopsignname,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum,
                           sum(netweight) netweight,
                           sum(grossweight) grossweight,
                           sum(sheetnum) sheetnum
      FROM T_ZY_JG_ProcMaterialDtl
      WHERE deptid='0301'
        AND EXISTS
          (SELECT 1
           FROM T_ZY_JG_PROCESS
           WHERE ProcessID=T_ZY_JG_ProcMaterialDtl.ProcessID
             AND deptid=T_ZY_JG_ProcMaterialDtl.deptid
             AND OutCarBillTime>=to_date('2015/7/2','yyyy-mm-dd'))
      GROUP BY ownerid,
               ownername,
               manageno,
               goodsownermanageno,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate
      UNION ALL SELECT preownerno ownerid,
                       proownername ownername,
                       premanagenum manageno,
                       goodsownermanageno,
                       packnum,
                       gradenum,
                       goodslocid,
                       kindname,
                       shopsignname,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum,
                           sum(netweight) netweight,
                           sum(grossweight) grossweight,
                           sum(sheetnum) sheetnum
      FROM
        (SELECT a.preownerno,
                a.proownername,
                b.premanagenum,
                b.netweight,
                b.grossweight,
                b.sheetnum,
                b.shopsignid,
                b.shopsignname,
                b.prodareaid,
                b.prodareaname,
                b.gradenum,
                b.firstindate,
                b.kindname,
                b.goodslocid,
                b.packnum,
                b.PREGOODSOWNERMANAGENUM goodsownermanageno
         FROM
           (SELECT deptid,
                   ChangeOwnerID,
                   preownerno,
                   proownername
            FROM T_ZY_GH_ChangeOwnerList
            WHERE DeptID='0301'
              AND changedate>=to_date('2015/7/2','yyyy-mm-dd')) a ,
                                                                T_ZY_GH_ChangeOwnerDetail b
         WHERE a.changeownerid=b.changeownerno
           AND a.deptid=b.deptid) tb1
      GROUP BY preownerno,
               proownername,
               premanagenum,
               goodsownermanageno,
               packnum,
               gradenum,
               goodslocid,
               kindname,
               shopsignname,
               prodareaname,
               firstindate ) tbx
   WHERE ownerid = 'KH00001'
     AND netweight <> 0
   GROUP BY ownerid,
            ownername,
            manageno,
            goodsownermanageno,
            packnum,
            gradenum,
            goodslocid,
            kindname,
            shopsignname,
            prodareaname,
            firstindate)
WHERE netweight <> 0
  AND MANAGENO IS NOT NULL;


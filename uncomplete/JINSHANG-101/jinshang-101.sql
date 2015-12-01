
SELECT *
FROM
  (SELECT ownerid,
          '' ownername,
             manageno,
             packnum,
             max(gradenum) gradenum,
             max(goodslocid) goodslocid,
             kindname,
             shopsignname,
             GOODSOWNERPACKNO,
             prodareaname,
             firstindate,
             sum(gradenumxh) gradenumxh,
             sum(singlesheetnum) singlesheetnum,
             max(SideMark) SideMark,
             max(ShipName) ShipName,
             sum(netweight) netweight,
             sum(grossweight) grossweight,
             sum(sheetnum) sheetnum
   FROM
     ( SELECT ownerid,
              manageno,
              packnum,
              max(gradenum) gradenum,
              max(goodslocid) goodslocid,
              kindname,
              shopsignname,
              GOODSOWNERPACKNO,
              prodareaname,
              firstindate,
              sum(gradenumxh) gradenumxh,
              sum(singlesheetnum) singlesheetnum,
              max(SideMark) SideMark,
              max(ShipName) ShipName,
              sum(netweight) netweight,
              sum(grossweight) grossweight,
              sum(sheetnum) sheetnum
      FROM T_GG_SJ_Goods
      WHERE goodsstateno='20'
        AND r_record_is_deleted=0
        AND deptid='0301'
      GROUP BY ownerid,
               manageno,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNO,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,manageno,packnum,max(gradenum) gradenum,max(goodslocid) goodslocid,kindname,shopsignname,GOODSOWNERPACKNO, prodareaname,firstindate,sum(gradenumxh) gradenumxh,sum(singlesheetnum) singlesheetnum,max(SideMark) SideMark,max(ShipName) ShipName, -sum(netweight) netweight,-sum(grossweight) grossweight,-sum(sheetnum) sheetnum
      FROM T_ZY_RK_InBillDetail
      WHERE deptid='0301'
        AND goodsstateno='20'
        AND firstindate>=to_date('2015/7/2','yyyy-mm-dd')
      GROUP BY ownerid,
               manageno,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNO,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,
                       manageno,
                       packnum,
                       max(gradenum) gradenum,
                       max(goodslocid) goodslocid,
                       kindname,
                       shopsignname,
                       GOODSOWNERPACKNO,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum,NULL,NULL, -sum(netweight) netweight,-sum(grossweight) grossweight,-sum(sheetnum) sheetnum
      FROM T_ZY_JG_ProcArticleDtl
      WHERE deptid='0301'
        AND firstindate>=to_date('2015/7/2','yyyy-mm-dd')
        AND goodsstateno='130'
      GROUP BY ownerid,
               manageno,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNO,
               prodareaname,
               firstindate
      UNION ALL SELECT newownerno aownerid,
                       managenum manageno,
                       packnum,
                       max(gradenum) gradenum,
                       max(goodslocid) goodslocid ,
                       kindname,
                       shopsignname,
                       GOODSOWNERPACKNUM,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum,NULL,NULL, -sum(netweight) netweight,-sum(grossweight) grossweight,-sum(sheetnum) sheetnum
      FROM
        (SELECT a.newownerno,a.newownername,(CASE WHEN (managenum IS NULL
                                                        OR managenum = '') THEN premanagenum ELSE managenum END) managenum,
                                                                                                                 b.shopsignid,
                                                                                                                 b.shopsignname,
                                                                                                                 GOODSOWNERPACKNUM,
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
               managenum,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNUM,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerno,
                       managenum manageno,
                       packnum,
                       max(gradenum) gradenum,
                       max(goodslocid) goodslocid,
                       kindname,
                       shopsignname,
                       GOODSOWNERPACKNUM,
                       prodareaname,
                       firstindate,
                       sum(gradenumxh) gradenumxh,
                       sum(singlesheetnum) singlesheetnum,
                       max(SideMark) SideMark,
                       max(ShipName) ShipName,
                       sum(netweight) netweight,
                       sum(grossweight) grossweight,
                       sum(sheetnum) sheetnum
      FROM T_ZY_CK_OutPack
      WHERE deptid='0301'
        AND OutCustTime>=to_date('2015/7/2','yyyy-mm-dd')
      GROUP BY ownerno,
               managenum,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNUM,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,
                       manageno,
                       a.packnum,
                       max(gradenum) gradenum,
                       max(goodslocid) goodslocid,
                       kindname,
                       shopsignname,
                       GOODSOWNERPACKNO,
                       prodareaname,
                       firstindate,
                       sum(gradenumxh) gradenumxh,
                       sum(singlesheetnum) singlesheetnum,
                       max(SideMark) SideMark,
                       max(ShipName) ShipName,
                       sum(netweight) netweight,
                       sum(grossweight) grossweight,
                       sum(sheetnum) sheetnum
      FROM T_GG_SJ_Goods a,
           T_ZY_CK_CLEAR b
      WHERE a.goodsid=b.goodsid
        AND a.deptid='0301'
        AND CREATDATE>=to_date('2015/7/2','yyyy-mm-dd')
      GROUP BY ownerid,
               manageno,
               a.packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNO,
               prodareaname,
               firstindate
      UNION ALL SELECT ownerid,
                       manageno,
                       packnum,
                       max(gradenum) gradenum,
                       max(goodslocid) goodslocid,
                       kindname,
                       shopsignname,
                       GOODSOWNERPACKNO,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum,
                           NULL,
                           NULL,
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
               manageno,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNO,
               prodareaname,
               firstindate
      UNION ALL SELECT preownerno ownerid,
                       premanagenum manageno,
                       packnum,
                       max(gradenum) gradenum,
                       max(goodslocid) goodslocid,
                       kindname,
                       shopsignname,
                       GOODSOWNERPACKNUM,
                       prodareaname,
                       firstindate,
                       0 gradenumxh,
                         0 singlesheetnum,
                           NULL,
                           NULL,
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
                GOODSOWNERPACKNUM,
                b.gradenum,
                b.firstindate,
                b.kindname,
                b.goodslocid,
                b.packnum
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
               premanagenum,
               packnum,
               kindname,
               shopsignname,
               GOODSOWNERPACKNUM,
               prodareaname,
               firstindate ) tbx
   WHERE ownerid = 'KH00001'
     AND netweight <> 0
   GROUP BY ownerid,
            manageno,
            packnum,
            kindname,
            shopsignname,
            GOODSOWNERPACKNO,
            prodareaname,
            firstindate)
WHERE netweight <> 0;


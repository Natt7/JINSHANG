SELECT *
FROM
  (SELECT gg.ownerid,
          '' ownername,
             gg.gradenumxh,
             gg.singlesheetnum,
             gg.SideMark,
             gg.ShipName,
             gg.netweight,
             gg.grossweight,
             gg.sheetnum,
             gl.PACKNUM,
             gl.MANAGENO,
             gl.GRADENUM,
             gl.GOODSLOCID,
             gl.KINDNAME,
             gl.SHOPSIGNNAME,
             gl.PRODAREANAME,
             gl.FIRSTINDATE
   FROM
     ( SELECT pregoodsid,
              tbx.ownerid,
              sum(tbx.gradenumxh) gradenumxh,
              sum(tbx.singlesheetnum) singlesheetnum,
              max(SideMark) SideMark,
              max(ShipName) ShipName ,
              sum(tbx.netweight) netweight,
              sum(tbx.grossweight) grossweight,
              sum(tbx.sheetnum) sheetnum
      FROM
        ( SELECT GOODSID,
                 OWNERID,
                 OWNERNAME,
                 gradenumxh,
                 singlesheetnum,
                 netweight,
                 grossweight,
                 sheetnum
         FROM T_GG_SJ_Goods
         WHERE goodsstateno='20'
           AND r_record_is_deleted=0
           AND deptid='0301'
         UNION ALL SELECT GOODSID,OWNERID,OWNERNAME,-gradenumxh,-singlesheetnum,-netweight,-grossweight,-sheetnum
         FROM T_ZY_RK_InBillDetail
         WHERE deptid='0301'
           AND goodsstateno='20'
           AND firstindate>=to_date('2015/7/2','yyyy-mm-dd')
         UNION ALL SELECT PROCARTICLEDTLID,
                          OWNERID,
                          OWNERNAME,
                          0 gradenumxh,
                            0 singlesheetnum,-netweight,-grossweight,-sheetnum
         FROM T_ZY_JG_ProcArticleDtl
         WHERE deptid='0301'
           AND firstindate>=to_date('2015/7/2','yyyy-mm-dd')
           AND goodsstateno='130'
         UNION ALL SELECT GOODSID,
                          newownerno OWNERID,
                          newownername OWNERNAME,
                          0 gradenumxh,
                            0 singlesheetnum,-netweight,-grossweight,-sheetnum
         FROM
           (SELECT b.goodsid,
                   a.newownerno,
                   a.newownername,
                   b.netweight,
                   b.grossweight,
                   b.sheetnum
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
              AND a.deptid=b.deptid) tb1
         UNION ALL SELECT GOODSID,
                          OWNERNO,
                          OWNERNAME,
                          gradenumxh,
                          singlesheetnum,
                          netweight,
                          grossweight,
                          sheetnum
         FROM T_ZY_CK_OutPack
         WHERE deptid='0301'
           AND OutCustTime>=to_date('2015/7/2','yyyy-mm-dd')
         UNION ALL SELECT a.GOODSID,
                          OWNERID,
                          OWNERNAME,
                          gradenumxh,
                          singlesheetnum,
                          netweight,
                          grossweight,
                          sheetnum
         FROM T_GG_SJ_Goods a,
              T_ZY_CK_CLEAR b
         WHERE a.goodsid=b.goodsid
           AND a.deptid='0301'
           AND CREATDATE>=to_date('2015/7/2','yyyy-mm-dd')
         UNION ALL SELECT GOODSID,
                          OWNERID,
                          OWNERNAME,
                          0 gradenumxh,
                            0 singlesheetnum,
                              netweight,
                              grossweight,
                              sheetnum
         FROM T_ZY_JG_ProcMaterialDtl
         WHERE deptid='0301'
           AND EXISTS
             (SELECT 1
              FROM T_ZY_JG_PROCESS
              WHERE ProcessID=T_ZY_JG_ProcMaterialDtl.ProcessID
                AND deptid=T_ZY_JG_ProcMaterialDtl.deptid
                AND OutCarBillTime>=to_date('2015/7/2','yyyy-mm-dd'))
         UNION ALL SELECT GOODSID,
                          preownerno OWNERID,
                          proownername OWNERNAME,
                          0 gradenumxh,
                            0 singlesheetnum,
                              netweight,
                              grossweight,
                              sheetnum
         FROM
           (SELECT b.goodsid,
                   a.preownerno,
                   a.proownername,
                   b.netweight,
                   b.grossweight,
                   b.sheetnum
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
              AND a.deptid=b.deptid) tb1)tbx
      LEFT JOIN
        (SELECT *
         FROM t_gg_sj_goods
         WHERE deptid='0301'
           AND r_record_is_deleted=0) pre ON tbx.goodsid=pre.goodsid
      GROUP BY pregoodsid,
               tbx.ownerid )gg
   LEFT JOIN
     (SELECT *
      FROM t_gg_sj_goods
      WHERE deptid='0301'
        AND r_record_is_deleted=0) gl ON gg.pregoodsid=gl.goodsid
   WHERE gg.ownerid = 'KH00001'
     AND gg.netweight <> 0)
WHERE netweight <> 0
  AND MANAGENO IS NOT NULL;


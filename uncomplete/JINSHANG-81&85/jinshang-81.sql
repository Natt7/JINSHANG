SELECT T_ZY_CK_OutPack.StockType,
       T_ZY_CK_OutBill.OutBillOwnerName OwnerName,
       T_ZY_CK_OutPack.ManageNum,
       T_ZY_CK_OutPack.OutBillNo BillNo,
       SUM(T_ZY_CK_OutPack.NetWeight) NetWeightSum,
       SUM(T_ZY_CK_OutPack.GrossWeight) GrossWeightSum,
       SUM(T_ZY_CK_OutPack.SheetNum) SheetNumSum,
       T_ZY_CK_OutPack.ShopSignName,
       T_ZY_CK_OutPack.GradeNum,
       T_ZY_CK_OutBill.ForeignListNo,
       to_char(T_ZY_CK_OutBill.Outcusttime, 'yyyy-mm-dd') OutBillTime,
       T_ZY_CK_OutPack.CreaterName
FROM T_ZY_CK_OutBill
JOIN T_ZY_CK_OutPack ON T_ZY_CK_OutBill.OutBillID = T_ZY_CK_OutPack.OutBillNo
AND T_ZY_CK_OutBill.DeptID = T_ZY_CK_OutPack.DeptID
WHERE T_ZY_CK_OutPack.GoodsStateNo = '40'
  AND T_ZY_CK_OutBill.DeptID = '0301'
  AND T_ZY_CK_OutBill.ForeignListNo LIKE 'TDGM%'
  AND T_ZY_CK_OutPack.ManageNum LIKE 'M%'
  AND T_ZY_CK_OutBill.OutBillOwnerNo = 'KH00001'
  AND T_ZY_CK_OutBill.Outcusttime >=to_date('2015/7/1','yyyy-mm-dd')
  AND T_ZY_CK_OutBill.Outcusttime <to_date('2015/8/1','yyyy-mm-dd')
GROUP BY T_ZY_CK_OutPack.StockType,
         T_ZY_CK_OutBill.OutBillOwnerName,
         T_ZY_CK_OutPack.ManageNum,
         T_ZY_CK_OutPack.OutBillNo,
         T_ZY_CK_OutBill.ForeignListNo,
         T_ZY_CK_OutBill.Outcusttime,
         T_ZY_CK_OutPack.CreaterName,
         T_ZY_CK_OutPack.ShopSignName,
         T_ZY_CK_OutPack.GradeNum
UNION ALL
SELECT NULL StockType,
            t_zy_gh_changeownerlist.proownername OwnerName,
            t_zy_gh_changeownerdetail.ManageNum,
            t_zy_gh_changeownerdetail.changeownerno BillNo,
            SUM(t_zy_gh_changeownerdetail.NetWeight) NetWeightSum,
            SUM(t_zy_gh_changeownerdetail.GrossWeight) GrossWeightSum,
            SUM(t_zy_gh_changeownerdetail.SheetNum) SheetNumSum,
            t_zy_gh_changeownerdetail.ShopSignName,
            t_zy_gh_changeownerdetail.GradeNum,
            t_zy_gh_changeownerlist.ForeignListNo,
            to_char(t_zy_gh_changeownerdetail.incusttime, 'yyyy-mm-dd') OutBillTime,
            t_zy_gh_changeownerdetail.r_record_create_user CreaterName
FROM t_zy_gh_changeownerlist
JOIN t_zy_gh_changeownerdetail ON t_zy_gh_changeownerlist.changeownerid = t_zy_gh_changeownerdetail.changeownerno
AND t_zy_gh_changeownerlist.DeptID = t_zy_gh_changeownerdetail.DeptID
WHERE t_zy_gh_changeownerlist.DeptID = '0301'
  AND t_zy_gh_changeownerlist.ForeignListNo LIKE 'TDGM%'
  AND t_zy_gh_changeownerdetail.ManageNum LIKE 'M%'
  AND t_zy_gh_changeownerlist.preownerno = 'KH00001'
  AND t_zy_gh_changeownerdetail.incusttime >=to_date('2015/7/1','yyyy-mm-dd')
  AND t_zy_gh_changeownerdetail.incusttime <to_date('2015/8/1','yyyy-mm-dd')
GROUP BY t_zy_gh_changeownerlist.proownername,
         t_zy_gh_changeownerdetail.ManageNum,
         t_zy_gh_changeownerdetail.changeownerno,
         t_zy_gh_changeownerdetail.ShopSignName,
         t_zy_gh_changeownerdetail.GradeNum,
         t_zy_gh_changeownerlist.ForeignListNo,
         t_zy_gh_changeownerdetail.incusttime,
         t_zy_gh_changeownerdetail.r_record_create_user;


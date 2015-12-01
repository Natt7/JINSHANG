SELECT *
FROM
  (SELECT rownum AS rownum_,
          aa.*
   FROM
     (SELECT /*+ index(g,T_GG_SJ_GOODS_INDX02) */ nvl(GOODSID, 'null') AS GOODSID,
                                                  nvl(DEPTID, 'null') AS DEPTID,

        (SELECT deptname
         FROM wmsdba.t_common_dept d
         WHERE d.deptid = g.deptid) AS DEPTNAME,
                                                  nvl(BARCODE, 'null') AS BARCODE,
                                                  nvl(GOODSLOCID, 'null') AS GOODSLOCID,
                                                  nvl(decode(STOCKTYPE, '004001', '室内库', '004002', '室外库', NULL, '室内库'), 'null') AS STOCKTYPE,
                                                  nvl(OWNERID, 'null') AS OWNERID,
                                                  nvl(OWNERNAME, 'null') AS OWNERNAME,
                                                  nvl(GOODSOWNERMANAGENO, 'null') AS GOODSOWNERMANAGENO,
                                                  nvl(INBILLID, 'null') AS INBILLID,
                                                  nvl(PACKNUM, 'null') AS PACKNUM,
                                                  nvl(GOODSOWNERPACKNO, 'null') AS GOODSOWNERPACKNO,
                                                  nvl(MANAGENO, 'null') AS MANAGENO,
                                                  nvl(to_char(FEEBEGINDATE, 'YYYY-MM-DD hh24:mi:ss'), 'null') AS FEEBEGINDATE,
                                                  nvl(CONTRACTID, 'null') AS CONTRACTID,
                                                  nvl(GOODSSTATENO, 'null') AS GOODSSTATENO,
                                                  nvl(GOODSSTATENAME, 'null') AS GOODSSTATENAME,
                                                  nvl(to_char(CHANGEOWNERTIMES), 'null') AS CHANGEOWNERTIMES,
                                                  nvl(GOODSTYPE, 'null') AS GOODSTYPE,
                                                  nvl(GOODSTYPENAME, 'null') AS GOODSTYPENAME,
                                                  nvl(KINDNO, 'null') AS KINDNO,
                                                  nvl(KINDNAME, 'null') AS KINDNAME,
                                                  nvl(SHOPSIGNID, 'null') AS SHOPSIGNID,
                                                  nvl(SHOPSIGNNAME, 'null') AS SHOPSIGNNAME,
                                                  nvl(PRODAREAID, 'null') AS PRODAREAID,
                                                  nvl(PRODAREANAME, 'null') AS PRODAREANAME,
                                                  nvl(GOODSBATCHNO, 'null') AS GOODSBATCHNO,
                                                  nvl(PRODSTOVENO, 'null') AS PRODSTOVENO,
                                                  nvl(GRADENUM, 'null') AS GRADENUM,
                                                  nvl(GRADENUMTHICK, 0) AS GRADENUMTHICK,
                                                  nvl(to_char(GRADENUMWIDTH), 'null') AS GRADENUMWIDTH,
                                                  nvl(to_char(GRADENUMLENGTH), 'null') AS GRADENUMLENGTH,
                                                  nvl(GROSSWEIGHT, 0) AS GROSSWEIGHT,
                                                  nvl(NETWEIGHT, 0) AS NETWEIGHT,
                                                  nvl(POUNDWEIGHT, 0) AS POUNDWEIGHT,
                                                  nvl(CHECKWEIGHT, 0) AS CHECKWEIGHT,
                                                  nvl(SHEETNUM, 0) AS SHEETNUM,
                                                  nvl(UNIT, 'null') AS UNIT,
                                                  nvl(PACKTYPE, 'null') AS PACKTYPE,
                                                  nvl(STOCKAREAID, 'null') AS STOCKAREAID,
                                                  nvl(QUALITYMEMO, 'null') AS QUALITYMEMO,
                                                  nvl(FIRSTINOWNERID, 'null') AS FIRSTINOWNERID,
                                                  nvl(to_char(FIRSTINDATE, 'YYYY-MM-DD hh24:mi:ss'), 'null') AS FIRSTINDATE,
                                                  nvl(OUTBILLID, 'null') AS OUTBILLID,
                                                  nvl(LDGLISTID, 'null') AS LDGLISTID,
                                                  nvl(MATERIALGOODSID, 'null') AS MATERIALGOODSID,
                                                  nvl(decode(INTYPE, '20', '正常入库', '50', '退货入库', '99', '其它'), 'null') AS INTYPE,
                                                  nvl(OUTTYPE, 'null') AS OUTTYPE,
                                                  nvl(to_char(BILLSTATE), 'null') AS BILLSTATE,
                                                  nvl(to_char(OUTBILLTIME, 'YYYY-MM-DD hh24:mi:ss'), 'null') AS OUTBILLTIME,
                                                  nvl(MEMO, 'null') AS MEMO,
                                                  nvl(SDPRICE, 'null') AS SDPRICE,
                                                  nvl(SIDEMARK, 'null') AS TRUCKNO,
                                                  nvl(to_char(OUTBILLTIME, 'YYYY-MM-DD hh24:mi:ss'), 'null') AS OUTCUSTTIME,
                                                  nvl(to_char(round(sysdate - FIRSTINDATE)), 'null') AS STORAGEDAY,
                                                  nvl(to_char(LENGTH_PRODUCT_MAX), 'null') AS LENGTHMAX,
                                                  nvl(ownername, 'null') AS OWNERSHORT,
                                                  nvl(GRADENUMXH, 0) AS GRADENUMXH,
                                                  'null' AS MEMBERID
      FROM wmsdba.t_gg_sj_goods g,
           ST.T_XTSZ_BIND b
      WHERE 1 = 1
        AND KINDNAME LIKE '%' ||'不锈钢'|| '%'
        AND SHOPSIGNNAME LIKE '%' ||'spcd'|| '%'
        AND GRADENUM LIKE '%' ||'11*11*11'|| '%'
        AND PRODAREANAME LIKE '%' ||'巴西'|| '%'
        AND MANAGENO LIKE '%' ||'采购资源号'|| '%'
        AND PACKNUM LIKE '%' ||'捆包号'|| '%'
        AND FIRSTINDATE >= to_date('2015-07-16', 'yyyy-MM-dd')
        AND FIRSTINDATE < to_date('2015-07-16', 'yyyy-MM-dd') + 1
        AND goodsstateno IN ('20',
                             '130')
        AND g.deptid = b.dept_id
        AND g.ownerid = b.owner_id
        AND b.alive_flag = '1'
        AND b.seg_no = '080001'
      ORDER BY GRADENUM ASC) aa)
WHERE rownum_ > 0
  AND rownum_ <= 10
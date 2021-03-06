   SELECT Nvl(GOODSID, 'null')              AS GOODSID,
          Nvl(DEPTID, 'null')               AS DEPTID,
          VF_DEPTNAME                       AS DEPTNAME,
          Nvl(BARCODE, 'null')              AS BARCODE,
          Nvl(GOODSLOCID, 'null')           AS GOODSLOCID,
          Nvl(case INTYPE when '20' then '正常入库' when '50' then '退货入库' when '99' then '其它' end,'null')  			AS STOCKTYPE,
          Nvl(OWNERID, 'null')              AS OWNERID,
          Nvl(OWNERNAME, 'null')            AS OWNERNAME,
          Nvl(GOODSOWNERMANAGENO, 'null')   AS GOODSOWNERMANAGENO,
          Nvl(INBILLID, 'null')             AS INBILLID,
          Nvl(PACKNUM, 'null')              AS PACKNUM,
          Nvl(GOODSOWNERPACKNO, 'null')     AS GOODSOWNERPACKNO,
          Nvl(MANAGENO, 'null')             AS MANAGENO,
          Nvl(CONTRACTID, 'null')           AS CONTRACTID,
          Nvl(GOODSSTATENO, 'null')         AS GOODSSTATENO,
          Nvl(GOODSSTATENAME, 'null')       AS GOODSSTATENAME,
          CHANGEOWNERTIMES	         		AS CHANGEOWNERTIMES,
          Nvl(GOODSTYPE, 'null')            AS GOODSTYPE,
          Nvl(GOODSTYPENAME, 'null')        AS GOODSTYPENAME,
          Nvl(KINDNO, 'null')               AS KINDNO,
          Nvl(KINDNAME, 'null')             AS KINDNAME,
          Nvl(SHOPSIGNID, 'null')           AS SHOPSIGNID,
          Nvl(SHOPSIGNNAME, 'null')         AS SHOPSIGNNAME,
          Nvl(PRODAREAID, 'null')           AS PRODAREAID,
          Nvl(PRODAREANAME, 'null')         AS PRODAREANAME,
          Nvl(GOODSBATCHNO, 'null')         AS GOODSBATCHNO,
          Nvl(PRODSTOVENO, 'null')          AS PRODSTOVENO,
          Nvl(GRADENUM, 'null')             AS GRADENUM,
          Nvl(GRADENUMTHICK, 0)             AS GRADENUMTHICK,
          Nvl(GROSSWEIGHT, 0)               AS GROSSWEIGHT,
          Nvl(NETWEIGHT, 0)                 AS NETWEIGHT,
          Nvl(POUNDWEIGHT, 0)               AS POUNDWEIGHT,
          Nvl(CHECKWEIGHT, 0)               AS CHECKWEIGHT,
          Nvl(SHEETNUM, 0)                  AS SHEETNUM,
          Nvl(UNIT, 'null')                 AS UNIT,
          Nvl(PACKTYPE, 'null')             AS PACKTYPE,
          Nvl(STOCKAREAID, 'null')          AS STOCKAREAID,
          Nvl(QUALITYMEMO, 'null')          AS QUALITYMEMO,
          Nvl(FIRSTINOWNERID, 'null')       AS FIRSTINOWNERID,
          Nvl(OUTBILLID, 'null')            AS OUTBILLID,
          Nvl(LDGLISTID, 'null')            AS LDGLISTID,
          Nvl(MATERIALGOODSID, 'null')      AS MATERIALGOODSID,
          Nvl(case STOCKTYPE when '004001' then '室内库' when '004002' then '室外库' when 'NULL' then '室内库' end, 'null')          		AS INTYPE,
          Nvl(OUTTYPE, 'null')              AS OUTTYPE,
          Nvl(BILLSTATE, 'null')   			AS BILLSTATE,
          Nvl(MEMO, 'null')                 AS MEMO,
          Nvl(SDPRICE, 'null')              AS SDPRICE,
          Nvl(SIDEMARK, 'null')             AS TRUCKNO
   FROM   t_gg_sj_goods;


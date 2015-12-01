
SELECT t.DEPTID,
       t.PLANENDDATE,
       t.OUTCARBILLTIME,
       t.PROCESSTYPENAME,
       t.PROCESSID,
       t.PROCESSDEPT,
       t.PROCESSDEPTNAME,
       t.PROCESSCUSTOMNO,
       t.PROCESSCUSTOMNAME,
       t.PROCESSMOLDNAME,
       t.SETTLEDEPTNO,
       t.SETTLEDEPTNAME,
       t.M_MANAGENO,
       t.M_GRADENUM,
       t.M_NETWEIGHT,
       t.NETWEIGHT,
       t.A_GRADENUM,
       t.A_GRADENUM2,
       t.A_SHOPSIGNNAME,
       t.s_COUNTUNIT,
       t.s_SETTLENUM,
       t.s_SETTLESUM,
       t.s_INVOICEKINDID,
       t.s_INVOICEKINDNAME,
       t.FACTSUM,
       t.LASTSUM,
       t.PACKTYPENAME,
       t.settle_date,
       t.customerid,
       t.FEETYPE,
       t.FEETYPENAME,
       t.JSMEMO ,
       t.PRODAREANAME,
       t.chanxian,
       t.Goodslocid
FROM
  (SELECT a.DEPTID,
          a.PROCESSID,
          a.PROCESSDEPT,
          a.PROCESSDEPTNAME,
          a.PROCESSCUSTOMNO,
          a.PROCESSCUSTOMNAME,
          a.SETTLEDEPTNO,
          a.SETTLEDEPTNAME,
          a.PROCESSTYPENAME,
          a.PROCESSMOLDNAME,
          a.PLANENDDATE,
          a.OUTCARBILLTIME,
          a.PREWEIGHTSUM,
          a.M_MANAGENO,
          a.M_GRADENUM,
          a.PACKNUM_NUM,
          a.NETWEIGHT,
          a.M_NETWEIGHT,
          a.A_GRADENUM,
          a.A_GRADENUM2,
          a.A_SHOPSIGNNAME,
          b.s_SETTLENUM,
          b.s_SETTLESUM,
          b.s_COUNTUNIT,
          b.s_INVOICEKINDID,
          b.s_INVOICEKINDNAME,
          b.factsum,
          b.s_SETTLESUM-b.factsum Lastsum,
          a.packtypename,
          a.CUSTOMERID,
          b.CREATDATE settle_date,
          b.FEETYPE,
          b.FEETYPENAME,
          b.JSMEMO,
          a.PRODAREANAME,
          a.chanxian,
          a.Goodslocid
   FROM
     (SELECT P.DEPTID,
             P.PROCESSID,
             P.PROCESSDEPT,
             P.PROCESSDEPTNAME,
             P.PROCESSCUSTOMNO,
             P.PROCESSCUSTOMNAME,
             P.SETTLEDEPTNO,
             P.SETTLEDEPTNAME,
             P.PROCESSTYPENAME,
             P.PROCESSMOLDNAME,
             P.PLANENDDATE,
             p.preweightsum,
             p.packtypename,
             p.customerid,

        (SELECT MAX(JM.MANAGENO)
         FROM wmsdba.T_ZY_JG_PROCMATERIALDTL JM
         WHERE JM.DEPTID = P.DEPTID
           AND JM.PROCESSID = P.PROCESSID) AS M_MANAGENO,
             --ԭ�ϲɹ���Դ��


        (SELECT MAX(JM.GRADENUM) AS GRADENUM
         FROM wmsdba.T_ZY_JG_PROCMATERIALDTL JM
         WHERE JM.DEPTID = P.DEPTID
           AND JM.PROCESSID = P.PROCESSID) AS M_GRADENUM,
             --ԭ�Ϲ��

             COUNT(JA.PACKNUM) AS PACKNUM_NUM,
             --��Ʒ����

             sum(JA.NETWEIGHT) AS NETWEIGHT,
             --��Ʒ����


        (SELECT SUM(JM.NETWEIGHT) AS NETWEIGHT
         FROM wmsdba.T_ZY_JG_PROCMATERIALDTL JM
         WHERE JM.DEPTID = P.DEPTID
           AND JM.PROCESSID = P.PROCESSID) AS M_NETWEIGHT,
             --ԭ������


        (SELECT JM.GRADENUM
         FROM wmsdba.T_ZY_JG_PROCARTICLEDTL JM
         WHERE JM.DEPTID = P.DEPTID
           AND JM.PROCESSID = P.PROCESSID
           AND rownum=1) AS A_GRADENUM,

        (SELECT JM.GRADENUM
         FROM wmsdba.T_ZY_JG_PROCARTICLEDTL JM
         WHERE JM.DEPTID = P.DEPTID
           AND JM.PROCESSID = P.PROCESSID
           AND rownum=1
           AND jm.goodstypename='�ӹ���Ʒ') AS A_GRADENUM2,
             min(JA.SHOPSIGNNAME) AS A_SHOPSIGNNAME,
             --��Ʒ�ƺ�

             max(JA.FIRSTINDATE) AS OUTCARBILLTIME,
             --��Ʒ��������

             max(JA.PRODAREANAME) AS PRODAREANAME,
             --����

             max(P.Chanxian) AS Chanxian,
             --����

             max(JA.Goodslocid) AS Goodslocid--��λ
FROM wmsdba.T_ZY_JG_PROCESS P,
     wmsdba.T_ZY_JG_PROCARTICLEDTL JA
      WHERE P.DEPTID = JA.DEPTID
        AND P.PROCESSID = JA.PROCESSID
        AND P.Processstate=1
        AND JA.GOODSTYPENAME!='�ӹ�����'
      GROUP BY P.DEPTID,
               P.PROCESSID,
               P.PROCESSDEPT,
               P.PROCESSDEPTNAME,
               P.PROCESSCUSTOMNO,
               P.PROCESSCUSTOMNAME,
               P.SETTLEDEPTNO,
               P.SETTLEDEPTNAME,
               P.PROCESSTYPENAME,
               P.PROCESSMOLDNAME,
               P.PLANENDDATE,
               p.preweightsum,
               p.customerid,
               p.packtypename) A,
     (SELECT T.DEPTID,
             T.BUSINESSNO,
             SUM(T.SETTLENUM) AS s_SETTLENUM,
             SUM(T.SETTLESUM) AS s_SETTLESUM,
             MAX(T.COUNTUNIT) AS s_COUNTUNIT,
             T.INVOICEKINDID AS s_INVOICEKINDID,
             T.INVOICEKINDNAME AS s_INVOICEKINDNAME,
             mst.Factsum,
             mst.CREATDATE,
             t.FEETYPE,
             t.FEETYPENAME,
             MAX(T.MEMO) JSMEMO
      FROM WMSDBA.T_ZY_JS_SETTLEMENT MST,
           WMSDBA.T_ZY_JS_SETTLEMENTDETAIL T
      WHERE T.DEPTID=MST.Deptid
        AND T.Settlecd=MST.Settlecd
      GROUP BY T.DEPTID,
               T.BUSINESSNO,
               T.INVOICEKINDID,
               T.INVOICEKINDNAME,
               mst.Factsum,
               T.Settlecd,
               mst.CREATDATE,
               t.feetype,
               t.feetypename) B
   WHERE A.DEPTID = B.DEPTID
     AND A.PROCESSID = B.BUSINESSNO) t
WHERE t.DEPTID=:dp
  AND t.processdept='KH03632'
  AND settle_date>=to_date('2015/7/3','yyyy-mm-dd')
  AND settle_date<to_date('2015/8/4','yyyy-mm-dd')
  AND OUTCARBILLTIME>=to_date('2015/7/3','yyyy-mm-dd')
  AND OUTCARBILLTIME<to_date('2015/8/4','yyyy-mm-dd')
  AND FeeType = '001002'
ORDER BY t.PLANENDDATE ;


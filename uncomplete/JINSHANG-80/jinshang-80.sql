UPDATE SHOW.SEGWEIGHT
SET stackweight=0,
    tidanweight=0,
    readyweight=0
WHERE 1=1;


UPDATE SHOW.SEGWEIGHT s
SET STACKWEIGHT=
  (SELECT STACKWEIGHT
   FROM
     ( SELECT extsysstackid seg_no,
              SUM(STACKING_WEIGHT) STACKWEIGHT
      FROM t_gg_tx_dl_in_sm a
      WHERE a.insert_time>=to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
        AND exists
          (SELECT 1
           FROM SHOW.SEGWEIGHT b
           WHERE a.extsysstackid=b.seg_no)
      GROUP BY extsysstackid) t
   WHERE s.seg_no=t.seg_no);


UPDATE SHOW.SEGWEIGHT s
SET TIDANWEIGHT=
  (SELECT STACKWEIGHT
   FROM
     ( SELECT seg_no,
              SUM(UNIT_WEIGHT) STACKWEIGHT
      FROM t_gg_tx_dl_bil_d a
      WHERE a.insert_time>=to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
        AND exists
          (SELECT 1
           FROM SHOW.SEGWEIGHT b
           WHERE a.seg_no=b.seg_no)
      GROUP BY seg_no) t
   WHERE s.seg_no=t.seg_no);


UPDATE SHOW.SEGWEIGHT s
SET READYWEIGHT=
  (SELECT STACKWEIGHT
   FROM
     ( SELECT seg_no,
              SUM(WEIGHT_READY_TOT) STACKWEIGHT
      FROM t_si_logistics_ready_m a
      WHERE a.TIME_RECEIVE>=to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
        AND exists
          (SELECT 1
           FROM SHOW.SEGWEIGHT b
           WHERE a.seg_no=b.seg_no)
      GROUP BY seg_no) t
   WHERE s.seg_no=t.seg_no);


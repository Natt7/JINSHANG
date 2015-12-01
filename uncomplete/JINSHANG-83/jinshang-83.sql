SELECT sum(a)
FROM
  (SELECT sum(netweightsum) a
   FROM t_zy_rk_inbill
   WHERE r_record_create_date>=to_date(to_char(sysdate,'yyyy')||'-1-1','yyyy-mm-dd')
   UNION SELECT sum(netweightsum) a
   FROM t_zy_ck_outbill
   WHERE r_record_create_date>=to_date(to_char(sysdate,'yyyy')||'-1-1','yyyy-mm-dd'));


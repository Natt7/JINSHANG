SELECT to_char(sysdate,'yyyy-mm-dd hh24')||':00',
                                           sum(a),
                                           sum(b),
                                           sum(c)
FROM
  ( SELECT sum(netweightsum) a,
           0 b,
             0 c
   FROM t_zy_rk_inbill
   WHERE r_record_create_date>sysdate-1/24
   UNION ALL SELECT 0 a,
                      sum(netweightsum) b,
                      0 c
   FROM t_zy_ck_outbill
   WHERE r_record_create_date>sysdate-1/24
   UNION ALL SELECT 0 a,
                      0 b,
                        sum(netweightsum) c
   FROM t_zy_gh_changeownerlist
   WHERE r_record_create_date>sysdate-1/24);


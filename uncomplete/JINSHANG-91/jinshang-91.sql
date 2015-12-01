SELECT to_char(b.bill_date,'yyyy-mm-dd') A,
       b.resource_num B,
       b.bill_num C,
       sum(b.unit_weight) D,
       sum(c.netweight) E,
       count(b.pack_num) F,
       count(c.packnum) G,
       b.out_settle_type H
FROM t_gg_tx_dl_bil_d b
LEFT JOIN v_t_gg_sj_goods_out c ON (c.packnum=b.pack_num
                                    AND c.deptid=b.deptid)
WHERE b.deptid LIKE '03%'
  AND b.owner_num LIKE '%GM0%'
  AND to_char(b.bill_date,'yyyy-mm-dd')>='2015-07-01'
  AND to_char(b.bill_date,'yyyy-mm-dd')<'2015-08-01'
GROUP BY to_char(b.bill_date,'yyyy-mm-dd'),
         b.resource_num,
         b.bill_num,
         b.out_settle_type;


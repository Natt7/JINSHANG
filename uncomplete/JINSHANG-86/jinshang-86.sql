SELECT sum(netweight),COUNT *
FROM
  ( SELECT
     (SELECT sum(t.net_weight)
      FROM t_tm_stock_notice t
      WHERE t.print_batch_id=im.bill_id) netweight,
                                         bill_id
   FROM t_im_blvalidatehistory im
   WHERE R_RECORD_CREATE_DATE>to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
     AND seg_no='STM06'
     AND validatestate=11);


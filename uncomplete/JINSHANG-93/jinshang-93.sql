SELECT m.PROVIDER_NAME,
       sum(td.weight_active/1000) WEIGHT_STRC,
       min(t.time_receive),
       CASE
           WHEN min(t.time_receive)+7<sysdate THEN 1
           ELSE 0
       END flag
FROM wl.t_his_t_stacking_m t,
     wl.t_his_t_stacking_d td,
     wmsdba.t_si_logistics_ready_m m,
     wmsdba.t_si_logistics_ready_d md
WHERE t.stacking_rec_num=td.stacking_rec_num
  AND m.seg_no=md.seg_no
  AND m.ready_num=md.ready_num
  AND t.seg_no='00103'
  AND m.seg_no='00103'
  AND t.time_receive>=sysdate-30
  AND m.time_receive>sysdate-30
  AND t.optflag=0
  AND t.order_num=m.order_num
  AND t.seg_no=m.seg_no
  AND td.pack_num=md.pack_num
GROUP BY m.PROVIDER_NAME;


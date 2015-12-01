SELECT cl.lock_flag,sum(net_weight),COUNT *
FROM wmsdba.t_tm_check_goods_log cl
WHERE sys_id = 'STM06'
  AND CREATE_DATE>to_date(to_char(sysdate,'yyyy-mm-dd'),'yyyy-mm-dd')
GROUP BY cl.lock_flag;


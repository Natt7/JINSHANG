SELECT count(DISTINCT deptid)
FROM t_zy_jg_process;


SELECT count(DISTINCT t.destination_mobile)
FROM xt.t_ss_sms_send_log t;


SELECT count(DISTINCT t.kindname)
FROM t_gg_sj_producttype t;


SELECT count(DISTINCT t.ownername)
FROM t_gg_sj_customer t;


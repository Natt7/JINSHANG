
FOR dtl in
  (SELECT sum(STORE_AMOUNT) STORE_AMOUNT,sum(STORE_IN_AMOUNT) STORE_IN_AMOUNT, sum(STORE_OUT_AMOUNT) STORE_OUT_AMOUNT,sum(STORE_PROCESS_AMOUNT) STORE_PROCESS_AMOUNT
   FROM
     ( SELECT /+index(t T_GG_SJ_GOODS_INDX05)/sum(t.netweight) STORE_AMOUNT,0 STORE_IN_AMOUNT,0 STORE_OUT_AMOUNT,0 STORE_PROCESS_AMOUNT
      FROM wmsdba.t_gg_sj_goods@wms t
      WHERE goodsstateno = '20'
        AND (deptid NOT LIKE '03%'
             AND deptid NOT LIKE 'ZZ%'
             AND deptid NOT LIKE 'MG%')
      UNION ALL --RK
 SELECT 0 STORE_AMOUNT,sum(t.netweightsum) STORE_IN_AMOUNT,0 STORE_OUT_AMOUNT,0 STORE_PROCESS_AMOUNT
      FROM wmsdba.t_zy_rk_inbill@wms t
      WHERE r_record_create_date >= trunc(sysdate - 1) + 14 / 24
        AND r_record_create_date < trunc(sysdate) + 14 / 24
        AND (deptid NOT LIKE '03%'
             AND deptid NOT LIKE 'ZZ%'
             AND deptid NOT LIKE 'MG%')
      UNION ALL --CK
 SELECT 0 STORE_AMOUNT,0 STORE_IN_AMOUNT,sum(t.netweightsum) STORE_OUT_AMOUNT,0 STORE_PROCESS_AMOUNT
      FROM wmsdba.t_zy_ck_outbill@wms t
      WHERE r_record_create_date >= trunc(sysdate - 1) + 14 / 24
        AND r_record_create_date < trunc(sysdate) + 14 / 24
        AND (deptid NOT LIKE '03%'
             AND deptid NOT LIKE 'ZZ%'
             AND deptid NOT LIKE 'MG%')
      UNION ALL --JG
 SELECT 0 STORE_AMOUNT,0 STORE_IN_AMOUNT,0 STORE_OUT_AMOUNT,sum(t.preweightsum) STORE_PROCESS_AMOUNT
      FROM wmsdba.t_zy_jg_process@wms t
      WHERE r_record_create_date >= trunc(sysdate - 1) + 14 / 24
        AND r_record_create_date < trunc(sysdate) + 14 / 24
        AND (deptid NOT LIKE '03%'
             AND deptid NOT LIKE 'ZZ%'
             AND deptid NOT LIKE 'MG%'))) LOOP
INSERT INTO t_statistics_warehouse(STORE_AMOUNT,STORE_IN_AMOUNT,STORE_OUT_AMOUNT,STORE_PROCESS_AMOUNT)
VALUES (dtl.STORE_AMOUNT,
        dtl.STORE_IN_AMOUNT,
        dtl.STORE_OUT_AMOUNT,
        dtl.STORE_PROCESS_AMOUNT) ;

 COMMIT;

 END LOOP;


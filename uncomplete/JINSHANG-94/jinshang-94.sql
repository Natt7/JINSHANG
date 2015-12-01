INSERT INTO SHOW.PDGM_SHOWKC --�������������Դ

SELECT PROVIDER_NAME,
       sum(NETWEIGHTSUM),
       sum(KCTDNET),
       0
FROM
  ( SELECT PROVIDER_NAME,
           NETWEIGHTSUM,
           0 KCTDNET
   FROM
     ( SELECT '�㶫�ظ���ɽ�ɷ����޹�˾' PROVIDER_NAME,
                             0 NETWEIGHTSUM
      FROM dual
      UNION ALL --÷��
SELECT '�Ϻ�÷ɽ�����ɷ����޹�˾' PROVIDER_NAME,
                      sum(netweight) NETWEIGHTSUM
      FROM wmsdba.t_gg_sj_goods t
      WHERE goodsstateno=20
        AND EXISTS
          (SELECT 1
           FROM WL.T_OWNER W
           WHERE SEG_NO='00103'
             AND T.DEPTID=W.DEPTID
             AND t.ownerid=w.owner_id
             AND (w.deptid!='0301'
                  AND w.deptid!='4501'))
        AND EXISTS
          (SELECT 1
           FROM wl.t_his_t_stacking_m m,wl.t_his_t_stacking_d d
           WHERE m.manu_id=d.manu_id
             AND m.stacking_rec_num=d.stacking_rec_num
             AND m.seg_no='00103'
             AND m.manu_id='BGTM'
             AND t.packnum=d.pack_num)
      UNION ALL --�ɷ�
SELECT '��ɽ�����ɷ����޹�˾' PROVIDER_NAME,
                    sum(netweight) NETWEIGHTSUM
      FROM wmsdba.t_gg_sj_goods t
      WHERE goodsstateno=20
        AND EXISTS
          (SELECT 1
           FROM WL.T_OWNER W
           WHERE SEG_NO='00103'
             AND T.DEPTID=W.DEPTID
             AND t.ownerid=w.owner_id
             AND (w.deptid!='0301'
                  AND w.deptid!='4501'))
        AND EXISTS
          (SELECT 1
           FROM wl.t_his_t_stacking_m m,wl.t_his_t_stacking_d d
           WHERE m.manu_id=d.manu_id
             AND m.stacking_rec_num=d.stacking_rec_num
             AND m.seg_no='00103'
             AND m.manu_id='BGSA'
             AND t.packnum=d.pack_num)
      UNION ALL --�����
SELECT '�����ظ����޹�˾' PROVIDER_NAME,
                  sum(netweight) NETWEIGHTSUM
      FROM wmsdba.t_gg_sj_goods t
      WHERE goodsstateno=20
        AND EXISTS
          (SELECT 1
           FROM WL.T_OWNER W
           WHERE SEG_NO='00103'
             AND T.DEPTID=W.DEPTID
             AND t.ownerid=w.owner_id
             AND (w.deptid!='0301'
                  AND w.deptid!='4501'))
        AND EXISTS
          (SELECT 1
           FROM wl.t_his_t_stacking_m m,wl.t_his_t_stacking_d d
           WHERE m.manu_id=d.manu_id
             AND m.stacking_rec_num=d.stacking_rec_num
             AND m.seg_no='00103'
             AND m.manu_id='BGSW'
             AND t.packnum=d.pack_num))
   UNION ALL --�ѿ���
SELECT PROVIDER_NAME,
       0,
       NETWEIGHTSUM
   FROM
     ( SELECT '�㶫�ظ���ɽ�ɷ����޹�˾' PROVIDER_NAME,
                             0 NETWEIGHTSUM
      FROM dual
      UNION ALL --÷��
SELECT '�Ϻ�÷ɽ�����ɷ����޹�˾' PROVIDER_NAME,
                      sum(netweight) NETWEIGHTSUM
      FROM wmsdba.t_gg_sj_goods t
      WHERE goodsstateno=20
        AND EXISTS
          (SELECT 1
           FROM WL.T_OWNER W
           WHERE SEG_NO='00103'
             AND T.DEPTID=W.DEPTID
             AND t.ownerid=w.owner_id
             AND (w.deptid!='0301'
                  AND w.deptid!='4501'))
        AND EXISTS
          (SELECT 1
           FROM wl.t_his_t_stacking_m m,wl.t_his_t_stacking_d d
           WHERE m.manu_id=d.manu_id
             AND m.stacking_rec_num=d.stacking_rec_num
             AND m.seg_no='00103'
             AND m.manu_id='BGTM'
             AND t.packnum=d.pack_num)
        AND exists
          (SELECT 1
           FROM wl.t_s_bill_d d
           WHERE t.packnum=d.pack_id
             AND d.seg_no='00103')
      UNION ALL --�ɷ�
SELECT '��ɽ�����ɷ����޹�˾' PROVIDER_NAME,
                    sum(netweight) NETWEIGHTSUM
      FROM wmsdba.t_gg_sj_goods t
      WHERE goodsstateno=20
        AND EXISTS
          (SELECT 1
           FROM WL.T_OWNER W
           WHERE SEG_NO='00103'
             AND T.DEPTID=W.DEPTID
             AND t.ownerid=w.owner_id
             AND (w.deptid!='0301'
                  AND w.deptid!='4501'))
        AND EXISTS
          (SELECT 1
           FROM wl.t_his_t_stacking_m m,wl.t_his_t_stacking_d d
           WHERE m.manu_id=d.manu_id
             AND m.stacking_rec_num=d.stacking_rec_num
             AND m.seg_no='00103'
             AND m.manu_id='BGSA'
             AND t.packnum=d.pack_num)
        AND exists
          (SELECT 1
           FROM wl.t_s_bill_d d
           WHERE t.packnum=d.pack_id
             AND d.seg_no='00103')
      UNION ALL --�����
SELECT '�����ظ����޹�˾' PROVIDER_NAME,
                  sum(netweight) NETWEIGHTSUM
      FROM wmsdba.t_gg_sj_goods t
      WHERE goodsstateno=20
        AND EXISTS
          (SELECT 1
           FROM WL.T_OWNER W
           WHERE SEG_NO='00103'
             AND T.DEPTID=W.DEPTID
             AND t.ownerid=w.owner_id
             AND (w.deptid!='0301'
                  AND w.deptid!='4501'))
        AND EXISTS
          (SELECT 1
           FROM wl.t_his_t_stacking_m m,wl.t_his_t_stacking_d d
           WHERE m.manu_id=d.manu_id
             AND m.stacking_rec_num=d.stacking_rec_num
             AND m.seg_no='00103'
             AND m.manu_id='BGSW'
             AND t.packnum=d.pack_num)
        AND exists
          (SELECT 1
           FROM wl.t_s_bill_d d
           WHERE t.packnum=d.pack_id
             AND d.seg_no='00103')) )
GROUP BY PROVIDER_NAME;


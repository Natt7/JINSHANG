SELECT prodareaname,
       sum(netweightsum)
FROM t_gg_sj_goods
WHERE goodsstateno=20
  AND (deptid NOT LIKE '03%'
       AND deptid NOT LIKE 'ZZ%'
       AND deptid NOT LIKE 'MG%')
GROUP BY prodareaname;

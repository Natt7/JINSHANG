SELECT
	*
FROM
	(
		SELECT
			ROWNUM AS rownum_,
			aa.*
		FROM
			(
				SELECT
					NVL (DEPTID, 'null') AS DEPTID,
					(
						SELECT
							deptname
						FROM
							T_COMMON_DEPT D
						WHERE
							D .deptid = G .deptid
					) AS DEPTNAME,
					NVL (GRADENUM, 'null') AS GRADENUM,
					NVL (SHOPSIGNID, 'null') AS SHOPSIGNID,
					NVL (SHOPSIGNNAME, 'null') AS SHOPSIGNNAME,
					NVL (PRODAREAID, 'null') AS PRODAREAID,
					NVL (PRODAREANAME, 'null') AS PRODAREANAME,
					NVL (KINDNO, 'null') AS KINDNO,
					NVL (KINDNAME, 'null') AS KINDNAME,
					NVL (ownername, 'null') AS OWNERSHORT,
					NVL (GOODSOWNERPACKNO, 'null') AS GOODSOWNERPACKNO,
					NVL (SUM(NETWEIGHT), 0) AS NETWEIGHT,
					NVL (SUM(GROSSWEIGHT), 0) AS GROSSWEIGHT,
					NVL (SUM(SHEETNUM), 0) AS SHEETNUM
				FROM
					T_GG_SJ_GOODS G
				WHERE
					1 = 1
				AND (
					DEPTID LIKE DECODE (
						(
							SELECT
								COUNT (1)
							FROM
								T_BM_UI_CONFIGURE c
							WHERE
								c.configure_no = 'COMM'
							AND DEPTID = '0301'
						),
						0,
						SUBSTR ('0301', 0, 2) || '%',
						'0301'
					)
				)
				AND GOODSSTATENO = '20'
				AND KINDNAME LIKE '%' || '不锈钢线材' || '%'
				AND SHOPSIGNNAME LIKE '%' || 'MR T-2.5BA' || '%'
				AND GRADENUM LIKE '%' || '11' || '%'
				AND PRODAREANAME LIKE '%' || '邯钢' || '%'
				GROUP BY
					G .deptid,
					GRADENUM,
					SHOPSIGNID,
					SHOPSIGNNAME,
					PRODAREAID,
					PRODAREANAME,
					KINDNO,
					KINDNAME,
					ownername,
					GOODSOWNERPACKNO
			) aa
	)
WHERE
	rownum_ > 0
AND rownum_ <= 10;


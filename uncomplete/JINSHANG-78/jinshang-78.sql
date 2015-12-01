SELECT
	*
FROM
	(
		SELECT
			tt10.*, '' ownername
		FROM
			(
				(
					SELECT
						ownerid,
						manageno,
						SUM (qcnetweight) qcnetweight,
						SUM (INnetweight) INnetweight,
						SUM (JGRnetweight) JGRnetweight,
						SUM (GHRnetweight) GHRnetweight,
						SUM (OUTnetweight) OUTnetweight,
						SUM (GHOnetweight) GHOnetweight,
						SUM (JGCnetweight) JGCnetweight,
						SUM (QMnetweight) QMnetweight,
						SUM (js) js,
						SUM (sheetnum) sheetnum,
						MAX (kindno) kindno,
						MAX (kindname) kindname,
						MAX (prodareaid) prodareaid,
						MAX (prodareaname) prodareaname,
						MAX (shopsignid) shopsignid,
						MAX (shopsignname) shopsignname,
						MAX (gradenum) gradenum
					FROM
						(
							(
								SELECT
									ownerid,
									manageno,
									SUM (netweight) qcnetweight,
									0 INnetweight,
									0 JGRnetweight,
									0 GHRnetweight,
									0 OUTnetweight,
									0 GHOnetweight,
									0 JGCnetweight,
									0 QMnetweight,
									0 js,
									0 sheetnum,
									MAX (kindno) kindno,
									MAX (kindname) kindname,
									MAX (prodareaid) prodareaid,
									MAX (prodareaname) prodareaname,
									MAX (shopsignid) shopsignid,
									MAX (shopsignname) shopsignname,
									MAX (gradenum) gradenum
								FROM
									(
										SELECT
											ownerid,
											'' ownername,
											manageno,
											SUM (netweight) netweight,
											MAX (kindno) kindno,
											MAX (kindname) kindname,
											MAX (prodareaid) prodareaid,
											MAX (prodareaname) prodareaname,
											MAX (shopsignid) shopsignid,
											MAX (shopsignname) shopsignname,
											MAX (gradenum) gradenum
										FROM
											T_GG_SJ_Goods
										WHERE
											goodsstateno = '20'
										AND deptid = '0301'
										GROUP BY
											ownerid,
											manageno
										UNION ALL
											SELECT
												ownerid,
												'' ownername,
												manageno ,- SUM (netweight) netweight,
												MAX (kindno) kindno,
												MAX (kindname) kindname,
												MAX (prodareaid) prodareaid,
												MAX (prodareaname) prodareaname,
												MAX (shopsignid) shopsignid,
												MAX (shopsignname) shopsignname,
												MAX (gradenum) gradenum
											FROM
												T_ZY_RK_InBillDetail
											WHERE
												deptid = '0301'
											AND (goodsstateno = '20')
											AND firstindate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
											AND firstindate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
											GROUP BY
												ownerid,
												manageno
											UNION ALL
												SELECT
													ownerid,
													'' ownername,
													manageno ,- SUM (netweight) netweight,
													MAX (kindno) kindno,
													MAX (kindname) kindname,
													MAX (prodareaid) prodareaid,
													MAX (prodareaname) prodareaname,
													MAX (shopsignid) shopsignid,
													MAX (shopsignname) shopsignname,
													MAX (gradenum) gradenum
												FROM
													T_ZY_JG_ProcArticleDtl
												WHERE
													deptid = '0301'
												AND firstindate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
												AND firstindate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
												AND goodsstateno = '130'
												GROUP BY
													ownerid,
													manageno
												UNION ALL
													SELECT
														newownerno aownerid,
														newownername ownername,
														managenum manageno ,- SUM (netweight) netweight,
														MAX (kindno) kindno,
														MAX (kindname) kindname,
														MAX (prodareaid) prodareaid,
														MAX (prodareaname) prodareaname,
														MAX (shopsignid) shopsignid,
														MAX (shopsignname) shopsignname,
														MAX (gradenum) gradenum
													FROM
														(
															SELECT
																A .newownerno,
																A .newownername,
																(
																	CASE
																	WHEN (
																		managenum IS NULL
																		OR managenum = ''
																	) THEN
																		premanagenum
																	ELSE
																		managenum
																	END
																) managenum,
																b.shopsignid,
																b.shopsignname,
																b.prodareaid,
																b.prodareaname,
																b.gradenum,
																b.netweight,
																b.kindname,
																b.kindno
															FROM
																(
																	SELECT
																		deptid,
																		ChangeOwnerID,
																		newownerno,
																		'' newownername
																	FROM
																		T_ZY_GH_ChangeOwnerList
																	WHERE
																		DeptID = '0301'
																	AND ChangeDate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
																	AND changedate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
																) A
															LEFT JOIN T_ZY_GH_ChangeOwnerDetail b ON A .changeownerid = b.changeownerno
															AND A .deptid = b.deptid
														) tb1
													GROUP BY
														newownerno,
														newownername,
														managenum
													UNION ALL
														SELECT
															ownerno,
															'' ownername,
															managenum,
															SUM (netweight) netweight,
															MAX (kindno) kindno,
															MAX (kindname) kindname,
															MAX (prodareaid) prodareaid,
															MAX (prodareaname) prodareaname,
															MAX (shopsignid) shopsignid,
															MAX (shopsignname) shopsignname,
															MAX (gradenum) gradenum
														FROM
															T_ZY_CK_OutPack
														WHERE
															deptid = '0301'
														AND OutCustTime >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
														AND OutCustTime < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
														GROUP BY
															ownerno,
															managenum
														UNION ALL
															SELECT
																ownerid,
																'' ownername,
																manageno,
																SUM (netweight) anetweight,
																MAX (kindno) kindno,
																MAX (kindname) kindname,
																MAX (prodareaid) prodareaid,
																MAX (prodareaname) prodareaname,
																MAX (shopsignid) shopsignid,
																MAX (shopsignname) shopsignname,
																MAX (gradenum) gradenum
															FROM
																T_ZY_JG_ProcMaterialDtl
															WHERE
																deptid = '0301'
															AND EXISTS (
																SELECT
																	1
																FROM
																	T_ZY_JG_PROCESS
																WHERE
																	ProcessID = T_ZY_JG_ProcMaterialDtl.ProcessID
																AND deptid = T_ZY_JG_ProcMaterialDtl.deptid
																AND OutCarBillTime >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
																AND OutCarBillTime < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
															)
															GROUP BY
																ownerid,
																manageno
															UNION ALL
																SELECT
																	preownerno,
																	proownername,
																	premanagenum,
																	SUM (netweight) anetweight,
																	MAX (kindno) kindno,
																	MAX (kindname) kindname,
																	MAX (prodareaid) prodareaid,
																	MAX (prodareaname) prodareaname,
																	MAX (shopsignid) shopsignid,
																	MAX (shopsignname) shopsignname,
																	MAX (gradenum) gradenum
																FROM
																	(
																		SELECT
																			A .preownerno,
																			A .proownername,
																			b.premanagenum,
																			b.netweight,
																			b.gradenum,
																			b.shopsignname,
																			b.shopsignid,
																			b.prodareaname,
																			b.prodareaid,
																			b.kindno,
																			b.kindname
																		FROM
																			(
																				SELECT
																					deptid,
																					ChangeOwnerID,
																					preownerno,
																					'' proownername
																				FROM
																					T_ZY_GH_ChangeOwnerList
																				WHERE
																					DeptID = '0301'
																				AND ChangeDate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
																				AND changedate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
																			) A
																		LEFT JOIN T_ZY_GH_ChangeOwnerDetail b ON A .changeownerid = b.changeownerno
																		AND A .deptid = b.deptid
																	) tb1
																GROUP BY
																	preownerno,
																	proownername,
																	premanagenum
									) tbx
								GROUP BY
									ownerid,
									ownername,
									manageno
							)
							UNION ALL
								(
									SELECT
										ownerid,
										manageno,
										0 qcnetweight,
										SUM (netweight) INnetweight,
										0 JGRnetweight,
										0 GHRnetweight,
										0 OUTnetweight,
										0 GHOnetweight,
										0 JGCnetweight,
										0 QMnetweight,
										0 js,
										0 sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										T_ZY_RK_InBillDetail
									WHERE
										deptid = '0301'
									AND goodsstateno = '20'
									AND firstindate < TO_DATE ('2015/8/1', 'yyyy-mm-dd')
									AND firstindate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
									GROUP BY
										ownerid,
										manageno
								)
							UNION ALL
								(
									SELECT
										ownerid,
										manageno,
										0 qcnetweight,
										0 INnetweight,
										SUM (netweight) JGRnetweight,
										0 GHRnetweight,
										0 OUTnetweight,
										0 GHOnetweight,
										0 JGCnetweight,
										0 QMnetweight,
										0 js,
										0 sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										T_ZY_JG_ProcArticleDtl
									WHERE
										deptid = '0301'
									AND firstindate <= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
									AND firstindate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
									AND goodsstateno = '130'
									GROUP BY
										ownerid,
										manageno
								)
							UNION ALL
								(
									SELECT
										newownerno ownerid,
										managenum manageno,
										0 qcnetweight,
										0 INnetweight,
										0 JGRnetweight,
										SUM (netweight) GHRnetweight,
										0 OUTnetweight,
										0 GHOnetweight,
										0 JGCnetweight,
										0 QMnetweight,
										0 js,
										0 sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										(
											SELECT
												A .newownerno,
												A .newownername,
												(
													CASE
													WHEN (
														managenum IS NULL
														OR managenum = ''
													) THEN
														premanagenum
													ELSE
														managenum
													END
												) managenum,
												b.shopsignid,
												b.shopsignname,
												b.prodareaid,
												b.prodareaname,
												b.gradenum,
												b.netweight,
												b.kindno,
												b.kindname
											FROM
												(
													SELECT
														deptid,
														ChangeOwnerID,
														newownerno,
														'' newownername
													FROM
														T_ZY_GH_ChangeOwnerList
													WHERE
														DeptID = '0301'
													AND ChangeDate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
													AND changedate < TO_DATE ('2015/8/1', 'yyyy-mm-dd')
												) A
											LEFT JOIN T_ZY_GH_ChangeOwnerDetail b ON A .changeownerid = b.changeownerno
											AND A .deptid = b.deptid
										) tb1
									GROUP BY
										newownerno,
										newownername,
										managenum
								)
							UNION ALL
								(
									SELECT
										ownerno ownerid,
										managenum manageno,
										0 qcnetweight,
										0 INnetweight,
										0 JGRnetweight,
										0 GHRnetweight,
										SUM (netweight) OUTnetweight,
										0 GHOnetweight,
										0 JGCnetweight,
										0 QMnetweight,
										0 js,
										0 sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										T_ZY_CK_OutPack
									WHERE
										deptid = '0301'
									AND OutCustTime >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
									AND OutCustTime < TO_DATE ('2015/8/1', 'yyyy-mm-dd')
									GROUP BY
										ownerno,
										managenum
								)
							UNION ALL
								(
									SELECT
										PREOWNERNO ownerid,
										managenum manageno,
										0 qcnetweight,
										0 INnetweight,
										0 JGRnetweight,
										0 GHRnetweight,
										0 OUTnetweight,
										SUM (netweight) GHOnetweight,
										0 JGCnetweight,
										0 QMnetweight,
										0 js,
										0 sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										(
											SELECT
												A .PREOWNERNO,
												A .PRoOWNERName,
												(
													CASE
													WHEN (
														premanagenum IS NULL
														OR premanagenum = ''
													) THEN
														managenum
													ELSE
														premanagenum
													END
												) managenum,
												b.netweight,
												b.gradenum,
												b.shopsignname,
												b.shopsignid,
												b.kindname,
												b.kindno,
												b.prodareaname,
												b.prodareaid
											FROM
												(
													SELECT
														deptid,
														ChangeOwnerID,
														PReOWNERNO,
														'' PRoOWNERName
													FROM
														T_ZY_GH_ChangeOwnerList
													WHERE
														DeptID = '0301'
													AND changedate < TO_DATE ('2015/8/1', 'yyyy-mm-dd')
													AND changedate >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
												) A
											LEFT JOIN T_ZY_GH_ChangeOwnerDetail b ON A .changeownerid = b.changeownerno
											AND A .deptid = b.deptid
										) tb1
									GROUP BY
										PREOWNERNO,
										PRoOWNERName,
										managenum
								)
							UNION ALL
								(
									SELECT
										ownerid,
										manageno,
										0 qcnetweight,
										0 INnetweight,
										0 JGRnetweight,
										0 GHRnetweight,
										0 OUTnetweight,
										0 GHOnetweight,
										SUM (netweight) JGCnetweight,
										0 QMnetweight,
										0 js,
										0 sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										T_ZY_JG_ProcMaterialDtl
									WHERE
										deptid = '0301'
									AND EXISTS (
										SELECT
											1
										FROM
											T_ZY_JG_PROCESS
										WHERE
											ProcessID = T_ZY_JG_ProcMaterialDtl.ProcessID
										AND deptid = T_ZY_JG_ProcMaterialDtl.deptid
										AND OutCarBillTime >= TO_DATE ('2015/7/1', 'yyyy-mm-dd')
										AND OutCarBillTime < TO_DATE ('2015/8/1', 'yyyy-mm-dd')
									)
									GROUP BY
										ownerid,
										manageno
								)
							UNION ALL
								(
									SELECT
										ownerid,
										manageno,
										0 qcnetweight,
										0 INnetweight,
										0 JGRnetweight,
										0 GHRnetweight,
										0 OUTnetweight,
										0 GHOnetweight,
										0 JGCnetweight,
										SUM (netweight) QMnetweight,
										SUM (js) js,
										SUM (sheetnum) sheetnum,
										MAX (kindno) kindno,
										MAX (kindname) kindname,
										MAX (prodareaid) prodareaid,
										MAX (prodareaname) prodareaname,
										MAX (shopsignid) shopsignid,
										MAX (shopsignname) shopsignname,
										MAX (gradenum) gradenum
									FROM
										(
											SELECT
												ownerid,
												'' ownername,
												manageno,
												SUM (netweight) netweight,
												COUNT js,
												SUM (sheetnum) sheetnum,
												MAX (kindno) kindno,
												MAX (kindname) kindname,
												MAX (prodareaid) prodareaid,
												MAX (prodareaname) prodareaname,
												MAX (shopsignid) shopsignid,
												MAX (shopsignname) shopsignname,
												MAX (gradenum) gradenum
											FROM
												T_GG_SJ_Goods
											WHERE
												goodsstateno = '20'
											AND deptid = '0301'
											GROUP BY
												ownerid,
												manageno
											UNION ALL
												SELECT
													ownerid,
													'' ownername,
													manageno ,- SUM (netweight) netweight ,- COUNT js ,- SUM (sheetnum) sheetnum,
													MAX (kindno) kindno,
													MAX (kindname) kindname,
													MAX (prodareaid) prodareaid,
													MAX (prodareaname) prodareaname,
													MAX (shopsignid) shopsignid,
													MAX (shopsignname) shopsignname,
													MAX (gradenum) gradenum
												FROM
													T_ZY_RK_InBillDetail
												WHERE
													deptid = '0301'
												AND (goodsstateno = '20')
												AND firstindate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
												AND firstindate >= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
												GROUP BY
													ownerid,
													manageno
												UNION ALL
													SELECT
														ownerid,
														'' ownername,
														manageno ,- SUM (netweight) netweight ,- COUNT js ,- SUM (sheetnum) sheetnum,
														MAX (kindno) kindno,
														MAX (kindname) kindname,
														MAX (prodareaid) prodareaid,
														MAX (prodareaname) prodareaname,
														MAX (shopsignid) shopsignid,
														MAX (shopsignname) shopsignname,
														MAX (gradenum) gradenum
													FROM
														T_ZY_JG_ProcArticleDtl
													WHERE
														deptid = '0301'
													AND firstindate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
													AND firstindate >= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
													AND goodsstateno = '130'
													GROUP BY
														ownerid,
														manageno
													UNION ALL
														SELECT
															newownerno ownerid,
															newownername ownername,
															managenum manageno ,- SUM (netweight) netweight,
															- COUNT js ,- SUM (sheetnum) sheetnum,
															MAX (kindno) kindno,
															MAX (kindname) kindname,
															MAX (prodareaid) prodareaid,
															MAX (prodareaname) prodareaname,
															MAX (shopsignid) shopsignid,
															MAX (shopsignname) shopsignname,
															MAX (gradenum) gradenum
														FROM
															(
																SELECT
																	A .newownerno,
																	A .newownername,
																	(
																		CASE
																		WHEN (
																			managenum IS NULL
																			OR managenum = ''
																		) THEN
																			premanagenum
																		ELSE
																			managenum
																		END
																	) managenum,
																	b.netweight,
																	b.sheetnum,
																	b.gradenum,
																	b.shopsignname,
																	b.shopsignid,
																	b.kindname,
																	b.kindno,
																	b.prodareaname,
																	b.prodareaid
																FROM
																	(
																		SELECT
																			deptid,
																			ChangeOwnerID,
																			newownerno,
																			'' newownername
																		FROM
																			T_ZY_GH_ChangeOwnerList
																		WHERE
																			DeptID = '0301'
																		AND ChangeDate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
																		AND changedate >= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
																	) A
																LEFT JOIN T_ZY_GH_ChangeOwnerDetail b ON A .changeownerid = b.changeownerno
																AND A .deptid = b.deptid
															) tb1
														GROUP BY
															newownerno,
															newownername,
															managenum
														UNION ALL
															SELECT
																ownerno,
																'' ownername,
																managenum,
																SUM (netweight) netweight,
																COUNT js,
																SUM (sheetnum) sheetnum,
																MAX (kindno) kindno,
																MAX (kindname) kindname,
																MAX (prodareaid) prodareaid,
																MAX (prodareaname) prodareaname,
																MAX (shopsignid) shopsignid,
																MAX (shopsignname) shopsignname,
																MAX (gradenum) gradenum
															FROM
																T_ZY_CK_OutPack
															WHERE
																deptid = '0301'
															AND OutCustTime >= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
															AND OutCustTime < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
															GROUP BY
																ownerno,
																managenum
															UNION ALL
																SELECT
																	ownerid,
																	'' ownername,
																	manageno,
																	SUM (netweight) netweight,
																	COUNT js,
																	SUM (sheetnum) sheetnum,
																	MAX (kindno) kindno,
																	MAX (kindname) kindname,
																	MAX (prodareaid) prodareaid,
																	MAX (prodareaname) prodareaname,
																	MAX (shopsignid) shopsignid,
																	MAX (shopsignname) shopsignname,
																	MAX (gradenum) gradenum
																FROM
																	T_ZY_JG_ProcMaterialDtl
																WHERE
																	deptid = '0301'
																AND EXISTS (
																	SELECT
																		1
																	FROM
																		T_ZY_JG_PROCESS
																	WHERE
																		ProcessID = T_ZY_JG_ProcMaterialDtl.ProcessID
																	AND deptid = T_ZY_JG_ProcMaterialDtl.deptid
																	AND OutCarBillTime >= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
																	AND OutCarBillTime < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
																)
																GROUP BY
																	ownerid,
																	manageno
																UNION ALL
																	SELECT
																		preownerno,
																		proownername,
																		premanagenum,
																		SUM (netweight) netweight,
																		COUNT js,
																		SUM (sheetnum) sheetnum,
																		MAX (kindno) kindno,
																		MAX (kindname) kindname,
																		MAX (prodareaid) prodareaid,
																		MAX (prodareaname) prodareaname,
																		MAX (shopsignid) shopsignid,
																		MAX (shopsignname) shopsignname,
																		MAX (gradenum) gradenum
																	FROM
																		(
																			SELECT
																				A .preownerno,
																				A .proownername,
																				b.premanagenum,
																				b.netweight,
																				b.sheetnum,
																				b.gradenum,
																				b.shopsignname,
																				b.shopsignid,
																				b.kindno,
																				b.kindname,
																				b.prodareaname,
																				b.prodareaid
																			FROM
																				(
																					SELECT
																						deptid,
																						ChangeOwnerID,
																						preownerno,
																						'' proownername
																					FROM
																						T_ZY_GH_ChangeOwnerList
																					WHERE
																						DeptID = '0301'
																					AND ChangeDate < TO_DATE ('2015/8/4', 'yyyy-mm-dd')
																					AND changedate >= TO_DATE ('2015/8/1', 'yyyy-mm-dd')
																				) A
																			LEFT JOIN T_ZY_GH_ChangeOwnerDetail b ON A .changeownerid = b.changeownerno
																			AND A .deptid = b.deptid
																		) tb1
																	GROUP BY
																		preownerno,
																		proownername,
																		premanagenum
										) tbx
									GROUP BY
										ownerid,
										ownername,
										manageno
								)
						)
					GROUP BY
						ownerid,
						manageno
				) tt10
			)
	) tt30
WHERE
	ownerid IS NOT NULL
AND NOT (
	qcnetweight = 0
	AND INnetweight = 0
	AND JGRnetweight = 0
	AND GHRnetweight = 0
	AND OUTnetweight = 0
	AND GHOnetweight = 0
	AND JGCnetweight = 0
	AND QMnetweight = 0
	AND js = 0
	AND sheetnum = 0
)
AND ownerid = 'KH00001'
AND manageno = 'M'
ORDER BY
	ownerid,
	manageno;


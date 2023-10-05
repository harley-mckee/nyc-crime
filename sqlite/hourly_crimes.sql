SELECT
	BORO_NM AS borough,
	strftime('%H', CMPLNT_FR_TM) AS hour,
	count(*) AS total_crimes
FROM
	nypd_crimes
WHERE
	hour IS NOT NULL
GROUP BY
	borough,
	hour
ORDER BY
	hour;
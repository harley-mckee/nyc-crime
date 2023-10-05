-- pull select columns to match against geographic data in QGIS software using spatial joins
SELECT
	substr(nypd_crimes.CMPLNT_FR_DT, 7, 10) AS year,
	nypd_crimes.Latitude,
	nypd_crimes.Longitude,
	crime_types.offense_group
FROM
	nypd_crimes
	LEFT JOIN crime_types ON nypd_crimes.OFNS_DESC = crime_types.OFNS_DESC
WHERE
	substr(nypd_crimes.CMPLNT_FR_DT, 7, 10) = '2022'
	AND nypd_crimes.Latitude IS NOT NULL
	AND nypd_crimes.Longitude IS NOT NULL;
-- Calculate daily crime counts filtered between 2006-2022 and excluding crimes with missing locations
WITH daily_crime_counts AS (
	SELECT
		nypd_crimes.CMPLNT_FR_DT AS day,
		nypd_crimes.BORO_NM AS borough,
		crime_types.offense_group AS crime_type,
		nypd_crimes.BORO_NM || substr(nypd_crimes.CMPLNT_FR_DT, 7, 10) AS borough_year,
		count(*) AS total_crimes
	FROM
		nypd_crimes
		LEFT JOIN crime_types ON crime_types.OFNS_DESC = nypd_crimes.OFNS_DESC
	WHERE
		substr(nypd_crimes.CMPLNT_FR_DT, 7, 10) >= '2006'
		AND nypd_crimes.BORO_NM IS NOT NULL
	GROUP BY
		day,
		borough,
		crime_type
) 

-- Calculate crime rates based on populations
SELECT
	daily_crime_counts.day,
	daily_crime_counts.borough,
	daily_crime_counts.crime_type,
	daily_crime_counts.total_crimes,
	daily_crime_counts.total_crimes * 1.0 / population_boroughs.borough_population * 100000 AS crimes_per_100k_borough_residents,
	daily_crime_counts.total_crimes * 1.0 / population_boroughs.nyc_population * 100000 AS crimes_per_100k_nyc_residents
FROM
	daily_crime_counts
	LEFT JOIN population_boroughs ON daily_crime_counts.borough_year = population_boroughs.borough_year;

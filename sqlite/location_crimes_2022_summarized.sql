-- Groups crimes that occurred in 2022 by the zipcode and borough where they occured
-- Rename counties to their respective NYC borough names
WITH locations AS (
	SELECT
		year,
		zipcode,
		CASE
			WHEN county = 'New York' THEN 'Manhattan'
			WHEN county = 'Kings' THEN 'Brooklyn'
			WHEN county = 'Richmond' THEN 'Staten Island'
			ELSE county
		END AS borough,
		offense_group,
		count(*) AS total_crimes
	FROM
		location_crimes_2022
	WHERE
		length(zipcode) = 5
	GROUP BY
		year,
		county,
		zipcode,
		offense_group
) 
-- Join each grouped zipcode crime count to that zipcode's 2022 population and calculate a crime rate per 100k residents
SELECT
	locations.year,
	locations.zipcode,
	locations.total_crimes,
	locations.borough,
	locations.offense_group,
	populations.population,
	locations.total_crimes * 1.0 / populations.population * 100000 AS crimes_per_100k_borough_residents
FROM
	locations
	LEFT JOIN population_zipcode_2022 populations ON locations.zipcode = populations.zipcode;
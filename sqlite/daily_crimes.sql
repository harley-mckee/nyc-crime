-- group crimes by day and type
-- clean out crimes not between years 2006-2022 or crimes that are missing location
with crimes as (
	select 
		nypd_crimes.CMPLNT_FR_DT as day,
		nypd_crimes.BORO_NM as borough,
		nypd_crimes.LAW_CAT_CD as offense_level,
		nypd_crimes.OFNS_DESC as offense_description,
		nypd_crimes.BORO_NM || substr(CMPLNT_FR_DT, 7, 10) as borough_year,
		crime_types.offense_group as crime_type,
		count(*) as total_crimes
	from nypd_crimes
	left join crime_types 
		on crime_types.OFNS_DESC = nypd_crimes.OFNS_DESC
	where 
		substr(CMPLNT_FR_DT, 7, 10) >= '2006' 
		and BORO_NM <> '(null)'
	group by day, borough, offense_level, offense_description, crime_type
)

-- calculate borough- and NYC-level crime rates based on populations for that year
select
	crimes.day,
	crimes.borough,
	crimes.offense_level,
	crimes.offense_description,
	crimes.crime_type,
	crimes.total_crimes,
	crimes.total_crimes * 1.0 / population_boroughs.borough_population * 100000 as crimes_per_100k_borough_residents,
	crimes.total_crimes * 1.0 / population_boroughs.nyc_population * 100000 as crimes_per_100k_nyc_residents
from crimes
left join population_boroughs 
	on crimes.borough_year = population_boroughs.borough_year;

-- groups 2022 crimes by location
with locations as (
	select
        year, 
        zipcode, 
		case
			when county = 'New York' then 'Manhattan'
			when county = 'Kings' then 'Brooklyn'
			when county = 'Richmond' then 'Staten Island'
			else county
		end as borough,
		offense_group,
        count(*) as total_crimes
    from 
        location_crimes_2022
    where 
        length(zipcode) = 5
    group by 
        year, county, zipcode, offense_group
)

-- match zipcodes to 2022 populations and calculate crime rate per 100k residents in zipcode. Rename counties to their respective NYC borough names
select
    locations.year, 
    locations.zipcode, 
    locations.total_crimes, 
	locations.borough,
	locations.offense_group,
    populations.population, 
    locations.total_crimes * 1.0 / populations.population * 100000 as crimes_per_100k_borough_residents
from locations
left join population_zipcode_2022 populations
	on locations.zipcode = populations.zipcode;

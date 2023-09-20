-- pull select columns to match against geographic data in qgis software with spatial joins
select
	substr(nypd_crimes.CMPLNT_FR_DT, 7, 10) as year,
	nypd_crimes.Latitude,
	nypd_crimes.Longitude,
	nypd_crimes.BORO_NM,
	crime_types.offense_group
from
	nypd_crimes
left join
	crime_types
	on nypd_crimes.OFNS_DESC = crime_types.OFNS_DESC
where
	substr(nypd_crimes.CMPLNT_FR_DT, 7, 10) = '2022' and
	nypd_crimes.Latitude is not null and
	nypd_crimes.Longitude is not null;

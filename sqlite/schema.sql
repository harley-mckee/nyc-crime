CREATE TABLE "nypd_crimes" (
	"CMPLNT_NUM"	INTEGER,
	"CMPLNT_FR_DT"	TEXT,
	"CMPLNT_FR_TM"	TEXT,
	"CMPLNT_TO_DT"	TEXT,
	"CMPLNT_TO_TM"	TEXT,
	"ADDR_PCT_CD"	TEXT,
	"RPT_DT"	TEXT,
	"KY_CD"	INTEGER,
	"OFNS_DESC"	TEXT,
	"PD_CD"	INTEGER,
	"PD_DESC"	TEXT,
	"CRM_ATPT_CPTD_CD"	TEXT,
	"LAW_CAT_CD"	TEXT,
	"BORO_NM"	TEXT,
	"LOC_OF_OCCUR_DESC"	TEXT,
	"PREM_TYP_DESC"	TEXT,
	"JURIS_DESC"	TEXT,
	"JURISDICTION_CODE"	INTEGER,
	"PARKS_NM"	TEXT,
	"HADEVELOPT"	TEXT,
	"HOUSING_PSA"	TEXT,
	"X_COORD_CD"	TEXT,
	"Y_COORD_CD"	TEXT,
	"SUSP_AGE_GROUP"	TEXT,
	"SUSP_RACE"	TEXT,
	"SUSP_SEX"	TEXT,
	"TRANSIT_DISTRICT"	TEXT,
	"Latitude"	TEXT,
	"Longitude"	TEXT,
	"Lat_Lon"	TEXT,
	"PATROL_BORO"	TEXT,
	"STATION_NAME"	TEXT,
	"VIC_AGE_GROUP"	TEXT,
	"VIC_RACE"	TEXT,
	"VIC_SEX"	TEXT
)

CREATE TABLE "crime_types" (
	"OFNS_DESC"	TEXT,
	"Total_Complaints"	INTEGER,
	"Offense_Group"	TEXT
)

CREATE TABLE "location_crimes_2022" (
	"year"	INTEGER,
	"Latitude"	REAL,
	"Longitude"	REAL,
	"Offense_Group"	TEXT,
	"ZIPCODE"	INTEGER,
	"COUNTY"	TEXT
)

CREATE TABLE "population_boroughs" (
	"borough_year"	TEXT,
	"borough"	TEXT,
	"year"	INTEGER,
	"borough_population"	INTEGER,
	"nyc_population"	INTEGER
)

CREATE TABLE "population_zipcode_2022" (
	"zipcode"	INTEGER,
	"population"	INTEGER
)
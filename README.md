# NYC Crime Analysis Project

## Overview

**Background**

In early 2023, many New Yorkers talked about how much less safe the city was becoming. I wanted to investigate NYPD historical crime data myself to put context to contextualize recent changes and share more about recent trends and other learnings with greater nuance.

## Methodology

**SQLite Database and Tables:**

* Created SQLite database `nypd_crimes_db` to store tables relevant for analysis.
* `nypd_crimes`
  * Data from [NYPD Complaint Data Historic.](https://data.cityofnewyork.us/Public-Safety/NYPD-Complaint-Data-Historic/qgea-i56i)
  * Contains 8.35M valid felony, misdemeanor, and violation crimes reported to the New York City Police Department (NYPD) from 2006 to the end of 2022.
* `crime_types`
  * Re-classifies and groups the specific crime descriptions in the `OFNS_DESC` column into 11 more-easily analyzable `offense_group`s such as `Violent Crimes` and `Property Crimes`.
  * Groupings were carefully refined by referencing the New York State Penal Code and Uniform Crime Reporting System (UCR) classifications.
  * Used research and personal judgment to classify crime types in cases where no universal standard exists.
* `population_boroughs`
  *  Contains the `borough_population` for each year from 2000 to 2030 (predicted)
  *  Used linear interpolation with NY Census data to fill in yearly data points between the decennial census years where borough populations were recorded in 2000, 2010, 2020, 2030 (NYC government's population projection)
*  `zipcode_population`
	* Populations for each zip code in New York state in 2022 
	* Data sourced from [American Community Survey](https://github.com/harley-mckee/nyc-crime/assets/73152094/9a8fb590-62d6-40b7-b457-f262d633e926)


**Geographic Data Transformation and Analysis:**

* Used GIS software to associate latitude-longitude points with zip codes.
* Used QGIS software (Open Source Geographic Information System) with 2022 crime data to [match](https://docs.qgis.org/3.28/en/docs/user_manual/processing_algs/algs_include.html#geometric-predicates) crime latitude-longitude points to `zipcode` and `borough` data with GeoJSON file of [NYC zip code boundaries](https://data.cityofnewyork.us/Business/Zip-Code-Boundaries/i8iw-xf4u).
* Exported CSV file from QGIS with zip codes appended to each of 800,000 individual crime points to count crimes by zip code in SQLite.
* Joined New York zip code population data (sourced from the [American Community Survey](https://github.com/harley-mckee/nyc-crime/assets/73152094/9a8fb590-62d6-40b7-b457-f262d633e926)) with 2022 crimes grouped by `offense_group` and `zipcode`.
* Calculated a crime rate (`crimes_per_100k_zip_code_residents`) for each `zipcode` and `offense_group` grouping in 2022 by dividing the count of crimes by the zipcode population and multiplying by 100k.

**Data Cleaning with SQL:**

* Filtered out rows with invalid date data (`CMPLNT_FR_DT`).
* Filtered out null values for borough, hour of day, etc. when aggregating crimes for visualizations.

**Visualization and Analysis in Power BI:**

* Published the Power BI dashboard to web found [here](www.google.com).
* Visualized crime rates by crime type and adjusted groupings for clarity.
* Presented crimes by day of the week, month, and time of day.
* Used GIS software to associate latitude-longitude points with zip codes.
* Validated consistency between grouped SQL data and Power BI-transformed data.
* Segmented crime data analysis by type, following the UCR definitions.



**Quality Checks and Review:**

* Checked violent crime rates using raw database information.
* Ensured alignment with the UCR violent crime definitions.
* Reviewed relevant crime statistics and made adjustments based on UCR guidelines.


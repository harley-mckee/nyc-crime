# NYC Crime Analysis Project

## Overview

**Background**

In early 2023, many New Yorkers talked about how much less safe the city was becoming. I wanted to investigate NYPD historical crime data myself to put context to contextualize recent changes and share more about recent trends and other learnings with greater nuance.

_Share SQDBPRO file_

## Data

### 1. [NYPD Complaint Data Historic](https://data.cityofnewyork.us/Public-Safety/NYPD-Complaint-Data-Historic/qgea-i56i)
This dataset encompasses valid felony, misdemeanor, and violation crimes reported to the New York City Police Department (NYPD) from 2006 to the end of 2022.

### 2. [Zip Code Boundaries](https://data.cityofnewyork.us/Business/Zip-Code-Boundaries/i8iw-xf4u)
This dataset contains boundaries for NYC zip codes. Used for geographic referencing, mapping, and spatial analysis.

### 3. Population Data (New York)
Description

## Analysis process

**Created SQLite Database and Tables:**

* Created SQLite database `nypd_crimes_db` to store tables relevant for analysis.
* `nypd_crimes`
  * Contains all 8.35M CSV rows from [NYPD Complaint Data Historic](https://data.cityofnewyork.us/Public-Safety/NYPD-Complaint-Data-Historic/qgea-i56i)
* `crime_types`
  * Re-classifies and groups the specific crime descriptions in the `OFNS_DESC` column into 11 more-easily analyzable crime types such as `Violent Crimes` and `Property Crimes`.
  * Groupings were carefully refined by referencing the New York State Penal Code and Uniform Crime Reporting System (UCR) classifications.
  * Used research and personal judgment to classify crime types in cases where no universal standard exists.
* `population_boroughs`
  *  

**Data Preparation:**

* Utilized SQL for data extraction, including filtering and column dropping.
* Addressed inconsistencies in date columns, particularly with data pre-2006.
* Grouped data by borough, crime type (description), and year.
* Conducted table joins using SQL.
* Connected population data to aggregated complaints using Power BI.

**Data Cleaning and Aggregation:**

* Calculated crime rates with zipcode population data to normalize crime levels.
* Matched crime data with population data by zip code using Python's 'geopy' library.
* Grouped crime descriptions in a meaningful manner using the Code Interpreter.

**Visualization and Analysis:**

* Visualized crime rates by crime type and adjusted groupings for clarity.
* Presented crimes by day of the week, month, and time of day.
* Leveraged GIS software to associate latitude-longitude points with zip codes.
* Validated consistency between grouped SQL data and Power BI-transformed data.
* Segmented crime data analysis by type, following the UCR definitions.

**Optimization and Finalization:**

* Updated the SQL dataset in Power BI with the name NYC_Crime_Data.
* Adopted consistent SQL styling, including snake_case and keyword lowercase.
* Utilized QGIS and SQL to align zip codes, boroughs, and neighborhoods.
* Enhanced the analysis dashboard with slicers for flexible crime type viewing.

**Quality Checks and Review:**

* Checked violent crime rates using raw database information.
* Ensured alignment with the UCR violent crime definitions.
* Reviewed relevant crime statistics and made adjustments based on UCR guidelines.


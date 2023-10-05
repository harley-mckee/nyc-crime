# NYC Crime Analysis Project

## Overview

**Background**

During the pandemic, I heard many people in New York talking about how bad crime in New York had become. Having reading Enlightenment Now, by Steven Pinker, I felt the pessimism I encountered might be more reflective of a general cycnism about societal progress rather than an accurate depiction of the state of crime and what it meant for the future. So, I decided to investigate crime changes for myself: to put context to any pandemic increase and to understand overall trends with greater nuance. 

**Database Setup:**

* Established an SQLite database with proper data types.
* Formatted and prepared the database for data ingestion.
* Used pandas to create a filtered CSV file before conversion to the database.
* Established database schema and tables.

**Data Preparation:**

* Utilized SQL for data extraction, including filtering and column dropping.
* Addressed inconsistencies in date columns, particularly with data pre-2006.
* Grouped data by borough, crime type (description), and year.
* Conducted table joins using SQL.
* Connected population data to aggregated complaints using Power BI.

**Data Cleaning and Aggregation:**

* Verified data consistency between SQL, Power BI, and Python.
* Fixed inconsistencies like 'Staten Island' naming.
* Calculated crime rates for various crime levels using population data for normalization.
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

## Data

### 1. [NYPD Complaint Data Historic](https://data.cityofnewyork.us/Public-Safety/NYPD-Complaint-Data-Historic/qgea-i56i)
This dataset encompasses valid felony, misdemeanor, and violation crimes reported to the New York City Police Department (NYPD) from 2006 to the end of 2022.

### 2. [Zip Code Boundaries](https://data.cityofnewyork.us/Business/Zip-Code-Boundaries/i8iw-xf4u)
This dataset contains boundaries for NYC zip codes. Used for geographic referencing, mapping, and spatial analysis.

### 3. Population Data (New York)
Description

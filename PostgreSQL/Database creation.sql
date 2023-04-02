/*
That database created only for the additional practice on PostgreSQL
Of course it will be used later, but right now it is only makes work harder
 */

CREATE SCHEMA IF NOT EXISTS mvp_schema;

SET search_path TO mvp_schema;

CREATE TABLE IF NOT EXISTS countries (
	coutry_code char(3) /*ISO 3166-1 alpha-3*/ PRIMARY,
	country_name varchar(SELECT Length('the United Kingdom of Great Britain and Northern Ireland')) NOTNULL,
)

CREATE TABLE IF NOT EXISTS series_list (
	series_id serial PRIMARY KEY,
	series_name varchar(100) NOT NULL
);


CREATE TEMP TABLE coltable (
"country_code" varchar(100),
"series_name" varchar(100),
"country_name" varchar(100),
"2000" numeric,
"2001" numeric,
"2002" numeric,
"2003" numeric,
"2004" numeric,
"2005" numeric,
"2006" numeric,
"2007" numeric,
"2008" numeric,
"2009" numeric,
"2010" numeric,
"2011" numeric,
"2012" numeric,
"2013" numeric,
"2014" numeric,
"2015" numeric,
"2016" numeric,
"2017" numeric,
"2018" numeric,
"2019" numeric
);

CREATE TABLE IF NOT EXISTS "birth_rate_crude_(per_1000_people)" as SELECT * FROM coltable;


COPY "birth_rate_crude_(per_1000_people)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Birth rate, crude (per 1,000 people).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "control_of_corruption__percentile_rank" as SELECT * FROM coltable;


COPY "control_of_corruption__percentile_rank" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Control of Corruption  Percentile Rank.csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "death_rate_crude_(per_1000_people)" as SELECT * FROM coltable;


COPY "death_rate_crude_(per_1000_people)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Death rate, crude (per 1,000 people).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "domestic_general_government_health_expenditure_per_capita_(current_us$)" as SELECT * FROM coltable;


COPY "domestic_general_government_health_expenditure_per_capita_(current_us$)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Domestic general government health expenditure per capita (current US$).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "gdp_per_capita_(current_us$)" as SELECT * FROM coltable;


COPY "gdp_per_capita_(current_us$)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/GDP per capita (current US$).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "income_share_held_by_highest_10%" as SELECT * FROM coltable;


COPY "income_share_held_by_highest_10%" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Income share held by highest 10%.csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "land_surface_temperature" as SELECT * FROM coltable;


COPY "land_surface_temperature" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Land Surface Temperature.csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "life_expectancy_at_birth_female_(years)" as SELECT * FROM coltable;


COPY "life_expectancy_at_birth_female_(years)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Life expectancy at birth, female (years).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "life_expectancy_at_birth_male_(years)" as SELECT * FROM coltable;


COPY "life_expectancy_at_birth_male_(years)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Life expectancy at birth, male (years).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "life_expectancy_at_birth_total_(years)" as SELECT * FROM coltable;


COPY "life_expectancy_at_birth_total_(years)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Life expectancy at birth, total (years).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "social_contributions_(%_of_revenue)" as SELECT * FROM coltable;


COPY "social_contributions_(%_of_revenue)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Social contributions (% of revenue).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "suicide_mortality_rate_(per_100000_population)" as SELECT * FROM coltable;


COPY "suicide_mortality_rate_(per_100000_population)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Suicide mortality rate (per 100,000 population).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "suicide_mortality_rate_female_(per_100000_female_population)" as SELECT * FROM coltable;


COPY "suicide_mortality_rate_female_(per_100000_female_population)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Suicide mortality rate, female (per 100,000 female population).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "suicide_mortality_rate_male_(per_100000_male_population)" as SELECT * FROM coltable;


COPY "suicide_mortality_rate_male_(per_100000_male_population)" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Suicide mortality rate, male (per 100,000 male population).csv' 
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS "voice_and_accountability__percentile_rank" as SELECT * FROM coltable;


COPY "voice_and_accountability__percentile_rank" 
FROM  'C:/Users/baakh/OneDrive/Documents/GitHub/suicide-research/Data/WHO Datasets/Cleaned/Voice and Accountability  Percentile Rank.csv' 
DELIMITER ','
CSV HEADER;
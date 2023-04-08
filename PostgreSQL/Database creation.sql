/*
That database created only for the additional practice on PostgreSQL
Of course it will be used later, but right now it is only makes work harder
 */

/*
 * Also it would me much faster to do in Python directly, but I've decided to use
 * SQL file for practice
 */

-- Creation:

CREATE SCHEMA IF NOT EXISTS mvp_schema;

SET search_path TO mvp_schema;

CREATE TABLE IF NOT EXISTS countries (
	country_code char(3) /*ISO 3166-1 alpha-3*/ PRIMARY KEY,
	country_name varchar(100) NOT NULL
)

INSERT INTO countries VALUES
('ARG', 'Argentina'),
('AUT', 'Austria'),
('BLR', 'Belarus'),
('BEL', 'Belgium'),
('CRI', 'Costa Rica'),
('DNK', 'Denmark'),
('DOM', 'Dominican Republic'),
('SLV', 'El Salvador'),
('FIN', 'Finland'),
('GRC', 'Greece'),
('LUX', 'Luxembourg'),
('MDA', 'Moldova'),
('NOR', 'Norway'),
('PER', 'Peru'),
('RUS', 'Russian Federation'),
('SWE', 'Sweden'),
('THA', 'Thailand'),
('USA', 'United States');


CREATE TABLE IF NOT EXISTS series_list (
	series_id serial PRIMARY KEY,
	series_name varchar(100) NOT NULL
);

INSERT INTO series_list ("series_name") VALUES
('Birth rate, crude (per 1,000 people)'),
('Control of Corruption  Percentile Rank'),
('Death rate, crude (per 1,000 people)'),
('Domestic general government health expenditure per capita (current US$)'),
('GDP per capita (current US$)'),
('Income share held by highest 10%'),
('Land Surface Temperature'),
('Life expectancy at birth, female (years)'),
('Life expectancy at birth, male (years)'),
('Life expectancy at birth, total (years)'),
('Social contributions (% of revenue)'),
('Suicide mortality rate (per 100,000 population)'),
('Suicide mortality rate, female (per 100,000 female population)'),
('Suicide mortality rate, male (per 100,000 male population)'),
('Voice and Accountability  Percentile Rank');

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

-- Import datasets:

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

-- Change series name to series_id

UPDATE "birth_rate_crude_(per_1000_people)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "birth_rate_crude_(per_1000_people)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "birth_rate_crude_(per_1000_people)"
RENAME COLUMN series_name TO series_id;

UPDATE "control_of_corruption__percentile_rank" set series_name = 'Control of Corruption  Percentile Rank';

UPDATE "control_of_corruption__percentile_rank" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "control_of_corruption__percentile_rank" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "control_of_corruption__percentile_rank"
RENAME COLUMN series_name TO series_id;

UPDATE "death_rate_crude_(per_1000_people)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "death_rate_crude_(per_1000_people)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "death_rate_crude_(per_1000_people)"
RENAME COLUMN series_name TO series_id;

UPDATE "domestic_general_government_health_expenditure_per_capita_(current_us$)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "domestic_general_government_health_expenditure_per_capita_(current_us$)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "domestic_general_government_health_expenditure_per_capita_(current_us$)"
RENAME COLUMN series_name TO series_id;

UPDATE "gdp_per_capita_(current_us$)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "gdp_per_capita_(current_us$)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "gdp_per_capita_(current_us$)"
RENAME COLUMN series_name TO series_id;

UPDATE "income_share_held_by_highest_10%" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "income_share_held_by_highest_10%" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "income_share_held_by_highest_10%"
RENAME COLUMN series_name TO series_id;

UPDATE "land_surface_temperature" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "land_surface_temperature" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "land_surface_temperature"
RENAME COLUMN series_name TO series_id;

UPDATE "life_expectancy_at_birth_female_(years)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "life_expectancy_at_birth_female_(years)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "life_expectancy_at_birth_female_(years)"
RENAME COLUMN series_name TO series_id;

UPDATE "life_expectancy_at_birth_male_(years)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "life_expectancy_at_birth_male_(years)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "life_expectancy_at_birth_male_(years)"
RENAME COLUMN series_name TO series_id;

UPDATE "life_expectancy_at_birth_total_(years)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "life_expectancy_at_birth_total_(years)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "life_expectancy_at_birth_total_(years)"
RENAME COLUMN series_name TO series_id;

UPDATE "social_contributions_(%_of_revenue)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "social_contributions_(%_of_revenue)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "social_contributions_(%_of_revenue)"
RENAME COLUMN series_name TO series_id;

UPDATE "suicide_mortality_rate_(per_100000_population)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "suicide_mortality_rate_(per_100000_population)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "suicide_mortality_rate_(per_100000_population)"
RENAME COLUMN series_name TO series_id;

UPDATE "suicide_mortality_rate_female_(per_100000_female_population)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "suicide_mortality_rate_female_(per_100000_female_population)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "suicide_mortality_rate_female_(per_100000_female_population)"
RENAME COLUMN series_name TO series_id;

UPDATE "suicide_mortality_rate_male_(per_100000_male_population)" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "suicide_mortality_rate_male_(per_100000_male_population)" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "suicide_mortality_rate_male_(per_100000_male_population)"
RENAME COLUMN series_name TO series_id;

UPDATE "voice_and_accountability__percentile_rank" set series_name = 'Voice and Accountability  Percentile Rank';

UPDATE "voice_and_accountability__percentile_rank" SET series_name = snum.min
FROM (SELECT min(series_id)  FROM "voice_and_accountability__percentile_rank" ds
LEFT JOIN series_list sl
ON sl.series_name = ds.series_name
GROUP BY ds.series_name) snum;

ALTER TABLE "voice_and_accountability__percentile_rank"
RENAME COLUMN series_name TO series_id;

/* Yes, we could union and change type later
 * But this way it could be much easier to debug
 */

ALTER TABLE "birth_rate_crude_(per_1000_people)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "control_of_corruption__percentile_rank"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "death_rate_crude_(per_1000_people)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "domestic_general_government_health_expenditure_per_capita_(current_us$)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "gdp_per_capita_(current_us$)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "income_share_held_by_highest_10%"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "land_surface_temperature"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "life_expectancy_at_birth_female_(years)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "life_expectancy_at_birth_male_(years)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "life_expectancy_at_birth_total_(years)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "social_contributions_(%_of_revenue)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "suicide_mortality_rate_(per_100000_population)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "suicide_mortality_rate_female_(per_100000_female_population)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "suicide_mortality_rate_male_(per_100000_male_population)"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

ALTER TABLE "voice_and_accountability__percentile_rank"
ALTER COLUMN series_id TYPE integer USING series_id::integer,
ALTER COLUMN country_code TYPE varchar(4) USING country_code::varchar(4);

-- Sum all tables:

CREATE TABLE mvp_dataset AS 
SELECT * FROM (
SELECT * FROM "birth_rate_crude_(per_1000_people)"
UNION ALL
SELECT * FROM "control_of_corruption__percentile_rank"
UNION ALL
SELECT * FROM "death_rate_crude_(per_1000_people)"
UNION ALL
SELECT * FROM "domestic_general_government_health_expenditure_per_capita_(current_us$)"
UNION ALL
SELECT * FROM "gdp_per_capita_(current_us$)"
UNION ALL
SELECT * FROM "income_share_held_by_highest_10%"
UNION ALL
SELECT * FROM "land_surface_temperature"
UNION ALL
SELECT * FROM "life_expectancy_at_birth_female_(years)"
UNION ALL
SELECT * FROM "life_expectancy_at_birth_male_(years)"
UNION ALL
SELECT * FROM "life_expectancy_at_birth_total_(years)"
UNION ALL
SELECT * FROM "social_contributions_(%_of_revenue)"
UNION ALL
SELECT * FROM "suicide_mortality_rate_(per_100000_population)"
UNION ALL
SELECT * FROM "suicide_mortality_rate_female_(per_100000_female_population)"
UNION ALL
SELECT * FROM "suicide_mortality_rate_male_(per_100000_male_population)"
UNION ALL
SELECT * FROM "voice_and_accountability__percentile_rank"
)a;

-- Delete extensive info

ALTER TABLE mvp_dataset DROP COLUMN country_name;

-- Add keys

ALTER TABLE mvp_dataset
ADD PRIMARY KEY (series_id, country_code),
ADD CONSTRAINT series_const FOREIGN KEY (series_id) REFERENCES series_list (series_id),
ADD CONSTRAINT country_const FOREIGN KEY (country_code) REFERENCES countries (country_code);
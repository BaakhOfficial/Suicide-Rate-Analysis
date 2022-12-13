set search_path to suicide;

-- Here we'll try to use SQL for research. Our  possibilities aren't endless here, so let's use what we can
-- Looking on USA clear statistics without any separation

select country, year, sum(suicides_no) as suicides_no, sum(population) as population 
from who_suicide_statistics wss
where country = 'United States of America'
group by country, year;

-- Amount of suicides grows, but population also, so we're need percentage

select country, year, sum(suicides_no) as suicides_no, sum(population) as population,
	round(sum(suicides_no) * 100./sum(population), 4) as suicides_in_population
from who_suicide_statistics wss
where country = 'United States of America'
group by country, year;

-- 2015 had worst suicide rate from period of observation
-- We can see that suicide rate grows. But how exactly? Who is dying more now than 20 years ago?
-- Is it for every group? Let's look. We will start from sex

-- Create a view for ease of use
create or replace view usa_sex_dependency_v as
select f.country, f.year,
-- calculations
	round(100 - m.male_population * 100./f.female_population, 3) as "population_dif_in_perc",
	round(100 - lag(f.suicides_in_population) over (order by f.year) * 100/f.suicides_in_population, 3) as fe_change_in_perc,
	round(100 - lag(m.suicides_in_population) over (order by f.year) * 100/m.suicides_in_population, 3) as m_change_in_perc,
	round(m.suicides_in_population/f.suicides_in_population, 2) as times_male_likely_die,
	f.suicides_in_population as f_suicides_in_population_perc,
	m.suicides_in_population as m_suicides_in_population_perc,
-- female data
	f.sex as f_sex, f.suicides_no as f_suicides_no, f.female_population,
-- male data
	m.sex as m_sex, m.suicides_no as m_suicides_no, m.male_population
from
	(select country, year, sex, sum(suicides_no) as suicides_no, sum(population) as female_population,
		round(sum(suicides_no) * 100./sum(population), 5)as suicides_in_population
	from who_suicide_statistics wss
	where country = 'United States of America' and sex = 'female'
	group by country, year, sex) as f
join
	(select country, year, sex, sum(suicides_no) as suicides_no, sum(population) as male_population,
		round(sum(suicides_no) * 100./sum(population), 5) as suicides_in_population
	from who_suicide_statistics wss
	where country = 'United States of America' and sex = 'male'
	group by country, year, sex) as m on f.country = m.country and f.year = m.year;

select * from usa_sex_dependency_v usdv;

-- We have to find exact numbers

select
	min(times_male_likely_die), max(times_male_likely_die)
from usa_sex_dependency_v usdv;

-- Insights:
-- 1) Female population in USA is almost always bigger than male.But that trend is going down
-- 2) I think something happened in 1986 for everyone, 1981 for females, 2004 for females, 2011. needs further research
-- 3) Male have 3.11-4.52 times more likelyhood of death from suicide. Although that difference is slowly creeping down
-- 4) Amount of female suicide is growing from 90's much faster, than male suicide

-- Now we will check age difference

select *
from who_suicide_statistics wss 
where country = 'United States of America' 

select *
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '5-14'

select *
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '15-24'

select *
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '25-34'

select *
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '35-54'

select *
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '55-74'

select *
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '75+'

select country, year, sum(suicides_no) as suicides_no, sum(population) as population,
		round(sum(suicides_no) * 100./sum(population), 5)as suicides_in_population
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '5-14'
group by country, year, age_gap

select country, year, sum(suicides_no) as suicides_no, sum(population) as population,
		round(sum(suicides_no) * 100./sum(population), 5)as suicides_in_population
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '15-24'
group by country, year, age_gap

select country, year, sum(suicides_no) as suicides_no, sum(population) as population,
		round(sum(suicides_no) * 100./sum(population), 5)as suicides_in_population
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '25-34'
group by country, year, age_gap

select country, year, sum(suicides_no) as suicides_no, sum(population) as population,
		round(sum(suicides_no) * 100./sum(population), 5)as suicides_in_population
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '35-54'
group by country, year, age_gap

select country, year, sum(suicides_no) as suicides_no, sum(population) as population,
		round(sum(suicides_no) * 100./sum(population), 5)as suicides_in_population
from who_suicide_statistics wss 
where country = 'United States of America' and age_gap = '75+'
group by country, year, age_gap

-- 1) At the age of 5-14 more males than females. In the range from 15 to 74 years difference in population almost neglegable
-- But there's almost twice more women in age 75+ then man
-- 2) Since 2007 suicides from 5 to 14 years multiplied up to 2 times.
-- 3) At 75+ suicide rate growing very slowly
-- 4) 1999 - 2004 are the best years in our statistic in every age group or sex category
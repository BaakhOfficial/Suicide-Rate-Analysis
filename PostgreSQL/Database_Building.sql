set search_path to suicide;

-- Check if everything imported correctly
-- We'll start building our database on WHO Suicide Statistics, later will add more datasets

select * from who_suicide_statistics wss;

-- It was imported so table have no constraints or external tables so let's work on it
-- Natural primary key here will be a country + year + sex + age so let's set it up

alter table who_suicide_statistics  add primary key (country, year, sex, age);

-- We are need some checks and foreign constraints
-- Let's start with counries table

create table countries (
country_id serial primary key,
country varchar(50) not null unique);

-- Insert all countries we are have

insert into countries (country)
select country 
from who_suicide_statistics
group by country;

-- Let's check everything is fine

select * from countries;

--Now we have to create foreign key for that table

alter table who_suicide_statistics add foreign key (country) references countries (country);

-- For a year, age and sex we will create "check" constraints.
-- We will not go before 1500 i think and after now, and use biological sex as gender here

alter table who_suicide_statistics add check (year between 1500 and date_part('year', now()));

alter table who_suicide_statistics add check (sex in ('female', 'male'));

-- Also we will use same age separation as our table, just for ease of use
-- but it will be much easier to use it without word years at the end

alter table who_suicide_statistics rename column "age" to "age_gap";

update who_suicide_statistics
set age_gap = split_part(age_gap, ' ', 1);

-- maybe later i'll split age_gap in two columns if needed
-- that way i'll have data about which age is minimum and maximum in my sample
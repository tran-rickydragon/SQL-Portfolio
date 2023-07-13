--source: https://ourworldindata.org/covid-deaths
--data from Jan 2020 - July 2023

--QUERIES FOR TABLEAU PROJECT

--death count by continents
select location, population, max(total_cases) as total_cases, max(total_deaths) as total_deaths, ((max(total_deaths)/population)*100) as DeathPercentage
from deaths
where continent is null
and (location like '%North America%'
or location like '%South America%'
or location like '%Europe%'
or location like '%Asia%'
or location like '%Africa%'
or location like '%Oceania%'
or location like '%World%')
and location not like '%Union%'
group by location, population
order by total_deaths desc;

--Looking at countries with high infection rates compared to population
select location, population, max(total_cases) as highest_cases, ((max(total_cases)/population)*100) as CasePercentage
from deaths
where continent is not null
group by location, population
order by CasePercentage desc;

select location, population, date, max(total_cases) as highest_cases, ((max(total_cases)/population)*100) as CasePercentage
from deaths
where continent is not null
group by location, population, date
order by CasePercentage desc;

--Looking at countries with high death rates compared to population
select location, population, max(total_deaths) as total_deaths, max((total_deaths/population)*100) as DeathPercentage
from deaths
where continent is not null
group by location, population
order by DeathPercentage desc;

select location, population, date, max(total_deaths) as total_deaths, max((total_deaths/population)*100) as DeathPercentage
from deaths
where continent is not null
group by location, population, date
order by DeathPercentage desc;

--total country population vs total vaccinations
select d.location, d.population, (max(v.people_fully_vaccinated)) as people_fully_vaccinated, ((max(v.people_fully_vaccinated)/d.population)*100) as VaccincationPercentage
from deaths d
join vaccinations v
on d.location = v.location
and d.population = v.population
and d.continent is not null
group by d.location, d.population
order by VaccincationPercentage desc;


--


use covid;

--lets see if we can pull the data we want from the deaths table
select location, date, total_cases, new_cases, total_deaths, population
from deaths
order by 1, 2;

--total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from deaths
order by 1, 2;

--shows likelihood of death if you contract covid in the USA
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from deaths
where location like '%states%'
order by 1, 2;

--Looking at total cases vs population in the USA
select location, date, population, total_cases, (total_cases/population)*100 as CasePercentage
from deaths
where location like '%states%'
order by 1, 2;


--LETS LOOK AT GLOBAL NUMBERS 

--death count by continents
select location, population, max(total_deaths) as total_deaths
from deaths
where continent is null
and (location like '%North America%'
or location like '%South America%'
or location like '%Europe%'
or location like '%Asia%'
or location like '%Africa%'
or location like '%Oceania%'
or location like '%World%')
group by location, population
order by total_deaths desc;

--death count by income
select location, population, max(total_deaths) as total_deaths, max((total_deaths/population)*100) as DeathPercentage
from deaths
where continent is null
and location like '%income%'
group by location, population
order by DeathPercentage desc;

--global cases and death percentage
select location, population, sum(new_cases) as total_cases, (sum(new_deaths)/sum(new_cases))*100 as DeathPercentage
from deaths
where continent is null
and location like '%World%'
group by location, population;


--LETS LOOK AT NUMBERS BY COUNTRY

--countries and their death count
select location, population, max(total_deaths) as total_deaths
from deaths
where continent is not null
group by location, population
order by total_deaths desc;

--Looking at countries with high infection rates compared to population
select location, population, max(total_cases) as highest_cases, ((max(total_cases)/population)*100) as CasePercentage
from deaths
group by location, population
order by CasePercentage desc;

--Looking at countries with high death rates compared to population
select location, population, max(total_deaths) as total_deaths, max((total_deaths/population)*100) as DeathPercentage
from deaths
where continent is not null
group by location, population
order by DeathPercentage desc;


--Lets JOIN the deaths and vaccinations tables
select * from deaths d
join vaccinations v
on d.location = v.location
and d.date = v.date

--total population vs vaccinations
select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rolling_total_vaccinations
from deaths d
join vaccinations v
on d.location = v.location
and d.date = v.date
and d.continent is not null
order by 2, 3;

--total population vs total vaccinations
select d.location, d.population, (max(v.people_fully_vaccinated)) as people_fully_vaccinated, ((max(v.people_fully_vaccinated)/d.population)*100) as VaccincationPercentage
from deaths d
join vaccinations v
on d.location = v.location
and d.population = v.population
and d.continent is not null
group by d.location, d.population
order by VaccincationPercentage desc;

select location, population total_vaccinations from vaccinations
where location like '%Gibraltar%';

--USE CTE
with Pop_vs_Vacc (continent, location, date, population, new_vacinations, rolling_total_vaccinations)
as
(
select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rolling_total_vaccinations
from deaths d
join vaccinations v
on d.location = v.location
and d.date = v.date
and d.continent is not null
--order by 2, 3
)
select *, ((rolling_total_vaccinations/population)*100) as vaccinationPercentage
from Pop_vs_Vacc
;

-- Temp table
drop table if exists PercentPopulationVaccinated
create table PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date date,
population float,
new_vaccinations float,
rolling_total_vaccinations float
)

insert into PercentPopulationVaccinated
select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rolling_total_vaccinations
from deaths d
join vaccinations v
on d.location = v.location
and d.date = v.date
--d.continent is not null
--order by 2, 3


--Create view to store data
create view PercentPopulationVaccinated_View as 
select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(v.new_vaccinations) over (partition by d.location order by d.location, d.date) as rolling_total_vaccinations
from deaths d
join vaccinations v
on d.location = v.location
and d.date = v.date
and d.continent is not null;
--order by 2, 3
create database jobs_in_data;
use jobs_in_data;

create table jobs_data(
work_year year ,
job_title varchar(250),
job_category varchar(250),
salary_currency varchar(250),
salary int,
salary_in_USD int,
employee_residence varchar(250),
experience_level varchar(250),
employement_type varchar(250),
work_setting varchar(250),
company_location varchar(250),
company_size varchar(5));


-- Let's analyze the data columnwise

-- How many distinct years are present in dataset

select distinct(work_year) from jobs_data;

-- How many job titles are recorded for each distinct year in the dataset.

select distinct(work_year) as Year , count(job_title) as Number_of_Jobs from jobs_data
group by 1;

--  salary statistics (average, minimum, and maximum salaries) for each distinct year in the dataset.

select distinct(work_year) as Year , round(avg(salary),0) as Average_salary , min(salary) as Minimum_salary, 
max(salary) as Maximum_salary
from jobs_data
group by 1;

select distinct(work_year) as Year , round(avg(salary_in_USD),0) as Average_salary_in_USD , min(salary_in_USD) as Minimum_salary_in_USD, 
max(salary_in_USD) as Maximum_salary_in_USD
from jobs_data
group by 1;

-- How many job titles are recorded in each job category

select distinct(job_category),count(job_title) as total_jobs_by_category from jobs_data
group by 1;

-- How many jobs are available based on experience level of employees in dataset

select distinct(experience_level),count(job_title) as total_jobs_by_category from jobs_data
group by 1;

-- Detailed breakdown of how many job entries exist for each employment type within each distinct year 

select work_year,employement_type, count(*) as Type_count
from jobs_data
group by 1,2
order by 1 asc;

-- Summary of total jobs available in each country

select distinct(company_location) as Company_Location , count(job_title) as Total_Jobs_by_Country
from jobs_data
group by 1
order by 2 desc;

-- Currency in which employees gets their salaries

select distinct(salary_currency) , count(*) from jobs_data
group by 1;
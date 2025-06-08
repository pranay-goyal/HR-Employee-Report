use project;
set sql_safe_updates=0;
-- QUESTIONS

-- 1. What is the gender breakdown of employees in the company?
select count(gender), gender 
from hr
where age>=18 and termdate is null
group by gender;


-- 2. What is the race/ethinity breakdown of employees in the company?
select count(race) as count ,race
from hr
where age>=18 and termdate is null
group by race
order by count desc;


-- 3. What is the age distribution of employees in the company?

select 
case
	when age>=18 and age<=24 then '18-24'
	when age>=25 and age<=34 then '25-34'
    when age>=35 and age<=44 then '35-44'
    when age>=45 and age<=54 then '45-54'
    when age>=55 and age<=60 then '55-60'
	else '65+'
end as age_group,
count(age) as count
from hr
where age>=18 and termdate is null
group by age_group
order by age_group;

select 
case
	when age>=18 and age<=24 then '18-24'
	when age>=25 and age<=34 then '25-34'
    when age>=35 and age<=44 then '35-44'
    when age>=45 and age<=54 then '45-54'
    when age>=55 and age<=60 then '55-60'
	else '65+'
end as age_group,gender,
count(age) as count
from hr
where age>=18 and termdate is null
group by age_group,gender
order by age_group,gender;

-- 4. How many employees work at headquarters v/s remote location?
select count(location) as count,location
from hr
where age>=18 and termdate is null
group by location;

-- 5. What is the average length of employment for employees who have been terminated?
select round(avg(datediff(termdate,hire_date))/365,0) as avg_length_employement 
from hr
where age>=18 and termdate is not null and termdate<=curdate();

-- 6. How does gender distribution vary accross department and job titles?
select department,gender,count(*) as count
from hr
where age>=18 and termdate is null
group by department,gender
order by department;

-- 7. What is the distribution of job title across the company?
select count(jobtitle) as count,jobtitle
from hr
where age>=18 and termdate is null
group by jobtitle
order by jobtitle desc;


-- 8. Which department has the highest turnover rate?
select department,total_count, terminated_count, terminated_count/total_count as termination_rate
from(
	select department, count(*) as total_count,
    sum(case when termdate is not null and termdate<=curdate() then 1 else 0 end) as terminated_count
    from hr
    where age>=18 
    group by department
    ) as subquery
order by termination_rate desc;

-- 9. what is the distribution of employees across location by city and state?
select count(*) as count , location_state
from hr
where age>=18 and termdate is null
group by location_state
order by count desc;

-- 10. How has the company employee count changed over time based on hire and term date?
select year,
	hires, 
	terminations, 
    hires-terminations as net_change,
    round((hires-terminations)/hires*100, 2) as net_change_precent
from (
	select year(hire_date) as year,
    count(*) as hires,
    sum(case when termdate is not null and termdate<=curdate() then 1 else 0 end) as terminations
    from hr
    where age>=18
    group by (hire_date)
    ) as subquery
order by year asc;
    

-- 11. What is tenure distribution for each department?
select department, round(avg(datediff(termdate,hire_date))/365, 0) as avg_tenure
from hr 
where termdate is not null and termdate<=curdate() and age>=18
group by department 
order by avg_tenure desc;
create database project;
use project

select * from hr;

alter table hr
change column id emp_id varchar(20) NULL;

set sql_safe_updates=0;	

describe hr;

update hr
set birthdate=case
	when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    else null
    end;

alter table hr
modify column birthdate date;

select birthdate from hr;


update hr
set hire_date=case
	when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    else null
    end;

alter table hr
modify column hire_date date;

select hire_date from hr;

UPDATE hr
SET termdate = CASE
    WHEN termdate IS NULL OR termdate = '' THEN NULL
    ELSE DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
END;


select termdate from hr;

alter table hr
modify column termdate date;

alter table hr add column age int;
update hr
set age=timestampdiff(year,birthdate,curdate());

select birthdate,age from hr;



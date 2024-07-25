show tables;
-- 1. checking the null values 
select * from covid2;
SELECT * FROM covid2 WHERE  Confirmed is null or Deaths is null  or
Province is null or Country_Region is null or Latitude is null or Longitude is null or 
Date1 is null or Recovered is null;
-- 2. cheking of number of rows
select count(*) from covid2;
-- 3. checking of start date and end date 
SELECT *
FROM covid2
WHERE date1 between '23-01-2021' AND '25-02-2021';
-- 4.Number of month present in dataset
SELECT COUNT(MONTH(date1)) AS num_of_months
FROM covid2;
-- 5.Find monthly average for confirmed, deaths, recovered
SELECT YEAR(date1) AS year,
MONTH(date1) AS month,
AVG(deaths), avg(Confirmed) , avg(recovered) AS monthly_average
FROM covid2 GROUP BY YEAR(date1), MONTH(date1);
-- 7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT 
    YEAR(date1) AS year,
    MONTH(date1) AS month,
    MAX(Confirmed) AS most_frequent_confirmed,
    MAX(Deaths) AS most_frequent_deaths,
    MAX(Recovered) AS most_frequent_recovered
FROM 
    covid2
GROUP BY 
    YEAR(date1),
    MONTH(date1);
-- 8. Find minimum values for confirmed, deaths, recovered per year

SELECT YEAR(date1) AS year,
       MIN(Confirmed) AS min_confirmed,
       MIN(Deaths) AS min_deaths,
       MIN(Recovered) AS min_recovered
FROM covid2
GROUP BY YEAR(date1);
-- 9.Find maximum values of confirmed, deaths, recovered per year
SELECT YEAR(date1) AS year,
       MIN(Confirmed) AS min_confirmed,
       MIN(Deaths) AS min_deaths,
       MIN(Recovered) AS min_recovered
FROM covid2
GROUP BY YEAR(date1);
-- 10.The total number of case of confirmed, deaths, recovered each month

SELECT YEAR(date1) AS year,
       MONTH(date1) AS month,
       SUM(Confirmed) AS total_confirmed,
       SUM(Deaths) AS total_deaths,
       SUM(Recovered) AS total_recovered
FROM covid2
GROUP BY YEAR(date1), MONTH(date1)
ORDER BY YEAR(date1), MONTH(date1);

-- 11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT 
    COUNT(*) AS total_cases,
    AVG(Confirmed) AS average_confirmed,
    VARIANCE(Confirmed) AS variance_confirmed,
    STDDEV(Confirmed) AS stdev_confirmed
FROM covid2;
-- 12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT 
    YEAR(date1) AS year,
    MONTH(date1) AS month,
    COUNT(*) AS total_cases,
    AVG(Deaths) AS average_deaths,
    VARIANCE(Deaths) AS variance_deaths,
    STDDEV(Deaths) AS stdev_deaths
FROM covid2
GROUP BY YEAR(date1), MONTH(date1)
ORDER BY YEAR(date1), MONTH(date1);

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    YEAR(date1) AS year,
    MONTH(date1) AS month,
    COUNT(*) AS total_cases,
    AVG(Recovered) AS average_recovered,
    VARIANCE(Recovered) AS variance_recovered,
    STDDEV(Recovered) AS stdev_recovered
FROM covid2
GROUP BY YEAR(date1), MONTH(date1)
ORDER BY YEAR(date1), MONTH(date1);

-- Q14. Find Country having highest number of the Confirmed case
SELECT province, MAX(Confirmed) AS highest_confirmed_cases
FROM covid2
GROUP BY province
ORDER BY highest_confirmed_cases DESC
LIMIT 1;

-- Q15. Find Country having lowest number of the death case

SELECT province, MIN(Deaths) AS lowest_death_cases
FROM covid2
GROUP BY province
ORDER BY lowest_death_cases ASC
LIMIT 1;

-- 16. Find top 5 countries having highest recovered case
SELECT province, SUM(Recovered) AS total_recovered_cases
FROM covid2
GROUP BY province
ORDER BY total_recovered_cases
desc LIMIT 5;

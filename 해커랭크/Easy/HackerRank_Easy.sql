-- Revising the Select Query I
-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

select * 
from city 
where countrycode = 'USA' and population > 100000

-- Revising the Select Query II
-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

select name
from city
where countrycode = 'USA' and population > 120000

-- Query a list of CITY names from Station for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
-- STATION 테이블에서 ID가 짝수이면서 CITY 이름이 중복되지 않는 CITY 이름을 출력하는 문제입니다.

select distinct city
from station
where (id % 2) = 0

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. The STATION table is described as follows:
-- STATION 테이블에서 전체 CITY 수 - 중복되지 않는 CITY 수를 구하는 문제입니다.
select count(city) - count(distinct city)
from station

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
-- CITY에서 가장 짧은 이름을 가진 데이터와 가장 긴 이름을 가진 데이터에 접근해라. 만약 조건에 해당하는 데이터가 하나 이상일 경우, 알파벳 순으로 가장 먼저 위치한 데이터를 선택한다.
select city, length(city)
from station
order by length(city) asc, city asc
limit 1;    -- limit : 개수 제한

select city, length(city)
from station
order by length(city) desc, city desc
limit 1;

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
-- CITY에서 모음으로 시작하는 모든 이름을 찾아 출력하라. 단, 중복은 허용하지 않는다.
select distinct city
from station
where (city like 'a%'   -- a로 시작하는 string
      or city like 'e%'
      or city like 'i%'
      or city like 'o%'
      or city like 'u%');

select distinct city
from station
where city regexp '^[aeiou]'    -- regexp: 정규 표현식, ^: 시작하는 문자열, []: 안에 나열된 패턴에 해당하는 문자열 

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')    -- left(문자열, 길이) : 문자열을 받아서 왼쪽부터 원하는 길이만큼 잘라낸 후 리턴하는 함수

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct city
from station
where city like '%a'
        or city like '%e'
        or city like '%i'
        or city like '%o'
        or city like '%u'

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')
and right(city, 1) in ('a', 'e', 'i', 'o', 'u');

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city
from station
where city regexp '^[^aeiou]'

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
select distinct city
from station
where city not regexp '[aeiou]$'

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
select distinct city
from station
where city regexp '^[^aeiou]' or city regexp '[^aeiou]$'

select distinct city
from station
where left(city,1) not in ('a','e','i','o','u')
or right(city,1) not in ('a','e','i','o','u')

--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select distinct city
from station
where left(city,1) not in ('a','e','i','o','u')
and right(city,1) not in ('a','e','i','o','u')

-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
select name
from students  
where marks > 75
order by right(name, 3), ID

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
select name
from employee
order by name

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
select name
from employee
where months < 10 and salary > 2000
order by employee_id asc

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
select
      case
            when A = B and B = C then "Equilateral"
            when A + B <= C then "Not A Triangle"
            when A != B and B != C and A != C then "Scalene"
            else "Isosceles"
      end
from triangles

-- Query a count of the number of cities in CITY having a Population larger than 1000000.
select count(*)
from city
where population > 100000

-- Query the total population of all cities in CITY where District is California.
select sum(population)
from city
where district = 'California'

-- Query the average population of all cities in CITY where District is California.
select avg(population)
from city
where district = 'California'

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
select round(avg(population))
from city

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
select sum(population)
from city
where countrycode = 'JPN'

-- Query the difference between the maximum and minimum populations in CITY.
select max(population) - min(population)
from city

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
      -- ceil(숫자) : 올림
      -- round(숫자, 자릿수) : 반올림
      -- truncate(숫자, 자릿수) : 내림
      -- floor(숫자) : 소수점 아래 버림
      -- abs(숫자) : 절댓값
      -- pow(x, y) : x의 y승
      -- mod(x, y) : x를 y로 나눈 나머지
      -- replace('문자열', '기존의 변경될 문자열', '변경할 문자열')
select ceil(avg(salary) - avg(replace(salary, 0, '')))
from employees

-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
select (salary * months) as earnings, count(*)
from employee
group by earnings
order by earnings desc limit 1

-- Query the following two values from the STATION table:
-- 1. The sum of all values in LAT_N rounded to a scale of  decimal places.
-- 2. The sum of all values in LONG_W rounded to a scale of  decimal places.
select round(sum(LAT_N), 2), round(sum(LONG_W), 2)
from station

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.
select truncate(sum(LAT_N), 4)
from station
where 38.7880 < LAT_N and LAT_N < 137.2345

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.
select truncate(LAT_N, 4)
from station
where LAT_N < 137.2345
order by LAT_N desc limit 1

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.
select round(LONG_W, 4)
from station
where LAT_N < 137.2345
order by LAT_N desc limit 1

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.
select round(LAT_N, 4)
from station
where LAT_N > 38.7780
order by LAT_N limit 1

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.
select round(LONG_W, 4)
from station
where LAT_N > 38.7780
order by LAT_N limit 1

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
select name
from city
where population > 120000
and countrycode = 'USA'

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
select sum(a.population)
from city a, country b
where a.countrycode = b.code
and b.continent = 'ASIA'

select sum(a.population)
from city a
join country b on a.countrycode = b.code
where b.continent = 'ASIA'

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
select a.name
from city a, country b
where a.countrycode = b.code
and b.continent = 'Africa'

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
select b.continent, floor(avg(a.population))
from city a, country b
where a.countrycode = b.code
group by b.continent

-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
-- * * * * * 
-- * * * * 
-- * * * 
-- * * 
-- *
-- Write a query to print the pattern P(20).
set @number = 21;
select repeat('* ', @number := @number-1)
from information_schema.tables
limit 20;

-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
-- * 
-- * * 
-- * * * 
-- * * * * 
-- * * * * *
-- Write a query to print the pattern P(20).
set @number = 0;
select repeat('* ', @number := @number+1)
from information_schema.tables
limit 20;
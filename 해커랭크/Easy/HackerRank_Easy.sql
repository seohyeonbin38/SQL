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
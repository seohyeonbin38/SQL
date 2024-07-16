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
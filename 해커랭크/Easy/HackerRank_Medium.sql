-- Generate the following two result sets:
-- Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical 
-- (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
-- Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
-- There are a total of [occupation_count] [occupation]s.
-- where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
-- If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
select concat(name, '(', substr(occupation, 1, 1), ')')  -- substr(str, pos, len) : str pos번째 문자열부터 len 개수만큼 글자를 가져오시오. ( left(occupation, 1)도 가능함. )
from occupations
order by name, substr(occupation, 1, 1);

select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.')
from occupations
group by occupation
order by count(occupation), occupation
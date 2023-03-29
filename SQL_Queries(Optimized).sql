/* 
Q1 - Create an SQL query that lists the names of all 'persons'
that contain the letters 'on' somewhere in the middle of their name. 
Sort your results in ascending order.
*/

#Answer Q1 - 

select name
from person
where lower(name) like '%_on_%'
order by 1;

/*
Q2 - Create an SQL query that lists the title, tagline, 
and release date of all movies released in 2009 or 2010. 
Sort your results in ascending order of release date.
*/

#Answer Q2

Select title, tagline, release_date
from movie
where year(release_date) = 2009 or year(release_date) = 2010
order by 3;

/*
Q3 - Construct an SQL query that provides a list of the titles of all movies 
and the names of their production countries. Order your list
in descending order of movie title and ascending order of production country.
*/

#Answer Q3

select title, production_country_name
from movie
order by 1 desc, 2;

/*
Q4 - Construct an SQL query that gives the title and budget of the movie with the 
highest budget.
*/

#Answer Q4

select title, budget
from movie
where budget = (select max(budget) from movie);

/*
Q5 - Create an SQL query that reports the difference between the minimum and 
maximum revenue for all movies that contain the letters 'Romance' anywhere in their title.
*/

#Answer Q5

select (max(revenue)-min(revenue)) as rev_dif
from movie
where lower(title) like '%romance%';

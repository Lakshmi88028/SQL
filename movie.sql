CREATE DATABASE movies;

USE movies;

CREATE TABLE movies_details(
id INT,
name VARCHAR(25)UNIQUE,
year YEAR,
lang VARCHAR(25) NOT NULL,
director VARCHAR(25),
platform VARCHAR(25) DEFAULT'Theaters',
budget DOUBLE(10,5),
collections DOUBLE(10,5),
ratings FLOAT CHECK(ratings>0 AND ratings<10),
PRIMARY KEY(id)
);

SHOW TABLES;

DESC movies_details;
-- MODIFY THE TABLE IN DOUBLE TO BIGINT--
ALTER TABLE movies_details MODIFY COLUMN budget BIGINT;
ALTER TABLE movies_details MODIFY COLUMN collections BIGINT;

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(1,"GGVV",2020,"Kannada","Raj B Shetty",10000000,30000000,9.1);

SELECT*FROM movies_details;

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(2,"ASN",2019,"Kannada","Sachin",23000000,56000000,7.9);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(3,"Rathanan Prapancha",2021,"Kannada","Rohit",33000000,16000000,8.6);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(4,"KGF",2018,"Kannada","Prashantha",25000000,66000000,8.9), 
(5,"Yuvarathana",2021,"Kannada","Santosh Anada Ram",27000000,88000000,9.5), 
(6,"suryavamshi",2021,"Kannada","Akshaya",21000000,44000000,9.0),
(7,"Pushpa",2021,"Telagu","Prashantha",23000000,54000000,7.9);
INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(8,"Sakath",2021,"Kannada","Simple Suni",25000000,66000000,8.1),
(9,"Kotigobba 3",2021,"Kannada","Shiva Karthik",19000000,43000000,8.8),
(10,"Madhagaja",2021,"Kannada","S. Mahesh Kumar",12000000,44000000,8.6);

SELECT*FROM movies_details WHERE ratings>=8;

UPDATE movies_details SET platform="Netflix" WHERE id='2';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='3';
UPDATE movies_details SET platform="Netflix" WHERE id='4';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='5';
UPDATE movies_details SET platform="Netflix" WHERE id='6';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='7';
UPDATE movies_details SET platform="Netflix" WHERE id='8';
UPDATE movies_details SET platform="Amazon pirme" WHERE id='9';

SELECT*FROM movies_details WHERE ratings>=8 AND platform='Netflix';

SELECT*FROM movies_details WHERE lang='Kannada';

SELECT*FROM movies_details WHERE director='Akshaya' OR director='Simple Suni' OR director='Raj B Shetty' OR director='Shiva Karthik';

SELECT*FROM movies_details WHERE year=2020;

SELECT*FROM movies_details WHERE year>2020 AND year<=2020;
-- only display in movie name --
SELECT name FROM movies_details;
-- only display in director name and movie name --
SELECT name, director FROM movies_details;
-- only display in director name --
SELECT director FROM movies_details;
-- it is diplay in distinct values --
SELECT DISTINCT director FROM movies_details;
-- duplicte value not display--
SELECT DISTINCT director,year FROM movies_details;
-- Year in ACENDING--
SELECT*FROM movies_details ORDER BY YEAR;
-- Rating in DESCENDING--
SELECT*FROM movies_details ORDER BY ratings DESC;

INSERT INTO movies_details(id,name,year,lang,budget,collections,ratings) VALUE(12,"Avangers Endgame",2019,"English",18000000,48000000,7.3);

UPDATE movies_details SET id=11 WHERE name='Avangers Endgame';

INSERT INTO movies_details(id,name,year,lang,budget,collections,ratings) VALUE(12,"Avatar",2006,"English",36000000,39000000,6.3);

-- display in is null values --
SELECT*FROM movies_details WHERE director IS NULL;
-- display in is null not values --
SELECT*FROM movies_details WHERE director IS NOT NULL;
-- Change the varchar values --
ALTER TABLE movies_details MODIFY COLUMN platform VARCHAR(20) NOT NULL;
-- add the primary key values--
-- ALTER TABLE movies_details ADD PRIMARY KEY(id);--

DELETE FROM movies_details WHERE name='Avangers Endgame';

DELETE FROM movies_details WHERE name='Avatar' AND year=2008;
-- IT IS DISPLAY THE ONLY 5 VALUE BECAUSE USING LIMIT --
SELECT*FROM movies_details LIMIT 5;
-- search the movie name last word %prapancha --
SELECT*FROM movies_details WHERE name LIKE '%prapancha';
-- search the movie name first two character gg% --
SELECT*FROM movies_details WHERE name LIKE 'gg%';
-- search the movie name in the middle word %rathna --
SELECT*FROM movies_details WHERE name LIKE '%rathana%';
-- search the movie director name in the middle word %rathna --
SELECT*FROM movies_details WHERE director LIKE '%Anada%';
-- search the movie name in the middle letter _g% --
SELECT*FROM movies_details WHERE name LIKE '_g%';
-- search the movie name in the start letter and third letter A_A% --
SELECT*FROM movies_details WHERE name LIKE 'A_A%';
-- search the movie name in the third letter __T% --
SELECT*FROM movies_details WHERE name LIKE '__T%';
-- search the movie name in the secand letter and six letter __T% --
SELECT*FROM movies_details WHERE name LIKE '_U__A%';
-- using alias as --
SELECT name AS movies_name FROM movies_details;
-- using alias as --
SELECT collections AS total_movie_collections FROM movies_details;

SELECT movies_details.name,movies_details.director FROM movies_details;
-- short cut using movies_details of M --
SELECT M.name,M.director FROM movies_details M;
-- maximum value OF COLLECTIONS --
SELECT MAX(collections) AS Heighest_Movie_Collection FROM movies_details;
-- maximum value OF BUDGET --
SELECT MAX(budget) AS Heighest_Movie_Budget FROM movies_details;
-- minimum value OF COLLECTIONS --
SELECT MIN(collections) AS Lowest_Movie_Collection FROM movies_details;
-- minimum value OF BUDGET --
SELECT MIN(budget) AS Lowest_Movie_Budget FROM movies_details;
-- Avarage value OF COLLECTIONS --
SELECT AVG(collections) AS Avarage_Movie_Collection FROM movies_details;
-- sum value OF COLLECTIONS --
SELECT SUM(collections) AS Total_Movie_Collection FROM movies_details;
-- count the movies name --
SELECT COUNT(name) AS Number_Of_Movies FROM movies_details;
-- count the director name --
SELECT COUNT(director) AS Number_Of_Director FROM movies_details;
-- count the movies name --
SELECT COUNT(*) AS Number_Of_Movies FROM movies_details;
SELECT*FROM movies_details;



select count(name) as no_ofmovies_in_2021,year from movies_details where year=2021;
-- no of movies in the year of 2021 --
select count(name) as no_ofmovies_in_each_year,year from movies_details group by year;
-- no of movies in each year--
select count(name) as no_of_movies_by_each_director, name from movies_details group by director;
-- no of movie done by each director
select count(name) as no_of_movies_by_platform, platform from movies_details group by platform;
-- no of movies available in each platform--
select count(name) as_no_of_movies_by_month,month(released_date_time) as released_month from movies_details group by released_month;
-- no of movies done in each month--
select count(name) as_no_of_movies_by_lang,lang from movies_details group by lang;
-- no of movies done in each lang
select count(name) no_of_movies_by_year_and_director, year,director from movies_details group by year,director;
-- no of movies by each year and director -- 
select max(collection) as highest_collection_by_year, year from movies_details group by year order by highest_collection_by_year desc;
-- highest collections done by each year and name--
select max(ratings) as highest_ratings_by_platform, platform from movies_details group by platform order by highest_ratings_by_platform desc;
-- highest ratings in each platfrom order by rating --
select min(collection) as lowest_collection_by_year, year from movies_details group by year order by lowest_collection_by_year;
-- lowest collection done in each year--
select min(budget) as lowest_budget_by_director, director from movies_details group by director order by lowest_budget_by_director desc;
-- lowest budget by each director--
select sum(collection) as total_collection_by_platform,platform from movies_details group by platform order by total_collection_by_platform desc;
-- total collections done in each platform--
select avg(collection) as average_collection_by_year,year from movies_details  group by year order by average_collection_by_year;
-- average collection by each year --
select avg(collection) as average_collection_by_director,director from movies_details where director in("Prashantha","Rohit","sachin") group by director;
-- average collection by selected directors--
select avg(collection) as average_collection_by_director,director from movies_details group by director having average_collection_by_director>12000;
-- average collection by each director having collection greater than 50cr--
select sum(collection) as total_collection_by_director,director from movies_details group by director having total_collection_by_director<8000;
-- total collections by each director having total lesser than 100cr

-- get the details of the movie which has the height collection
select max(collection) from movies_details;
select * from movies_details where collection = (select max(collection) from movies_details);
-- second highest collection
select max(collection) as second_highest_collection from movies_details where collection <(select max(collection) from movies_details);
-- get the details of the movie has the second height collection
select * from movies_details where collection = 
(select max(collection) as second_highest_collection from movies_details where collection <(select max(collection) from movies_details));

-- get third highest collection
select max(collection) as third_highest_collection from movies_details where collection<
(select max(collection) from movies_details where collection <(select max(collection) from movies_details));

select * from movies_details where collection = (select max(collection) as third_highest_collection from movies_details where collection<
(select max(collection) from movies_details where collection <(select max(collection) from movies_details)));

select*from movies_details where lang='kannada';
select max(collection) as second_highest_collection_in_kannada from movies_details where collection<
(select max(collection) from movies_details where lang = 'kannada') and lang='kannada';

-- get the details of the movie which has 2nd highest collection in kannada language
select * from movies_details where collection = (select max(collection)  from movies_details where collection<
(select max(collection) from movies_details where lang = 'kannada') and lang='kannada');

-- get the movies details which has the lowest collection 
select min(collection) from movies_details;
select * from movies_details where collection = (select min(collection) from movies_details);

-- get the details of the movies which has both highest and lowest
select * from movies_details where collection in ((select max(collection) from movies_details),(select min(collection) from movies_details));

-- get the movies details which has the highest collection done by each director
select max(collection),director from movies_details group by director;
select * from movies_details where collection in (select max(collection) from movies_details group by director);

-- get the movies details which has the highest collection done by each director having greater than 1000
select * from movies_details where collection in (select max(collection) from movies_details group by director) having max(collection)>10000;

CREATE TABLE movies_details_duplicate(
id INT,
name VARCHAR(25)UNIQUE,
year YEAR,
lang VARCHAR(25) NOT NULL,
director VARCHAR(25),
platform VARCHAR(25) DEFAULT'Theaters',
budget DOUBLE(10,5),
collections DOUBLE(10,5),
ratings FLOAT CHECK(ratings>0 AND ratings<10),
PRIMARY KEY(id)
);
select * from movies_details_duplicate;
alter table movies_details_duplicate add column released_date_time datetime;
select * from movies_details;
insert into movies_details_duplicate select * from movies_details where id  in (select id from the movies_details);
-- update the rating as 9 for the movies has the highest collection done by each director
update movies_details set ratings = 9 where collection in (select max(collection) from movies_details_duplicate  group by director);

delete from movies_details where id in (select id from movies_details_duplicate where id>1);









































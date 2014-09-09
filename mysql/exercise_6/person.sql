CREATE TABLE persons (
  email VARCHAR(25),
  phone VARCHAR(10),
  city VARCHAR(15),
  PRIMARY KEY (email)
);

LOAD DATA LOCAL INFILE 'mysql/exercise_6/email_subscribers.csv'
INTO TABLE persons
FIELDS TERMINATED BY ' , '
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--What all cities did people respond from
SELECT DISTINCT city FROM persons;

--How many people responded from each city
SELECT city, COUNT(email) FROM persons GROUP BY city;

--Which city were the maximum respondents from?
SET @max_respondents = (
  SELECT MAX(counter.count1)
  FROM (
    SELECT COUNT(email) AS count1
    FROM persons
    GROUP BY city) AS counter);
SELECT city, COUNT(email) FROM persons GROUP BY city HAVING COUNT(email) = @max_respondents;

--What all email domains did people respond from ?
SELECT DISTINCT SUBSTRING_INDEX(email, '@', -1) FROM persons;

--Which is the most popular email domain among the respondents ?
SET @max_domain_users = (
  SELECT MAX(counter.count1)
  FROM (
    SELECT COUNT(email) AS count1
    FROM persons
    GROUP BY SUBSTRING_INDEX(email, '@', -1)
  ) AS counter
);
SELECT SUBSTRING_INDEX(email, '@', -1) AS domain
FROM persons
GROUP BY domain
HAVING count(email) = @max_domain_users;

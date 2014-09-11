CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  type SET('admin', 'normal'),
  PRIMARY KEY (id)
);

CREATE TABLE articles (
  id int NOT NULL AUTO_INCREMENT,
  user_id int,
  category varchar(20),
  content text,
  PRIMARY KEY (id)
);

CREATE TABLE comments (
  id int NOT NULL AUTO_INCREMENT,
  article_id int,
  user_id int,
  content text,
  PRIMARY KEY (id)
);

-- Populate users.
INSERT INTO users VALUES (NULL, 'User1', 'admin');
INSERT INTO users VALUES (NULL, 'User2', 'normal');
INSERT INTO users VALUES (NULL, 'User3', 'normal');
INSERT INTO users VALUES (NULL, 'User4', 'normal');

-- Populate articles
INSERT INTO articles VALUES (NULL, 2, 'sci-fi', 'Article 1');
INSERT INTO articles VALUES (NULL, 3, 'ruby', 'Article 2');
INSERT INTO articles VALUES (NULL, 3, 'sql', 'Article 3');
INSERT INTO articles VALUES (NULL, 1, 'ruby', 'Article 4');

--Populate comments
INSERT INTO comments VALUES (NULL, 1, 2, 'Comment 1');
INSERT INTO comments VALUES (NULL, 2, 4, 'Comment 2');
INSERT INTO comments VALUES (NULL, 2, 2, 'Comment 3');
INSERT INTO comments VALUES (NULL, 4, 1, 'Comment 4');

--select all articles whose author's name is user3(without using variable)
SELECT articles.content
FROM articles
INNER JOIN users ON (users.id = articles.user_id)
WHERE users.name = 'User3';

-- select all articles whose author's name is user3(using variable)
SET @user_number = 'User3';
SELECT articles.content
FROM articles
INNER JOIN users ON (users.id = articles.user_id)
WHERE users.name = @user_number;

--select all the articles and also the comments associated with those articles in a single query (without using subquery)
SELECT articles.content AS article, comments.content AS comment
FROM articles
INNER JOIN comments ON (comments.article_id = articles.id)
INNER JOIN users ON (users.id = articles.user_id)
WHERE users.name = 'User3';

--select all the articles and also the comments associated with those articles in a single query (using subquery)

SELECT articles.content AS article, comments.content AS comment
FROM articles
INNER JOIN comments ON (comments.article_id = articles.id)
WHERE articles.content IN (
  SELECT articles.content
  FROM articles
  INNER JOIN users ON (users.id = articles.user_id)
  WHERE users.name = 'User3'
);

--select all articles which do not have any comments(without subqueries)
SELECT articles.content AS article
FROM articles
LEFT JOIN comments ON (comments.article_id = articles.id)
WHERE comments.content is NULL;

----select all articles which do not have any comments(with subqueries)
SELECT articles.content
FROM articles
WHERE articles.id not IN (
  SELECT DISTINCT comments.article_id 
  FROM comments
);


--select article which has most comments

SET @max_comments = (
  SELECT COUNT(comments.content)
  FROM articles
  INNER JOIN comments ON (comments.article_id = articles.id)
  GROUP BY articles.content
  ORDER BY COUNT(comments.content) DESC
  LIMIT 1
);

SELECT articles.content AS article
FROM articles
INNER JOIN comments ON (comments.article_id = articles.id)
GROUP BY articles.content
HAVING COUNT(comments.content) = @max_comments;

--select article which does not have more than one comment by the same user
SELECT articles.content AS article
FROM articles
LEFT JOIN comments ON (comments.article_id = articles.id)
LEFT JOIN users ON (comments.user_id = users.id)
GROUP BY article
HAVING count(distinct comments.user_id) = count(comments.user_id);

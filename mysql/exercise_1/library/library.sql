 CREATE TABLE branches(
   bcode VARCHAR(5),
   librarian VARCHAR(15),
   address VARCHAR(20),
   PRIMARY KEY(bcode)
);
-- Query OK, 0 rows affected (0.26 sec)

CREATE TABLE titles(
  title VARCHAR(20),
  author VARCHAR(20),
  publisher VARCHAR(20),
  PRIMARY KEY(title)
);
-- Query OK, 0 rows affected (0.34 sec)

CREATE TABLE holdings(
  branch VARCHAR(5),
  title VARCHAR(20),
  copies INT,
  PRIMARY KEY(branch, title),
  FOREIGN KEY(branch) REFERENCES branches(bcode),
  FOREIGN KEY(title) REFERENCES titles(title)
);

-- Query OK, 0 rows affected (0.32 sec)

INSERT INTO branches
  VALUES
  ('b1', 'john smith', '2 anglesea rd'),
  ('b2', 'mary jones', '34 pearse st'),
  ('b3', 'francis owens', 'grange x');

-- Query OK, 3 rows affected, 1 warning (0.11 sec)
-- Records: 3  Duplicates: 0  Warnings: 1

INSERT INTO titles
  VALUES
  ('susannah', 'ann brown', 'macmillan'),
  ('how to fish', 'amy fly', 'stop press'),
  ('a history of dublin', 'david little', 'wiley'),
  ('computers', 'blaise pascal', 'applewoods'),
  ('the wife', 'ann brown', 'macmillan');
-- Query OK, 5 rows affected (0.07 sec)
-- Records: 5  Duplicates: 0  Warnings: 0

INSERT INTO holdings
  VALUES
  ('b1', 'susannah', 3),
  ('b1', 'How to Fish', 2),
  ('b1', 'a history of dublin', 1),
  ('b2', 'computers', 2),
  ('b2', 'How to Fish', 4),
  ('b2', 'the wife', 3),
  ('b3', 'computers', 4),
  ('b3', 'susannah', 3),
  ('b3', 'the wife', 1);
-- Query OK, 9 rows affected (0.14 sec)
-- Records: 9  Duplicates: 0  Warnings: 0

SELECT title FROM titles WHERE publisher = 'macmillan';

SELECT DISTINCT branch FROM holdings WHERE title IN (
SELECT title FROM titles WHERE author = 'ann brown'
);

SELECT DISTINCT holdings.branch FROM holdings, titles
WHERE titles.author = 'ann brown' AND
holdings.title = titles.title;

SELECT branch, sum(copies) FROM holdings GROUP BY branch;

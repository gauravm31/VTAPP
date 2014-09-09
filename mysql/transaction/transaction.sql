CREATE TABLE users (
  id int auto_increment,
  name varchar(20) NOT NULL,
  email varchar(25) NOT NULL,
  account_no int NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE accounts (
  id INT AUTO_INCREMENT,
  account_no int NOT NULL,
  balance int NOT NULL,
  PRIMARY KEY (id)
);

--populate users
INSERT INTO users VALUES (NULL, 'userA', 'userA@gmail.com', 12345), (NULL, 'userB', 'userB@gmail.com', 12346);

--populate accounts
INSERT INTO accounts VALUES (NULL, 12345, 10000), (NULL, 12346, 5000);

--  userA is depositing 1000 Rs. his account

BEGIN WORK;

UPDATE accounts SET balance = 11000 WHERE account_no = (
  SELECT account_no FROM users WHERE name = 'userA'
);

SELECT * FROM accounts;
+----+------------+---------+
| id | account_no | balance |
+----+------------+---------+
|  1 |      12345 |   11000 |
|  2 |      12346 |    5000 |
+----+------------+---------+
2 rows IN SET (0.00 sec)

COMMIT WORK;

--  userA is withdrawing 500 Rs.

BEGIN WORK;

UPDATE accounts SET balance = 10500 WHERE account_no = (
  SELECT account_no FROM users WHERE name = 'userA'
);

SELECT * FROM accounts;
+----+------------+---------+
| id | account_no | balance |
+----+------------+---------+
|  1 |      12345 |   10500 |
|  2 |      12346 |    5000 |
+----+------------+---------+
2 rows IN SET (0.00 sec)

COMMIT WORK;

-- userA is transferring 200 Rs to userB's account

BEGIN WORK;

UPDATE accounts SET balance = 10300 WHERE account_no = (
  SELECT account_no FROM users WHERE name = 'userA'
);

UPDATE accounts SET balance = 5200 WHERE account_no = (
  SELECT account_no FROM users WHERE name = 'userB'
);

SELECT * FROM accounts;
+----+------------+---------+
| id | account_no | balance |
+----+------------+---------+
|  1 |      12345 |   10300 |
|  2 |      12346 |    5200 |
+----+------------+---------+
2 rows IN SET (0.00 sec)

COMMIT WORK;

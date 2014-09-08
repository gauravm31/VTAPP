CREATE TABLE testing_table (
  name varchar(20),
  contact_name varchar(20),
  roll_no varchar(10)
  );

-- Query OK, 0 rows affected (0.02 sec)

ALTER TABLE testing_table DROP name;

ALTER TABLE testing_table CHANGE contact_name username varchar(20);

ALTER TABLE testing_table ADD (first_name varchar(15), last_name varchar(15));

ALTER TABLE testing_table MODIFY roll_no int;
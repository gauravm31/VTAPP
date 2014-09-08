CREATE TABLE tastes (
  name varchar(15),
  filling varchar(15)
);

INSERT INTO tastes VALUES ('Brown', 'Turkey');
INSERT INTO tastes VALUES ('Brown', 'Beef');  
INSERT INTO tastes VALUES ('Brown', 'Ham');
INSERT INTO tastes VALUES ('Jones', 'Cheese');
INSERT INTO tastes VALUES ('Green', 'Beef');
INSERT INTO tastes VALUES ('Green', 'Turkey');
INSERT INTO tastes VALUES ('Green', 'Cheese');

CREATE TABLE locations (
  lname varchar(15),
  phone varchar(8),
  address varchar(25)
);

INSERT INTO locations VALUES ('Lincoln', '683 4523', 'Lincoln Place');
INSERT INTO locations VALUES ("O'Neil's", '674 2134', 'Pearse St');
INSERT INTO locations VALUES ('Old Nag', '767 8132', 'Dame St');
INSERT INTO locations VALUES ('Butterfly', '702 3421', 'College St');

CREATE TABLE sandwiches (
  location varchar(15),
  bread varchar(10),
  filling varchar(15),
  price float
);

INSERT INTO sandwiches VALUES ('Lincoln', 'Rye', 'Ham', 1.25);
INSERT INTO sandwiches VALUES ("O'Neil's", 'White', 'Cheese', 1.20);
INSERT INTO sandwiches VALUES ("O'Neil's", 'Whole', 'Ham', 1.25);
INSERT INTO sandwiches VALUES ('Old Nag', 'Rye', 'Beef', 1.35);
INSERT INTO sandwiches VALUES ('Butterfly', 'White', 'Cheese', 1.00);
INSERT INTO sandwiches VALUES ("O'Neil's", 'White', 'Turkey', 1.35);
INSERT INTO sandwiches VALUES ('Butterfly', 'White', 'Ham', 1.10);
INSERT INTO sandwiches VALUES ('Lincoln', 'Rye', 'Beef', 1.35);
INSERT INTO sandwiches VALUES ('Lincoln', 'White', 'Ham', 1.30);
INSERT INTO sandwiches VALUES ('Old Nag', 'Rye', 'Ham', 1.40);

SELECT DISTINCT location
FROM sandwiches WHERE filling IN (
  SELECT filling FROM tastes WHERE name = 'Jones');

SELECT DISTINCT sandwiches.location FROM sandwiches, tastes
where sandwiches.filling = tastes.filling and
tastes.name = 'Jones';

SELECT sandwiches.location, count(distinct tastes.name) from sandwiches, tastes
where sandwiches.filling = tastes.filling
group by sandwiches.location;

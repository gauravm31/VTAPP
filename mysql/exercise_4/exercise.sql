Mac-Book-Pro-985:VTAPP vinsol$ mysqldump -uroot social_network > mysql/exercise_4/dump.sql

Mac-Book-Pro-985:VTAPP vinsol$ mysql -uroot
mysql> create database restored
    -> ;
Query OK, 1 row affected (0.02 sec)

mysql> ^DBye
Mac-Book-Pro-985:VTAPP vinsol$ mysql -uroot restored < mysql/exercise_4/dump.sql 
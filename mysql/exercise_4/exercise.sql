mysqldump -uroot -p social_network > mysql/exercise_4/dump.sql
Enter password:

Mac-Book-Pro-985:VTAPP vinsol$ mysql -uroot -p
Enter password:
mysql> create database restored
    -> ;
Query OK, 1 row affected (0.02 sec)

mysql> ^DBye

Mac-Book-Pro-985:VTAPP vinsol$ mysql -uroot -p restored < mysql/exercise_4/dump.sql
Enter password:
#############################
                            Sqoop - Importação BD Sakila – Carga Incremental

Realizar com uso do MySQL

1. Criar a tabela cp_rental_append, contendo a cópia da tabela rental com os campos rental_id e rental_date
#docker-compose up -d
#docker exec -it database bash
#mysql -psecret
#use sakila
#show tables;
#select * from rental limit 10;

#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "create table cp_rental_append(rental_id int(2) AUTO_INCREMENT PRIMARY KEY, rental_date to_date)"

2 .Criar a tabela cp_rental_id e cp_rental_date, contendo a cópia da tabela cp_rental_append

#create table cp_rental_date select rental_id, rental_date from cp_rental_append;
 

Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test3 e visualizar no HDFS

3. Importar as tabelas cp_rental_append, cp_rental_id e cp_rental_date com 1 mapeador
Realizar com uso do MySQL
#sqoop import  --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir   /user/hive/warehouse/db_test3 -m 1 --table cp_rental_append
#sqoop import  --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir   /user/hive/warehouse/db_test3 -m 1 --table cp_rental_id
#sqoop import  --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir   /user/hive/warehouse/db_test3 -m 1 --table cp_rental_date

#hdfs dfs -ls -R /user/hive/warehouse/db_test3
#hdfs dfs -tail /user/hive/warehouse/db_test3/cp_rental_append/part-m-00000
#hdfs dfs -tail /user/hive/warehouse/db_test3/cp_rental_id/part-m-00000
#hdfs dfs -tail /user/hive/warehouse/db_test3/cp_rental_date/part-m-00000

4. Executar o sql /db-sql/sakila/insert_rental.sql no container do database

$ docker exec -it database bash

$ cd /db-sql/sakila

$ mysql -psecret < insert_rental.sql
Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test3 e visualizar no HDFS

#$ docker exec -it database bash

#$ cd /db-sql/sakila

#$ mysql -psecret < insert_rental.sql

#tivemos que editar .sql com o vim
#vi insert_rental.sql
#apos corrigir 
#digit esc 
#:wq!
#Press ENTER key
#This will quit the editor, and all changes you have made to the document will be saved to the file.
 

5. Atualizar a tabela cp_rental_append no HDFS anexando os novos arquivos

#sqoop import  --table cp_rental_append --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir   /user/hive/warehouse/db_test3 -m 1  --append

6. Atualizar a tabela cp_rental_id no HDFS de acordo com o último registro de rental_id, adicionando apenas os novos dados.
#sqoop eval --connect jdbc:mysql://database/sakila --username root --password secret --query "select * from cp_rental_append order by rental_id desc limit 5"
#sqoop import  --table cp_rental_id --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir   /user/hive/warehouse/db_test3 -m 1  --incremental append --check-column rental_id  --last-value 16049

7. Atualizar a tabela cp_rental_date no HDFS de acordo com o último registro de rental_date, atualizando os registros a partir desta data.

          
#sqoop eval --connect jdbc:mysql://database/sakila --username root --password secret --query "select * from cp_rental_append order by rental_id desc limit 5"
#sqoop import  --table cp_rental_date --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir   /user/hive/warehouse/db_test3 -m 1  --incremental lastmodified --merge-key rental_id --check-column rental_date  --last-value '2005-08-23 22:50:12.0'
#hdfs dfs -ls -h -R /user/hive/warehouse/db_test3                      



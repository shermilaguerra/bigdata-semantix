#############################
                             Sqoop - Importação BD Employees- Otimização
Realizar com uso do MySQL
#/Documentos/semantix-bigdata/docker-bigdata$ docker exec -it database bash
#root@database:/#  mysql -psecret
#mysql>show databases;
#+--------------------+
#| Database           |
#+--------------------+
#| information_schema |
#| employees          |
#| hue                |
#| mysql              |
#| performance_schema |
#| sakila             |
#| sys                |
#+--------------------+

#mysql> use employees;

#mysql> show tables;
#+----------------------+
#| Tables_in_employees  |
#+----------------------+
#| benefits             |
#| current_dept_emp     |
#| departments          |
#| dept_emp             |
#| dept_emp_latest_date |
#| dept_manager         |
#| employees            |
#| employees_2          |
#| titles               |
#+----------------------+
#9 rows in set (0.01 sec)
#mysql>select * from titles limit 10;
1. Criar a tabela cp_titles_date, contendo a cópia da tabela titles com os campos title e to_date

#create table cp_titles_date select title, to_date from  titles


2. Pesquisar os 15 primeiros registros da tabela cp_titles_date

#mysql> select * from cp_titles_date limit 15;
#+--------------------+------------+
#| title              | to_date    |
#+--------------------+------------+
#| Senior Engineer    | 9999-01-01 |
#| Staff              | 9999-01-01 |
#| Senior Engineer    | 9999-01-01 |
#| Engineer           | 1995-12-01 |
#| Senior Engineer    | 9999-01-01 |
#| Senior Staff       | 9999-01-01 |
#| Staff              | 1996-09-12 |
#| Senior Engineer    | 9999-01-01 |
#| Senior Staff       | 9999-01-01 |
#| Staff              | 1996-02-11 |
#| Assistant Engineer | 2000-07-31 |
#| Assistant Engineer | 1990-02-18 |
#| Engineer           | 1995-02-18 |
#| Senior Engineer    | 9999-01-01 |
#| Engineer           | 9999-01-01 |
#+--------------------+------------+

3. Alterar os registros do campo to_date para null da tabela cp_titles_date, quando o título for igual a Staff

#mysql> update cp_titles_date set to_date=NULL where title='staff';
#mysql> select * from cp_titles_date limit 15;
#+--------------------+------------+
#| title              | to_date    |
#+--------------------+------------+
#| Senior Engineer    | 9999-01-01 |
#| Staff              | NULL       |
#| Senior Engineer    | 9999-01-01 |
#| Engineer           | 1995-12-01 |
#| Senior Engineer    | 9999-01-01 |
#| Senior Staff       | 9999-01-01 |
#| Staff              | NULL       |
#| Senior Engineer    | 9999-01-01 |
#| Senior Staff       | 9999-01-01 |
#| Staff              | NULL       |
#| Assistant Engineer | 2000-07-31 |
#| Assistant Engineer | 1990-02-18 |
#| Engineer           | 1995-02-18 |
#| Senior Engineer    | 9999-01-01 |
#| Engineer           | 9999-01-01 |
#+--------------------+------------+
#15 rows in set (0.00 sec)


Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test_<numero_questao> e visualizar no HDFS
 docker exec -it namenode  bash


4. Importar a tabela titles com 8 mapeadores no formato parquet


#sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as parquetfile --warehouse-dir /user/hive/warehouse/db_test2_4
#
#hdfs dfs -ls -h /user/hive/warehouse/dbtest2_4
#hdfs dfs -ls -h /user/hive/warehouse/db_test2_4/titles
#Found 8 items
#drwxr-xr-x   - root supergroup          0 2022-05-26 21:10 /user/hive/warehouse/db_test2_4/titles/.metadata
#drwxr-xr-x   - root supergroup          0 2022-05-26 21:13 /user/hive/warehouse/db_test2_4/titles/.signals
#-rw-r--r--   3 root supergroup    433.1 K 2022-05-26 21:12 /user/hive/warehouse/db_test2_4/titles/12c16666-3231-46af-#b6df-8c9d11d4588f.parquet
#-rw-r--r--   3 root supergroup    429.3 K 2022-05-26 21:13 /user/hive/warehouse/db_test2_4/titles/4aa7f1db-2610-4d86-a800-3d92fc0428f2.parquet
#-rw-r--r--   3 root supergroup    491.0 K 2022-05-26 21:13 /user/hive/warehouse/db_test2_4/titles/4ed9401f-7339-47ce-a2f0-c93027d157e3.parquet
#-rw-r--r--   3 root supergroup    640.9 K 2022-05-26 21:13 /user/hive/warehouse/db_test2_4/titles/79edea0d-e6e3-4f72-942e-a03dc9510b89.parquet
#-rw-r--r--   3 root supergroup    581.7 K 2022-05-26 21:12 /user/hive/warehouse/db_test2_4/titles/819d03ea-5d62-4d73-9c55-8788d6ab258b.parquet
#-rw-r--r--   3 root supergroup    642.2 K 2022-05-26 21:12 /user/hive/warehouse/db_test2_4/titles/f0e099fc-6bf2-4712-b2df-b0760d1769a0.parquet

##hdfs dfs -tail /user/hive/warehouse/db_test2_4/titles/12c16666-3231-46af-#b6df-8c9d11d4588f.parquet

5. Importar a tabela titles com 8 mapeadores no formato parquet e compressão snappy

#sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as-parquetfile --warehouse-dir /user/hive/warehouse/db_test2_5 --compress --compression-codec org.apache.hadoop.io.compress.SnappyCodec


6. Importar a tabela cp_titles_date com 4 mapeadores (erro)
14:13

Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo título no warehouse /user/hive/warehouse/db_test2_title
Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo data no warehouse /user/hive/warehouse/db_test2_date
Qual a diferença dos registros nulos entre as duas importações?

          
                      



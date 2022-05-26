#############################
                             Sqoop - Importação BD Employees
T1. Pesquisar os 10 primeiros registros da tabela employees do banco de dados employees

#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from employees limit 10"
#---------------------------------------------------------------------------------
#| emp_no      | birth_date | first_name     | last_name        | gender | hire_date  | 
#---------------------------------------------------------------------------------
#| 10001       | 1953-09-02 | Georgi         | Facello          | M | 1986-06-26 | 
#| 10002       | 1964-06-02 | Bezalel        | Simmel           | F | 1985-11-21 | 
#| 10003       | 1959-12-03 | Parto          | Bamford          | M | 1986-08-28 | 
#| 10004       | 1954-05-01 | Chirstian      | Koblick          | M | 1986-12-01 | 
#| 10005       | 1955-01-21 | Kyoichi        | Maliniak         | M | 1989-09-12 | 
#| 10006       | 1953-04-20 | Anneke         | Preusig          | F | 1989-06-02 | 
#| 10007       | 1957-05-23 | Tzvetan        | Zielinski        | F | 1989-02-10 | 
#| 10008       | 1958-02-19 | Saniya         | Kalloufi         | M | 1994-09-15 | 
#| 10009       | 1952-04-19 | Sumant         | Peac             | F | 1985-02-18 | 
#| 10010       | 1963-06-01 | Duangkaew      | Piveteau         | F | 1989-08-24 | 
#---------------------------------------------------------------------------------


2. Realizar as importações referentes a tabela employees e para validar cada questão,  é necessário visualizar no HDFS*

Importar a tabela employees, no warehouse  /user/hive/warehouse/db_test_a
#sqoop import  --table employees --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/hive/warehouse/db_test_a
# hdfs dfs -ls /user/hive/warehouse/db_test_a/employees
# hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00000 | head -n 3
#10001,1953-09-02,Georgi,Facello,M,1986-06-26
#10002,1964-06-02,Bezalel,Simmel,F,1985-11-21
#10003,1959-12-03,Parto,Bamford,M,1986-08-28



Importar todos os funcionários do gênero masculino, no warehouse  /user/hive/warehouse/db_test_b
#sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --where "gender='M'" --warehouse-dir /user/hive/warehouse/db_test_b
#hdfs dfs -ls -h /user/hive/warehouse/db_test_b/employees
#-rw-r--r--   3 root supergroup          0 2022-05-26 14:17 /user/hive/warehouse/db_test_b/employees/_SUCCESS
#-rw-r--r--   3 root supergroup      2.6 M 2022-05-26 14:16 /user/hive/warehouse/db_test_b/employees/part-m-00000
#-rw-r--r--   3 root supergroup      1.5 M 2022-05-26 14:16 /user/hive/warehouse/db_test_b/employees/part-m-00001
#-rw-r--r--   3 root supergroup      1.2 M 2022-05-26 14:16 /user/hive/warehouse/db_test_b/employees/part-m-00002
#-rw-r--r--   3 root supergroup      2.7 M 2022-05-26 14:16 /user/hive/warehouse/db_test_b/employees/part-m-00003

#hdfs dfs -cat /user/hive/warehouse/db_test_b/employees/part-m-00000 | head -n 5

importar o primeiro e o último nome dos funcionários com os campos separados por tabulação, no warehouse  /user/hive/warehouse/db_test_c
#sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name, last_name" --fields-terminated-by '\t' --warehouse-dir /user/hive/warehouse/db_test_c

Importar o primeiro e o último nome dos funcionários com as linhas separadas por “ : ” e salvar no mesmo diretório da questão 2.C
#sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name, #last_name" --lines-terminated-by ':' --warehouse-dir /user/hive/warehouse/db_test_c -delete-target-dir

* Dica para visualizar no HDFS:

$ hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00000 | head -n 5

          
                      



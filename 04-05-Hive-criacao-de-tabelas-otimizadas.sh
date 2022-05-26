#############################
Hive - Criação de Tabelas Otimizadas

1. Usar o banco de dados <nome>

2. Selecionar os 10 primeiros registros da tabela pop
 #select * from pop limit 10;

3. Criar a tabela pop_parquet no formato parquet para ler os dados da tabela pop
#create table  pop_parquet(
#. . . . . . . . . . . . . . . .> zip_code int,
#. . . . . . . . . . . . . . . .> total_population int,
#. . . . . . . . . . . . . . . .> median_age float,
#. . . . . . . . . . . . . . . .> total_males int,
#. . . . . . . . . . . . . . . .> total_females int,
#. . . . . . . . . . . . . . . .> total_households int,
#. . . . . . . . . . . . . . . .> average_household_size float
#. . . . . . . . . . . . . . . .> )
#. . . . . . . . . . . . . . . .> stored as parquet;

4. Inserir os dados da tabela pop na pop_parquet

#insert into pop_parquet select * from pop

5. Contar os registros da tabela pop_parquet

#select count(*)  from pop_parquet;

6. Selecionar os 10 primeiros registros da tabela pop_parquet

# select *  from pop_parquet limit 10;

7. Criar a tabela pop_parquet_snappy no formato parquet com compressão Snappy para ler os dados da tabela pop

drop table drop table 

#create table  pop_parquet_snappy(
#. . . . . . . . . . . . . . . .> zip_code int,
#. . . . . . . . . . . . . . . .> total_population int,
#. . . . . . . . . . . . . . . .> median_age float,
#. . . . . . . . . . . . . . . .> total_males int,
#. . . . . . . . . . . . . . . .> total_females int,
#. . . . . . . . . . . . . . . .> total_households int,
#. . . . . . . . . . . . . . . .> average_household_size float
#. . . . . . . . . . . . . . . .> )
#. . . . . . . . . . . . . . . .> stored as parquet
#. . . . . . . . . . . . . . . .> tblproperties('parquet.compress'='SNAPPY');
#pra ver o formato
#desc formatted pop_parquet_snappy


8. Inserir os dados da tabela pop na pop_parquet_snappy
#insert into pop_parquet_snappy select * from pop


9. Contar os registros da tabela pop_parquet_snappy
#select count(*)  from pop_parquet_snappy;
10. Selecionar os 10 primeiros registros da tabela pop_parquet_snappy
#select *  from pop_parquet_snappy limit 10;
11. Comparar as tabelas pop, pop_parquet e pop_parquet_snappy no HDFS.

#no hdfs
# hdfs dfs -ls /user/hive/warehouse
#Found 4 items
#drwxrwxr-x   - root supergroup          0 2022-05-22 16:12 /user/hive/warehouse/pop
#drwxrwxr-x   - root supergroup          0 2022-05-25 12:11 /user/hive/warehouse/pop_parquet
#drwxrwxr-x   - root supergroup          0 2022-05-25 12:25 /user/hive/warehouse/pop_parquet_snappy
#drwxrwxr-x   - root supergroup          0 2022-05-22 14:19 /user/hive/warehouse/shermila.db

#mas se faço assim:
# hdfs dfs -ls /user/hive/warehouse/shermila.db
#hdfs dfs -ls -R /user/hive/warehouse/           
#drwxrwxr-x   - root supergroup          0 2022-05-22 16:12 /user/hive/warehouse/pop
#-rwxrwxr-x   3 root supergroup      12183 2022-05-22 14:11 /user/hive/warehouse/pop/populacaoLA.csv
#drwxrwxr-x   - root supergroup          0 2022-05-25 12:11 /user/hive/warehouse/pop_parquet
#-rwxrwxr-x   3 root supergroup       9477 2022-05-25 12:11 /user/hive/warehouse/pop_parquet/000000_0
#drwxrwxr-x   - root supergroup          0 2022-05-25 12:25 /user/hive/warehouse/pop_parquet_snappy
#-rwxrwxr-x   3 root supergroup       9477 2022-05-25 12:25 /user/hive/warehouse/pop_parquet_snappy/000000_0
#drwxrwxr-x   - root supergroup          0 2022-05-22 14:19 /user/hive/warehouse/shermila.db

#hdfs dfs -ls -R /user/hive/warehouse/
#hdfs dfs -ls -R -h /user/hive/warehouse/
#hdfs dfs -du -h /user/hive/warehouse
#
12. Clicar no botão de Enviar Tarefa, e enviar o texto: ok



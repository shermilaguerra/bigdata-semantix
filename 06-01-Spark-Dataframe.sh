                                         Spark - Exercícios de DataFrame

#docker exec -it spark bash

#spark-shell

1. Enviar o diretório local “/input/exercises-data/juros_selic” para o HDFS em “/user/aluno/<nome>/data”

# hdfs dfs -put /input/exercises-data/juros_selic/ /user/aluno/shermila/data/
#hdfs dfs -ls /user/aluno/shermila/data/
#Found 5 items
#drwxr-xr-x   - root supergroup          0 2022-05-21 22:59 /user/aluno/shermila/data/escola
#drwxr-xr-x   - root supergroup          0 2022-06-02 19:17 /user/aluno/shermila/data/juros_selic
#drwxr-xr-x   - root supergroup          0 2022-05-23 12:43 /user/aluno/shermila/data/nascimento
#drwxr-xr-x   - root supergroup          0 2022-05-22 16:12 /user/aluno/shermila/data/populacao
#-rw-r--r--   2 root supergroup          0 2022-05-22 12:47 /user/aluno/shermila/data/test


2. Criar o DataFrame jurosDF para ler o arquivo no HDFS “/user/aluno/<nome>/data/juros_selic/juros_selic.json”
#val jurosDF=spark.read.json("/user/aluno/shermila/data/juros_selic/juros_selic.json")

#jurosDF: org.apache.spark.sql.DataFrame = [data: string, valor: string]

3. Visualizar o Schema do jurosDF
#jurosDF.printSchema
#root
# |-- data: string (nullable = true)
# |-- valor: string (nullable = true)

4. Mostrar os 5 primeiros registros do jutosDF
# jurosDF.show(5)
#+----------+-----+
#|      data|valor|
#+----------+-----+
#|01/06/1986| 1.27|
#|01/07/1986| 1.95|
#|01/08/1986| 2.57|
#|01/09/1986| 2.94|
#|01/10/1986| 1.96|
#+----------+-----+
#only showing top 5 rows


5. Contar a quantidade de registros do jurosDF
# jurosDF.count()
#res4: Long = 393     

6. Criar o DataFrame jurosDF10 para filtrar apenas os registros com o campo “valor” maior que 10
#val jurosDF10=jurosDF.where("valor>10")

7. Salvar o DataFrame jurosDF10  como tabela Hive “<nome>.tab_juros_selic”
#jurosDF10.write.saveAsTable("shermila.tab_juros_selic")
#quando vamos salvar como catalago vamos obviar o nome shermila

8. Criar o DataFrame jurosHiveDF para ler a tabela “<nome>.tab_juros_selic”
# val jurosHiveDF=spark.read.table("shermila.tab_juros_selic")
#jurosHiveDF: org.apache.spark.sql.DataFrame = [data: string, valor: string]


9. Visualizar o Schema do jurosHiveDF
#jurosHiveDF.printSchema()
#root
# |-- data: string (nullable = true)
# |-- valor: string (nullable = true)
#Observação: valor tem valores reais mas o spark reconhece como string

10. Mostrar os 5 primeiros registros do jurosHiveDF
#jurosHiveDF.show(5)
#+----------+-----+
#|      data|valor|
#+----------+-----+
#|01/01/1987|11.00|
#|01/02/1987|19.61|
#|01/03/1987|11.95|
#|01/04/1987|15.30|
#|01/05/1987|24.63|
#+----------+-----+
#only showing top 5 rows


11. Salvar o DataFrame jurosHiveDF no HDFS no diretório “/user/aluno/nome/data/save_juros” no formato parquet
val jurosHiveDF=spark.read.table("shermila.tab_juros_selic")
#jurosHiveDF.write.save("/user/aluno/shermila/data/save_juros")
#.save já é o padrão para armazenar com formato parquet
#o spark só cria um diretorio /save_juros se fosse 2 não cria

12. Visualizar o save_juros no HDFS
#saimos do spark com ctrl+D e exit
#entramos no namenode com:docker exec -it namenode bash
# digitar: hdfs dfs -ls /user/aluno/shermila/data/save_juros no root@namenode:/#
#Found 2 items
#-rw-r--r--   2 root supergroup          0 2022-06-03 12:55 /user/aluno/shermila/data/save_juros/_SUCCESS
#-rw-r--r--   2 root supergroup       1419 2022-06-03 12:55 /user/aluno/shermila/data/save_juros/part-00000-06da3edc-db40-4a50-bfb8-7f3f284f3554-c000.snappy.parquet

#aqui se observa que só com ".write.save" spark e scala guarda com formato parquet e já esta comprimido com formato snappy e alem disso sempre cria um arquivo SUCCESS

#alem disso vamos mostrar outro exemplo extra: listar tab_juros_selic no hive
#root@namenode:/# hdfs dfs -ls /user/hive/warehouse/shermila.db/tab_juros_selic
#Found 2 items
#-rw-r--r--   2 root supergroup          0 2022-06-03 11:50 /user/hive/warehouse/shermila.db/tab_juros_selic/_SUCCESS
#-rw-r--r--   2 root supergroup       1419 2022-06-03 11:50 /user/hive/warehouse/shermila.db/tab_juros_selic/part-00000-f88d2e2e-7eaa-4bf2-96c8-8565f2870b68-c000.snappy.parquet


13. Criar o DataFrame jurosHDFS para ler o diretório do “save_juros” da questão 8

#val jurosHDFS = spark.read.load("/user/aluno/shermila/data/save_juros")
#jurosHDFS: org.apache.spark.sql.DataFrame = [data: string, valor: string]   

#val jurosHDFS = spark.read.load("hdfs://namenode:8020/user/aluno/shermila/data/save_juros")
#jurosHDFS: org.apache.spark.sql.DataFrame = [data: string, valor: string]


14. Visualizar o Schema do jurosHDFS
#jurosHDFS.printSchema
#root
# |-- data: string (nullable = true)
# |-- valor: string (nullable = true)


15. Mostrar os 5 primeiros registros do jurosHDFS
#jurosHDFS.show(5)
#+----------+-----+                                                              
#|      data|valor|
#+----------+-----+
#|01/01/1987|11.00|
#|01/02/1987|19.61|
#|01/03/1987|11.95|
#|01/04/1987|15.30|
#|01/05/1987|24.63|
#+----------+-----+
#only showing top 5 rows


16. Clicar no botão de Enviar Tarefa, e enviar o texto: ok

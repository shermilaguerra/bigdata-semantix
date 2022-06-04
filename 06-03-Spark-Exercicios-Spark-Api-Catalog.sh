                                        Spark - Exercícios da API Catalog

Realizar os exercícios usando a API Catalog.

1. Visualizar todos os banco de dados
#spark.catalog.listDatabases.show(false)
#+--------+---------------------+----------------------------------------------------+
#|name    |description          |locationUri                                         |
#+--------+---------------------+----------------------------------------------------+
#|default |Default Hive database|hdfs://namenode:8020/user/hive/warehouse            |
#|shermila|                     |hdfs://namenode:8020/user/hive/warehouse/shermila.db|
#+--------+---------------------+----------------------------------------------------+


2. Definir o banco de dados “seu-nome” como principal
#spark.catalog.setCurrentDatabase("shermila")



3. Visualizar todas as tabelas do banco de dados “seu-nome”
#spark.catalog.listTables.show
#+---------------+--------+-----------+---------+-----------+
#|           name|database|description|tableType|isTemporary|
#+---------------+--------+-----------+---------+-----------+
#|     nascimento|shermila|       null| EXTERNAL|      false|
#|     tab_alunos|shermila|       null|  MANAGED|      false|
#|tab_juros_selic|shermila|       null|  MANAGED|      false|
#+---------------+--------+-----------+---------+-----------+

4. Visualizar as colunas da tabela tab_alunos
#spark.catalog.listColumns("tab_alunos").show
#+-----------------+-----------+--------+--------+-----------+--------+
#|             name|description|dataType|nullable|isPartition|isBucket|
#+-----------------+-----------+--------+--------+-----------+--------+
#|      id_discente|       null|     int|    true|      false|   false|
#|             nome|       null|  string|    true|      false|   false|
#|     ano_ingresso|       null|     int|    true|      false|   false|
#| periodo_ingresso|       null|     int|    true|      false|   false|
#|            nivel|       null|  string|    true|      false|   false|
#|id_forma_ingresso|       null|     int|    true|      false|   false|
#|         id_curso|       null|     int|    true|      false|   false|
#+-----------------+-----------+--------+--------+-----------+--------+


5.  Visualizar os 10 primeiros registos da tabela "tab_alunos" com uso do spark.sql
#spark.read.table("tab_alunos").show(3)
#+-----------+--------------------+------------+----------------+-----+-----------------+--------+
#|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_curso|
#+-----------+--------------------+------------+----------------+-----+-----------------+--------+
#|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|   76995|
#|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|    3402|
#|      17977|ABIGAIL ANTUNES S...|        2017|               1|    T|          2081111|  759711|
#+-----------+--------------------+------------+----------------+-----+-----------------+--------+
#only showing top 3 rows

6. Clicar no botão de Enviar Tarefa, e enviar o texto: ok

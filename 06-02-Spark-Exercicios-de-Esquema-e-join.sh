Spark - Exercícios de Esquema e Join

1. Criar o DataFrame alunosDF para ler o arquivo no hdfs “/user/aluno/<nome>/data/escola/alunos.csv” sem usar as “option”
#val alunosDF=spark.read.csv("/user/aluno/shermila/data/escola/alunos.csv")

2. Visualizar o esquema do alunosDF
#alunosDF.printSchema
#root
# |-- _c0: string (nullable = true)
# |-- _c1: string (nullable = true)
# |-- _c2: string (nullable = true)
# |-- _c3: string (nullable = true)
# |-- _c4: string (nullable = true)
# |-- _c5: string (nullable = true)
# |-- _c6: string (nullable = true)
#
3. Criar o DataFrame alunosDF para ler o arquivo “/user/aluno/<nome>/data/escola/alunos.csv” com a opção de Incluir o cabeçalho

#val alunosDF=spark.read.option("header", "true").csv("/user/aluno/shermila/data/escola/alunos.csv")
#alunosDF: org.apache.spark.sql.DataFrame = [id_discente: string, nome: string ... 5 more fields]

4. Visualizar o esquema do alunosDF

#root
# |-- id_discente: string (nullable = true)
# |-- nome: string (nullable = true)
# |-- ano_ingresso: string (nullable = true)
# |-- periodo_ingresso: string (nullable = true)
# |-- nivel: string (nullable = true)
# |-- id_forma_ingresso: string (nullable = true)
# |-- id_curso: string (nullable = true)

5. Criar o DataFrame alunosDF para ler o arquivo “/user/aluno/<nome>/data/escola/alunos.csv” com a opção de Incluir o cabeçalho e inferir o esquema

alunosDF.show(3)
#val alunosDF = spark.read.option("header","true").option("inferSchema","true").csv("/user/aluno/shermila/data/escola/alunos.csv")


6. Visualizar o esquema do alunosDF
#alunosDF.printSchema
#root
# |-- id_discente: integer (nullable = true)
# |-- nome: string (nullable = true)
# |-- ano_ingresso: integer (nullable = true)
# |-- periodo_ingresso: integer (nullable = true)
# |-- nivel: string (nullable = true)
# |-- id_forma_ingresso: integer (nullable = true)
# |-- id_curso: integer (nullable = true)


7. Salvar o DaraFrame alunosDF como tabela Hive “tab_alunos” no banco de dados <nome>
#alunosDF.write.saveAsTable("shermila.tab_alunos")

8. Criar o DataFrame cursosDF para ler o arquivo “/user/aluno/<nome>/data/escola/cursos.csv” com a opção de Incluir o cabeçalho e inferir o esquema
#val cursosDF = spark.read.option("header","true").option("inferSchema","true").csv("/user/aluno/shermila/data/escola/cursos.csv")

#cursosDF.printSchema
#root
# |-- id_curso: integer (nullable = true)
# |-- id_unidade: integer (nullable = true)
# |-- codigo: string (nullable = true)
# |-- nome: string (nullable = true)
# |-- nivel: string (nullable = true)
# |-- id_modalidade_educacao: integer (nullable = true)
# |-- id_municipio: integer (nullable = true)
# |-- id_tipo_oferta_curso: integer (nullable = true)
# |-- id_area_curso: integer (nullable = true)
# |-- id_grau_academico: integer (nullable = true)
# |-- id_eixo_conhecimento: integer (nullable = true)
# |-- ativo: integer (nullable = true)


9. Criar o DataFrame alunos_cursosDF com o inner join do alunosDF e cursosDF quando o id_curso dos 2 forem o mesmo

#val alunos_cursosDF = alunosDF.join(cursosDF,"id_curso")


10. Visualizar os dados, o esquema e a quantidade de registros do alunos_cursosDF

#alunos_cursosDF.show(3)
#+--------+-----------+--------------------+------------+----------------+-----+-----------------+----------+--------+--------------------+-----+----------------------+------------+--------------------+-------------+-----------------+--------------------+-----+
#|id_curso|id_discente|                nome|ano_ingresso|periodo_ingresso|nivel|id_forma_ingresso|id_unidade|  codigo|                nome|nivel|id_modalidade_educacao|id_municipio|id_tipo_oferta_curso|id_area_curso|id_grau_academico|id_eixo_conhecimento|ativo|
#+--------+-----------+--------------------+------------+----------------+-----+-----------------+----------+--------+--------------------+-----+----------------------+------------+--------------------+-------------+-----------------+--------------------+-----+
#|   76995|      18957|ABELARDO DA SILVA...|        2017|               1|    G|            62151|       194|    null|LICENCIATURA EM C...|    G|                     1|        8550|                   4|     20000006|          8067070|                null|    1|
#|    3402|        553| ABIEL GODOY MARIANO|        2015|            null|    M|          2081113|       150|SVTIAGRO|TÉCNICO EM AGROPE...|    M|                     1|        9332|                null|         null|             null|             6264215|    1|
#|  759711|      17977|ABIGAIL ANTUNES S...|        2017|               1|    T|          2081111|       696| UGTCADM|TÉCNICO EM ADMINI...|    T|                     1|        9431|                null|         null|             null|              171158|    1|
#+--------+-----------+--------------------+------------+----------------+-----+-----------------+----------+--------+--------------------+-----+----------------------+------------+--------------------+-------------+-----------------+--------------------+-----+
#only showing top 3 rows


11. Clicar no botão de Enviar Tarefa, e enviar o texto: ok

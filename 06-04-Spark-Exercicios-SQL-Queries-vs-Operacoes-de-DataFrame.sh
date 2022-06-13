				Spark - Exercícios de SQL Queries vs Operações de DataFrame

Realizar as seguintes consultas usando SQL queries e transformações de DataFrame na tabela “tab_alunos” no banco de dados <nome>

1. Visualizar o id e nome dos 5 primeiros registros
#spark.sql("select id_discente,nome from tab_alunos limit 5").show
#+-----------+--------------------+
#|id_discente|                nome|
#+-----------+--------------------+
#|      18957|ABELARDO DA SILVA...|
#|        553| ABIEL GODOY MARIANO|
#|      17977|ABIGAIL ANTUNES S...|
#|      16613|ABIGAIL FERNANDA ...|
#|      17398|ABIGAIL JOSIANE R...|
#+-----------+--------------------+
#alunosHiveDF.select("id_discente","nome").limit(5).show
#+-----------+--------------------+
#|id_discente|                nome|
#+-----------+--------------------+
#|      18957|ABELARDO DA SILVA...|
#|        553| ABIEL GODOY MARIANO|
#|      17977|ABIGAIL ANTUNES S...|
#|      16613|ABIGAIL FERNANDA ...|
#|      17398|ABIGAIL JOSIANE R...|
#+-----------+--------------------+


2. Visualizar o id, nome e ano quando o ano de ingresso for maior ou igual a 2018

#spark.sql("select id_discente,nome,ano_ingresso from tab_alunos where ano_ingresso >= 2018").show
#alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018").show
#+-----------+--------------------+------------+
#|id_discente|                nome|ano_ingresso|
#+-----------+--------------------+------------+
#|      26880|ABIMAEL CHRISTOPF...|        2019|
#|      28508|   ABNER NUNES PERES|        2019|
#|      28071|ACSA ROBALO DOS S...|        2019|
#|      21968|AÇUCENA CARVALHO ...|        2018|
#|      22374|ADALBERTO LUFT LU...|        2018|
#|      26367|ADALBERTO SEIDEL ...|        2019|
#|      25120|ADÃO VAGNER DOS S...|        2018|
#|      24787|ADELITA ALVES SIL...|        2018|
#|      28001|ADEMIR LUIZ SCHEN...|        2019|
#|      21618|    ADENIR CALLEGARO|        2018|
#|      27346|        ADILSON HAAS|        2019|
#|      21569|ADILSON LOPES DA ...|        2018|
#|      24456|ADILSON MARTINS D...|        2018|
#|      24958|  ADIR JOSÉ HECHMANN|        2018|
#|      25805|ADRIANA CLARICE H...|        2018|
#|      27021|ADRIANA GÖTENS AN...|        2019|
#|      25968|ADRIANA MAGALHÃES...|        2018|
#|      27232|ADRIANA PAIVA GÜL...|        2019|
#|      21247|ADRIANA PERES FER...|        2018|
#|      27223|       ADRIANA PIRAN|        2019|
#+-----------+--------------------+------------+
#only showing top 20 rows

#spark.sql("select id_discente,nome,ano_ingresso from tab_alunos where ano_ingresso >= 2018 order by nome desc").show
#alunosHiveDf.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018").orderBy(alunosHiveDF("nome").desc).show
3. Visualizar por ordem alfabética do nome o id, nome e ano quando o ano de ingresso for maior ou igual a 2018
#alunosHiveDf.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018").orderBy(alunosHiveDF("nome").desc).show

4. Contar a quantidade de registros do item anterior
#spark.sql("select count(id_discente) from tab_alunos where ano_ingresso >= 2018").show
#+------------------+
#|count(id_discente)|
#+------------------+
#|              4266|
#+------------------+



5. Clicar no botão de Enviar Tarefa, e enviar o texto: ok

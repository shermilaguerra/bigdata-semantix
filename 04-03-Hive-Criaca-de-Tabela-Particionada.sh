#############################
                   Hive - Criação de Tabela Particionada
1. Criar o diretório “/user/aluno/<nome>/data/nascimento” no HDFS

#docker exec -it namenode hdfs dfs -mkdir /user/aluno/shermila/data/nascimento

2. Criar e usar o Banco de dados <nome>
 #docker exec -it namenode hdfs dfs -mkdir /user/aluno/shermila/data/nascimento

3. Criar uma tabela externa no Hive com os parâmetros:

#a) Tabela: nascimento
#b) Campos: nome (String), sexo (String) e frequencia (int)
#c) Partição: ano
#d) Delimitadores:
#i) Campo ‘,’
#ii)  Linha ‘\n’
#e) Salvar
#i) Tipo do arquivo: texto
#ii) HDFS: '/user/aluno/<nome>/data/nascimento’
#create external table nascimento(
#. . . . . . . . . . . . . . . .> nome string,
#. . . . . . . . . . . . . . . .> sexo string,
#. . . . . . . . . . . . . . . .> frequencia int
#. . . . . . . . . . . . . . . .> )
#. . . . . . . . . . . . . . . .> partitioned by (ano int)
#. . . . . . . . . . . . . . . .> row format delimited
#. . . . . . . . . . . . . . . .> fields terminated by ','
#. . . . . . . . . . . . . . . .> lines terminated by '\n'
#. . . . . . . . . . . . . . . .> stored as textfile
#. . . . . . . . . . . . . . . .> location'/user/aluno/shermila/data/nascimento';

4.Adicionar partição ano=2015


5.Enviar o arquivo local “input/exercises-data/names/yob2015.txt” para o HDFS no diretório /user/aluno/<nome>/data/nascimento/ano=2015
#alter table nascimento add partition(ano=2015);


para visualizar sair do hive:
#docker exec -it namenode bash
#hdfs dfs -ls /user/aluno/shermila/data
#hdfs dfs -ls /user/aluno/shermila/data/nascimento


6.Selecionar os 10 primeiros registros da tabela nascimento no Hive
#select * from nascimento limit 10;

7.Repita o processo do 4 ao 6 para os anos de 2016 e 2017.
no localhost:10000
    #alter table nascimento add partition(ano=2016);
    #alter table nascimento add partition(ano=2017);
    #select * from  nascimento where ano = 2016 limit 10;
    #select * from  nascimento where ano = 2017 limit 10;
  no hdfs para mostrar:
    #• hdfs dfs -put /input/exercises-data/names/yob2016.txt /user/aluno/shermila/data/nascimento/ano=2016
    #• hdfs dfs -put /input/exercises-data/names/yob2017.txt /user/aluno/shermila/data/nascimento/ano=2017
      



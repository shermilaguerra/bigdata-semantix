#############################
                      Hive - Criação de Tabela Raw               
1. Enviar o arquivo local “/input/exercises-data/populacaoLA/populacaoLA.csv” para o diretório no HDFS “/user/aluno/<nome>/data/populacao”
#hdfs dfs -mkdir /user/aluno/shermila/data/populacao
#hdfs dfs -put input/exercises-data/populacaoLA/populacaoLA.csv /user/aluno/shermila/data/populacao
#hdfs dfs -cat /user/aluno/shermila/data/populacao/populacaoLA.csv | head -n 3
2. Listar os bancos de dados no Hive
show databases;
3. Criar o banco de dados <nome>
4. Criar a Tabela Hive no BD <nome>
    • Tabela interna: pop
    • Campos:
        ◦ zip_code - int
        ◦ total_population - int
        ◦ median_age - float
        ◦ total_males - int
        ◦ total_females - int
        ◦ total_households - int
        ◦ average_household_size - float
    • Propriedades
        ◦ Delimitadores: Campo ‘,’ | Linha ‘\n’
        ◦ Sem Partição
        ◦ Tipo do arquivo: Texto
        ◦ tblproperties("skip.header.line.count"="1")’

create table  pop(
. . . . . . . . . . . . . . . .> zip_code int,
. . . . . . . . . . . . . . . .> total_population int,
. . . . . . . . . . . . . . . .> median_age float,
. . . . . . . . . . . . . . . .> total_males int,
. . . . . . . . . . . . . . . .> total_females int,
. . . . . . . . . . . . . . . .> total_households int,
. . . . . . . . . . . . . . . .> average_household_size float
. . . . . . . . . . . . . . . .> )
#. . . . . . . . . . . . . . . .> row format delimited
#. . . . . . . . . . . . . . . .> fields terminated by ','
#. . . . . . . . . . . . . . . .> lines terminated by '\n'
#. . . . . . . . . . . . . . . .> stored as textfile
#. . . . . . . . . . . . . . . .> tblproperties("skip.header.line.count"="1");
5. Visualizar a descrição da tabela pop
desc pop;
#desc formatted pop;



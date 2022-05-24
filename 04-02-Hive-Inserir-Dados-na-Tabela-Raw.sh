#############################
                   
                         Hive - Inserir Dados na Tabela Raw
1.Visualizar a descrição da tabela pop do banco de dados <nome>
2.Selecionar os 10 primeiros registros da tabela pop
#select * from pop limit 10;
3.Carregar o arquivo do HDFS “/user/aluno/<nome>/data/população/populacaoLA.csv” para a tabela Hive pop
#load data inpath '/user/aluno/shermila/data/populacao/populacaoLA.csv' overwrite into table pop;
4.Selecionar os 10 primeiros registros da tabela pop
#select * from pop limit 10;
5.Contar a quantidade de registros da tabela pop
#select count(*) from pop;



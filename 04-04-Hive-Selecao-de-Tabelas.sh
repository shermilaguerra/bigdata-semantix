#############################
Hive - Seleção de Tabelas

1. Selecionar os 10 primeiros registros da tabela nascimento pelo ano de 2016
#select * from  nascimento where ano = 2016 limit 10;
#select * from  nascimento where ano = 2017 limit 10;

2. Contar a quantidade de nomes de crianças nascidas em 2017

#select count(nome) as qtd from nascimento where ano = 2017;
#rpta:32469
#select sum(frequencia) as qtd from nascimento where ano = 2017;


3. Contar a quantidade de crianças nascidas em 2016
#select count(nome) as qtd from nascimento where ano = 2016;
#rpta:32469

4. Contar a quantidade de crianças nascidas por sexo no ano de 2015
#select sum(frequencia) as qtd from nascimento where ano = 2015 group by sexo;

5. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo

#select ano, sexo, sum(frequencia) as qtd from nascimento group by  ano, sexo order by ano desc;


6. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo com o nome iniciado com ‘A’
#select ano, sexo, sum(frequencia) as qtd from nascimento group by  ano, sexo order by ano desc;


7. Qual nome e quantidade das 5 crianças mais nascidas em 2016
#select nome, max(frequencia) as qtd from nascimento where ano=2016 group by nome order by qtd desc limit 5;


8. Qual nome e quantidade das 5 crianças mais nascidas em 2016 do sexo masculino e feminino
#select nome, max(frequencia) as qtd, sexo from nascimento where ano=2016 group by sexo, nome order by qtd desc limit 10;


9. Clicar no botão de Enviar Tarefa, e enviar o texto: ok



 
###################
comandos hdfs
hadoop fs ou hdfs dfs

hadoop fs –help 
hdfs dfs -help
hdfs dfs -help ls

hdfs dfs -mkdir
hdfs dfs -ls /
hdfs dfs -ls user
hdfs dfs rm
 docker exec -it namenode  bash

Comandos HDFS
1. Iniciar o cluster de Big Data
#    • cd docker-bigdata
#    •  sudo systemctl start docker
#    • docker-compose up -d
2. Baixar os dados dos exercícios do treinamento
#cd input
# sudo git clone https://github.com/rodrigo-reboucas/exercises-data.git
3. Acessar o container do namenode

4. Criar a estrutura de pastas apresentada a baixo pelo comando: $ hdfs dfs -ls -R /
user/aluno/
<nome>
data
recover
delete

5. Enviar a pasta “/input/exercises-data/escola” e o arquivo “/input/exercises-data/entrada1.txt” para  data
#hdfs dfs -put /input/exercises-data/entrada1.txt /user/aluno/shermila/data
6. Mover o arquivo “entrada1.txt” para recover

#hdfs dfs -mv /input/exercises-data/entrada1.txt /user/aluno/shermila/recover

7. Baixar o arquivo do hdfs “escola/alunos.json” para o sistema local /
#hdfs dfs -mv /user/aluno/shermila/data/entrada1.txt /user/aluno/shermila/recover

8. Deletar a pasta recover
#hdfs dfs -rm -R /user/aluno/shermila/recover

9. Deletar permanentemente o delete
#hdfs dfs -rm -skipTrash -R /user/aluno/shermila/delete

10. Procurar o arquivo “alunos.csv” dentro do /user
#hdfs dfs -find /user -name alunos.csv

11. Mostrar o último 1KB do arquivo “alunos.csv”
#hdfs dfs -tail /user/aluno/shermila/data/escola/alunos.csv

12. Mostrar as 2 primeiras linhas do arquivo “alunos.csv”
#hdfs dfs -cat /user/aluno/shermila/data/escola/alunos.csv | head -n 2

13. Verificação de soma das informações do arquivo “alunos.csv”
#hdfs dfs -checksum /user/aluno/shermila/data/escola/alunos.csv 

14. Criar um arquivo em branco com o nome de “test” no data
#hdfs dfs -touchz /user/aluno/shermila/data/test
#para ver: hdfs dfs -ls /user/aluno/shermila/data/test


15. Alterar o fator de replicação do arquivo “test” para 2
#hdfs dfs -setrep 2 /user/aluno/shermila/data/test
#para ver: hdfs dfs -ls /user/aluno/shermila/data/test
16. Ver as informações do arquivo “alunos.csv”
#help stat mostra todas as opções que podemos mostrar com stat
#hdfs dfs -help stat
#%r: fator replicação
#hdfs dfs -stat %r /user/aluno/shermila/data/escola/alunos.csv

17. Exibir o espaço livre do data e o uso do disco
#hdfs dfs -df -h  /user/aluno/shermila/data
#Filesystem              Size    Used  Available  Use%
#hdfs://namenode:8020  63.8 G  29.7 M      8.9 G    0%
#hdfs dfs -du -h  /user/aluno/shermila/data/
#hdfs dfs -du -h  /  

18. Clicar no botão de Enviar Tarefa, e em
viar o texto: ok
###################

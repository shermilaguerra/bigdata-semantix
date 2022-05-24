 
###################
cd docker-bigdata

#1. Iniciar o cluster de Big Data
docker-compose start

#2. Baixar os dados dos exercícios do treinamento
cd input
sudo git clone https://github.com/rodrigo-reboucas/exercises-data.git

##Lembre que a pasta input é um VOLUME!

#3. Acessar o container do namenode
docker container exec -ti namenode bash

#4. Criar a estrutura de pastas apresentada abaixo pelo comando:
##$ hdfs dfs -ls -R /
##user/aluno/
##  <nome>
##    data
##    recover
##    delete
hdfs dfs -ls -R /user/

Path='/user/aluno/Jon'; echo $Path
hdfs dfs -mkdir -p $Path/data $Path/recover $Path/delete

hdfs dfs -ls -R /user/aluno

#5. Enviar a pasta "/input/exercises-data/escola" e o arquivo "/input/exercises-data/entrada1.txt" para "data"
ls /input/

hdfs dfs -put /input/exercises-data/escola /user/aluno/Jon/data
hdfs dfs -put /input/exercises-data/entrada1.txt /user/aluno/Jon/data

hdfs dfs -ls /user/aluno/Jon/data

#6. Mover o arquivo "entrada1.txt" para recover
hdfs dfs -mv /user/aluno/Jon/data/entrada1.txt /user/aluno/Jon/recover

#7. Baixar o arquivo do hdfs "escola/alunos.json" para o sistema local /
hdfs dfs -get /user/aluno/Jon/data/escola/alunos.json /
ls

#8. Deletar a pasta recover
hdfs dfs -rm -r /user/aluno/Jon/recover

#9. Deletar permanentemente a pasta 'delete'
hdfs dfs -rm -r -skipTrash /user/aluno/Jon/delete

#10. Procurar o arquivo "alunos.csv" dentro do /user
hdfs dfs -find /user -name alunos.csv
##/user/aluno/Jon/data/escola/alunos.csv

#11. Mostrar o último 1KB do arquivo "alunos.csv"
hdfs dfs -tail /user/aluno/Jon/data/escola/alunos.csv

hdfs dfs -cat /user/aluno/Jon/data/escola/alunos.csv | tail -1
##1345,"PREDON DE SOUZA DA SILVA",2015,,M,37350,11442

#12. Mostrar as 2 primeiras linhas do arquivo "alunos.csv"
hdfs dfs -cat /user/aluno/Jon/data/escola/alunos.csv | head -2
hdfs dfs -cat /user/aluno/Jon/data/escola/alunos.csv | head -n 2

#13. Verificação de soma das informações do arquivo "alunos.csv"
hdfs dfs -checksum /user/aluno/Jon/data/escola/alunos.csv
##/user/aluno/Jon/data/escola/alunos.csv	MD5-of-0MD5-of-512CRC32C	000002000000000000000000164b9235a4d65a1e8ebfe12eb97ac471

#14. Criar um arquivo em branco com o nome de "test" no 'data'
hdfs dfs -touchz /user/aluno/Jon/data/test

hdfs dfs -cat /user/aluno/Jon/data/test

#15. Alterar o fator de replicação do arquivo "test" para 2
hdfs dfs -setrep 2 /user/aluno/Jon/data/test
##Replication 2 set: /user/aluno/Jon/data/test

hdfs dfs -stat %r /user/aluno/Jon/data/test

#16. Ver as informações do arquivo "alunos.csv"
hdfs dfs -help stat

File=/user/aluno/Jon/data/escola/alunos.csv; echo $File

hdfs dfs -stat $File
##2021-08-28 21:38:08
hdfs dfs -stat %r $File
##3
hdfs dfs -stat %o $File
##134217728

#17. Exibir o espaço livre e o uso do disco do 'data'
hdfs dfs -du -h /user/aluno/Jon/data/

hdfs dfs -df -h
###################

#############################
                             Sqoop
#------------------------Ingestão de dados
-processo de enviar/receber os dados locais para o sistema distribuido
-Data lake
  *batch:sqoop
  *stream:flume, kafka   
-Ferramenta para transferir dados entre o hadoop e banco de dados relacionais ou mainfrmes. sqoop="sql to hadoop".
***Importar dados de: Banco de dados relaciona(RDBS): Mysql, SQL Server, Oracle. Para o HDFS depois são criados as tabela em Hive ou HBase
   **Todos os dados estão no formato hdfs o que esta relacionado com MapReduce o qual pode ser processado em paralelo e os nos tem a propiedade tolerancia a falhas.
***Exporta dados
  * Armazenamento do hadoop para um RDBMs.
  
#docker exec -it database bash  
#root@database:/# 
  
###--My sql - verificar e instalar os banco de dados de testes
1. Copiar os dados do local para o contêiner database

#$ docker cp input/exercises-data/db-sql /database:/
#ls /db-sql/ #mostra os arquivos copiados
#para acessar ao mysql
#mysql -h localhost -u root -psecret
#show databases;
#drop database employees;
#mysql -psecret


2. Acessar o contêiner database

#$ docker exec -it database bash

3. Instalar Banco de Dados de testes

#Diretório /db-sql - BD employees (Já existe)
 # $ cd /db-sql  

 # $ mysql -psecret < employees.sql

Diretório /db-sql/sakila - BD sakila
$ #cd /db-sql/sakila/

$ #mysql -psecret < sakila-mv-schema.sql
$ #mysql -psecret < sakila-mv-data.sql
#use sakila;
#show tables;
#select * from rental limit 10;
#10 minutos
                         
                      



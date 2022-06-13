1.-Instalação do docker e docker-compose
Acesso: https://docs.docker.com/get-docker/ (Links para um site externo.)


2.-Baixar as imagens do mongo e mongo-express
#docker pull mongo
#docker pull mongo-express


docker pull mongo-express
#mostra as images

3.- Iniciar o MongoDB através do docker-compose
#pode se inicar assim tambem:

docker run mongo
#mas não estou renomeando nome conteiner, não estou criando volumen nem as portas

#sempre criar um docker compose para usuario e senha , para aumentar o numero de nós

docker-compose up -d
docker-compose up -d #-d não mostra o processo em background


4.-Listas as imagens em execução

docker ps #para ver quem esta ativo

docker ps -a #para ver quem esta inativo
docker-compose up #criar conexão sem volume

docker-compose start
docker-compose stop

5.-Listar os bancos de dados do MongoDB
6.-Visualizar através do Mongo Express os bancos de dados
Acesso: http://localhost:8081/





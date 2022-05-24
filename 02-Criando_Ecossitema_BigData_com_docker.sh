
git clone https://github.com/rodrigo-reboucas/docker-bigdata.git
cd docker-bigdata

#Baixar as imagens necessárias:
docker-compose pull

#Ver tamanho das imagens:
sudo du -hs /var/lib/docker/overlay2

#Iniciar o cluster Hadoop através do docker-compose , iniciar todos os serviços em background:
docker-compose up -d
#############################
#Para os serviços:
docker-compose stop


sudo systemctl stop docker
#############################

#Inicia os serviços:
sudo systemctl start docker
docker-compose up -d
 
 
#Inicia os serviços:
docker-compose start

#############################

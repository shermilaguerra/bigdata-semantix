                Atualização de Documentos
#use('shermila');
#https://www.youtube.com/watch?v=dqCOAawqvrY

#1. Mostrar todos os documentos da collection produto do banco de dados seu nome
db.produto.find({})

#2. Atualizar o valor do campo nome para “cpu i7” do id 1
db.produto.updatOne({_Id:1},{$set:{nome:"cpu i7"}})
#3. Atualizar o atributo quantidade para o tipo inteiro do id: 1
db.produto.updateOne({_id:1},{$set:{"qtd": 15}})
db.produto.updatOne({_Id:1})
# eu tive necessidade de apagar uma columna "set" que por error eu inseri
db.produto.updateOne({_id:3},{$unset:{"set":""}})

#4. Atualizar o valor do campo qtd para 30 de todos os documentos, com o campo qtd >= 30
db.produto.updateMany({qtd:{$gte: "50"}},{$set:{qtd: 30}})

#5. Atualizar o nome do campo “descricao.so” para “descricao.sistema” de todos os documentos
db.produto.updateMany({},{$rename:{"descricao.so":"descricao.sistema"}})


#6. Atualizar o valor do campo descricao.conexao para “USB 2.0” de todos os documentos, com o campo descricao.conexão = “USB”
db.produto.updateMany({"descricao.conexao":"USB"},{$set:{"descricao.conexao":"USB 2.0"}})


#7. Atualizar o valor do campo descricao.conexao para “USB 3.0” de todos os documentos, com o campo descricao.conexao = “USB 2.0” e adicionar o campo “data_modificacao”, com a data da atualização dos documentos
db.produto.updateMany({"descricao.conexao":"USB 2.0"},{$set:{"descricao.conexao":"USB 3.0"}, $currentDate: {data_modificacao: {$type:{"date"}}}})

#8. Atualizar um dos elementos do array descricao.sistema de “Windows” para “Windows 10” do id 3

db.produto.updateOne({_id:3,"descricao.sistema":"Windows"},{$set:{"descricao.sistema.$":"Windows 10"}})

db.produto.updateOne({_id:5,"descricao.sistema":"linux"},{$set:{"descricao.sistema.$":"Ubuntu 20.04"}})

#9. Acrescentar o valor “Linux” no array descricao.sistema do id 4

db.produto.updateOne({_id:4},{$push:{"descricao.sistema":"Linux"}})


#10. Remover o valor “Mac” no array descricao.sistema do id 3 e adicionar o campo “ts_modificacao”, com o timestamp da atualização dos documentos

db.produto.updateOne({_id:4},{$pull:{"descricao.sistema":"Windows"}})

db.produto.updateOne({_id:4},{$pull:{"descricao.sistema":"Windows 7", currentDate: {ts_modificado:{$type:"timestamp"} }}})
#{ "_id" : 4, "nome" : "hd externo", "qtd" : "20", "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 8", "Linux" ] }, "data_modificacao" : ISODate("2022-06-10T10:57:20.395Z") }


db.produto.updateOne({_id:5},{$pull:{"descricao.sistema":"linux 7", $currentDate: {ts_modificado:{$type:"timestamp"} }}})








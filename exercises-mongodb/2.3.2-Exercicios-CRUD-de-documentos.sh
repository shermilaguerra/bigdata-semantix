       #CRUD de Documentos

#1. Criar a collection teste no banco de dados seu nome

db.createCollection('collectionTeste')


#2. Inserir o seguinte documento:

#Campo: usuario, valor: Semantix
#Campo: data_acesso, valor: data atual no formato ISODate

db.collectionTeste.({usuario:'Semantix',data_acesso: new Date()})

#3. Buscar todos os documentos do ano >= 2020

db.collectionTeste.find({data_acesso: {$gte: new Date("2020")}})
{ "_id" : ObjectId("62a33472d24ff19c3f1bf948"), "usuario" : "Semantix", "data_acesso" : ISODate("2022-06-10T12:09:22.607Z") }


#4. Atualizar o campo “data_acesso” para timestamp com o valor da atualização do usuario Semantix

db.collectionTeste.updateOne({usuario: "Semantix"}, {$currentDate: {data_acesso: {$type: "timestamp"}}})


#5. Buscar todos os documentos

db.collectionTeste.find()
 db.collectionTeste.updateOne({"_id" : ObjectId("62a33472d24ff19c3f1bf948") })


#6. Deletar o documento criado pelo id

db.collectionTeste.deleteOne({"_id" : ObjectId("62a33472d24ff19c3f1bf948") })
{ "acknowledged" : true, "deletedCount" : 1 }


#7. Deletar a collection

db.collectionTeste.drop()





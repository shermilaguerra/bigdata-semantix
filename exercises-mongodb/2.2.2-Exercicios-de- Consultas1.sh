                    Consulta básica em documentos

1. Mostrar todos os documentos da collection produto
#use shermila
#show collections
#db.produto.find({})


2. Pesquisar na collection produto, os documentos com os seguintes atributos:

a) Nome = mouse

b) Quantidade = 20 e apresentar apenas o campo nome

#db.produto.find({qtd:"20"},{_id: 0, nome: 1})

c) Quantidade <= 20 e apresentar apenas os campos nome e qtd
#igual a 20
#db.produto.find({qtd:{$eq: "20"}},{ nome: 1})

#db.produto.find({qtd:{$lte: "20"}},{ nome: 1, qtd:1})


d) Quantidade entre 10 e 20

#db.produto.find({qtd:{$gte: "10", $lte:"20"}})


e) Conexão = USB e não apresentar o campo _id e qtd
#db.produto.find({'descricao.conexao':"USB"})
#db.produto.find({'descricao.conexao':"USB"},{_id: 0, qtd: 0})


f) SO que contenha “Windows” ou “Windows 10”
# db.produto.find({'descricao.so': {$in: ["Windows 10", "Windows 8"]}})






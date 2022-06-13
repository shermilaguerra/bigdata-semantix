Comando Básicos para BD, Collections e Documentos

1. Criar o banco de dados com seu nome.

#use shermila

2. Listar os banco de dados.
show dbs


3. Criar a collection produto no bd com seu nome.
#db. tab mostra todas as opções
# use shermila

db.createCollection('produto')
4. Listar os banco de dados.
#show dbs

5. Listar as collections.
#show collections


6. Inserir os seguintes documentos na collection produto:

_id: 1, "nome": “cpu i5", "qtd": "15“
_id: 2, nome: “memória ram", qtd: 10, descricao: {armazenamento: “8GB”, tipo:“DDR4“}
_id: 3, nome: "mouse", qtd: 50, descricao: {conexao: "USB", so: ["Windows", "Mac", "Linux"]}
_id: 4, nome: “hd externo", "qtd": 20, descricao: {conexao: “USB”, armazenamento: “500GB”, so: [“Windows 10”, “Windows 8”, “Windows 7”]}
#db.produto.insertOne(
#... {
#... _id: 1, "nome":"cpu i5","qtd":"15" 
#... }
#... )
#db.produto.insertOne( { _id: 2, nome:"memoria ram","qtd":"10", descricao:{armazenamento:"8GB", tipo:"DDR4"}})
#db.produto.insertOne( { _id: 3, nome:"mouse","qtd":"50", descricao:{conexao:"USB", so:"DDR4"}})
#db.produto.insertOne( { _id: 3, nome:"hd externo","qtd":"20", descricao:{conexao: "USB", armazenamento: "500GB", so: ["Windows 10", "Windows 8", "Windows 7"]}})

7. Mostrar todos os documentos.

db.produto.find()



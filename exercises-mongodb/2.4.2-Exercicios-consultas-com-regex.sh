                Atualização de Documentos
#use('shermila');
#https://www.youtube.com/watch?v=dqCOAawqvrY

				#Consultas com Regex
				
#regra geral				
db.collection.find({field: {$regex//}})				

1. Mostrar todos os documentos da collection produto do banco de dados seu nome
#db.produto.find({})


2. Buscar os documentos com o atributo nome,  que contenham a palavra “cpu”
#db.produto.find({nome: {$regex: /hd/}})


3. Buscar os documentos  com o atributo nome, que começam por “hd” e apresentar os campos nome e qtd

#db.produto.find({nome: {$regex: /externo/}}, {nome:1, qtd:1})

4. Buscar os documentos  com o atributo descricao.armazenamento, que terminam com “GB” ou “gb” e apresentar os campos nome e descricao

#db.produto.find({"descricao.armazenamento": {$regex: /gb/i}})
##db.produto.find({"descricao.armazenamento": {$regex: /gb/i}.{nome: 1, descricao: 1}})

5. Buscar os documentos  com o atributo nome, que contenha a palavra memória, ignorando a letra “o”
# db.produto.find({nome: {$regex: /mem.ria/}})

6. Buscar os documentos  com o atributo qtd  que contenham valores com letras, ao invés de números.
#db.produto.find({qtd: {$regex: /[a-z]/}})


7. Buscar os documentos com o atributo descricao.sistema, que tenha exatamente a palavra “Windows”

#eu não é necessario usar reger para esta operação
#db.produto.find({"descricao.sistema":{$regex:/Windows 8/}})



professor:
 #db.produto.find({"descricao.sistema":{$regex:/^Windows 8$/}})


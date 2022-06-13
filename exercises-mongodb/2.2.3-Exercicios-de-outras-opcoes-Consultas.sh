                  Outras Opções com Consultas

1. Mostrar todos os documentos da collection produto.
#db.produto.find()

2. Realizar as seguintes pesquisas na collection produto:

a) Mostrar os documentos ordenados pelo nome em ordem alfabética.
#db.produto.find().sort({nome: 1}).pretty()

b) Mostrar os 3 primeiros documentos ordenados por nome e quantidade.

db.produto.find().sort({nome: 1, qtd: 1}).limit(3)

c) Mostrar apenas 1 documento que tenha o atributo Conexão = USB.
#db.produto.findOne({'descricao.conexao':'USB'})

d) Mostrar os documentos de tenham o atributo conexão = USB E quantidade menor que 25.

#db.produto.findOne({'descricao.conexao':'USB', qtd:{$lt: "25"} })


e) Mostrar os documentos de tenham o atributo conexão = USB OU quantidade menor que 25.
#db.produto.findOne({$or:[{'descricao.conexao':'USB'}, {qtd:{$lt: "25"}}]})


f) Mostrar apenas os id dos documentos de tenham o atributo conexão = USB ou quantidade menor que 25.
#db.produto.findOne({$or:[{'descricao.conexao':'USB'}, {qtd:{$lt: 25}}]},{_id:1})






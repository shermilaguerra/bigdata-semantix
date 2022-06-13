                Atualização de Documentos
#use('shermila');
#https://www.youtube.com/watch?v=dqCOAawqvrY

				#Index e plano de execução

1. Mostrar todos os documentos da collection produto do banco de dados seu nome
#db.produto.find({})


2. Criar o index “query_produto” para pesquisar o campo nome do produto em ordem alfabética
# db.produto.createIndex({nome: 1},{name: "query_produto"})
{
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"createdCollectionAutomatically" : false,
	"ok" : 1
}


3. Pesquisar todos os índices da collection produto
db.produto.getIndexes()
[
	{
		"v" : 2,
		"key" : {
			"_id" : 1
		},
		"name" : "_id_"
	},
	{
		"v" : 2,
		"key" : {
			"nome" : 1
		},
		"name" : "query_produto"
	}
]


4. Pesquisar todos os documentos da collection produto
#db.produto.find({})

5. Visualizar o plano de execução do exercício 4

#db.produto.find().explain()
{
	"explainVersion" : "1",
	"queryPlanner" : {
		"namespace" : "shermila.produto",
		"indexFilterSet" : false,
		"parsedQuery" : {
			
		},
		"queryHash" : "8B3D4AB8",
		"planCacheKey" : "D542626C",
		"maxIndexedOrSolutionsReached" : false,
		"maxIndexedAndSolutionsReached" : false,
		"maxScansToExplodeReached" : false,
		"winningPlan" : {
			"stage" : "COLLSCAN",
			"direction" : "forward"
		},
		"rejectedPlans" : [ ]
	},
	"command" : {
		"find" : "produto",
		"filter" : {
			
		},
		"$db" : "shermila"
	},
	"serverInfo" : {
		"host" : "763ba4483409",
		"port" : 27017,
		"version" : "5.0.9",
		"gitVersion" : "6f7dae919422dcd7f4892c10ff20cdc721ad00e6"
	},

6. Pesquisar todos os documentos da collection produto, com uso da index “query_produto”
#db.produto.find().hint({nome:1})
#reparar que não esta sequencia mas esta em orden alfabetica(por aqui já veio que index esta en nome)
{ "_id" : 1, "nome" : "cpu i5", "qtd" : 15 }
{ "_id" : 4, "nome" : "hd externo", "qtd" : "20", "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "Windows 8", "Linux" ] }, "data_modificacao" : ISODate("2022-06-10T10:57:20.395Z") }
{ "_id" : 5, "nome" : "hd externo", "qtd" : 12, "descricao" : { "conexao" : "USB 3.0", "armazenamento" : "500GB", "sistema" : [ "ubuntu 20", "Ubuntu 20.04" ] }, "data_modificacao" : ISODate("2022-06-10T10:57:20.395Z") }
{ "_id" : 2, "nome" : "memoria ram", "qtd" : "10", "descricao" : { "armazenamento" : "8GB", "tipo" : "DDR4" } }
{ "_id" : 3, "nome" : "mouse", "qtd" : 30, "descricao" : { "conexao" : "USB 3.0", "sistema" : "DDR4" }, "data_modificacao" : ISODate("2022-06-10T10:57:20.394Z") }


7. Visualizar o plano de execução do exercício 7

#db.produto.find().hint({nome:1}).explain()
{
	"explainVersion" : "1",
	"queryPlanner" : {
		"namespace" : "shermila.produto",
		"indexFilterSet" : false,
		"parsedQuery" : {
			
		},
		"queryHash" : "8B3D4AB8",
		"planCacheKey" : "D542626C",
		"maxIndexedOrSolutionsReached" : false,
		"maxIndexedAndSolutionsReached" : false,
		"maxScansToExplodeReached" : false,
		"winningPlan" : {
			"stage" : "FETCH",
			"inputStage" : {
		#		"stage" : "IXSCAN",
		#		"keyPattern" : {
	        #			"nome" : 1
				},
				"indexName" : "query_produto",
				"isMultiKey" : false,
				"multiKeyPaths" : {
					"nome" : [ ]
				},
				"isUnique" : false,
				"isSparse" : false,
				"isPartial" : false,
				"indexVersion" : 2,
				"direction" : "forward",
				"indexBounds" : {
					"nome" : [
						"[MinKey, MaxKey]"
					]
				}
			}
		},
		"rejectedPlans" : [ ]
	},


8. Remover o index “query_produto”

#db.produto.dropIndex({nome:1})
{ "nIndexesWas" : 2, "ok" : 1 }


9. Pesquisar todos os índices da collection produto

db.produto.getIndexes()
[ { "v" : 2, "key" : { "_id" : 1 }, "name" : "_id_" } ]








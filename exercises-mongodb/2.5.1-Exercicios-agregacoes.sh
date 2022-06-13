                Atualização de Documentos
#use('shermila');
#https://www.youtube.com/watch?v=dqCOAawqvrY

				Agregações de Match, Group, Sort e Limit

 

1. Crie o banco de dados escola

2. Crie a collection alunos no banco de dados escola

3. Importe o arquivo “dataset/alunos.csv” para a collection alunos, com os seguintes atributos:

id_discente: Number
nome: String
ano_ingresso: Number
nivel: String
id_curso: Number
Arquivos para Dataset

#4. Visualizar os valores únicos do “nivel” de cada “ano_ingresso”

{
  _id:"$ano_ingresso",
  fieldN: {
   $addToSet:"$nivel"
  }
}

#5. Calcular a quantidade de alunos matriculados por cada “id_curso”

{
  _id:"$id_curso",
  qtd_curso: {
   $sum:1
  }
}

#6. Calcular a quantidade de alunos matriculados por “ano_ingresso” no "id_curso“: 1222
#match
{
  "id_curso":1222
}
#group

{
  _id: "$ano_ingresso",
  qtd_curso: {
    $sum:1
  }
}

#7. Visualizar todos os documentos do “nível”: “M”
#match
{
  "nivel":"M"
}

#group
{
  _id: "$id_curso",
  ultimo_curso: {
    $max:"$ano_ingresso"
  }
}

#8. Visualizar o último ano que teve cada curso (id_curso) dos níveis “M”

#match
{
  "nivel":"M"
}

#group
{
  _id: "$id_curso",
  ultimo_curso: {
    $max:"$ano_ingresso"
  }
}

#9. Visualizar o último ano que teve cada curso (id_curso) dos níveis “M”, ordenados pelos anos mais novos de cada curso

#match
{
  "nivel":"M"
}

#group
{
  _id: "$id_curso",
  ultimo_curso: {
    $max:"$ano_ingresso"
  }
}
#$sort
{
  "ultimo_ano_curso":-1
}

#10. Visualizar o último ano que teve os 5 últimos cursos (id_curso) dos níveis “M”, ordenados pelos anos mais novos
#match
{
  "nivel":"M"
}

#group
{
  _id: "$id_curso",
  ultimo_curso: {
    $max:"$ano_ingresso"
  }
}
#limit
5

#############################
                             Sqoop
Todos os comandos precisam ser executados pelo Sqoop.

1. Mostrar todos os databases
#sqoop list-databases --connect jdbc:mysql://database --username root --password secret
#information_schema
#employees
#hue
#mysql
#performance_schema
#sakila
#sys

2. Mostrar todas as tabelas do bd employees
#sqoop list-tables --connect jdbc:mysql://database/employees --username root --password secret
#current_dept_emp
#departments
#dept_emp
#dept_emp_latest_date
#dept_manager
#employees
#employees_2
#titles


3. Inserir os valores ('d010', 'BI') na tabela departments do bd employees
#mostrar o conteudo da tabela
#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from departments limit 5"
#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "insert into departments values('d010', 'BI')"
#INFO tool.EvalSqlTool: 1 row(s) updated.




4. Pesquisar todos os registros da tabela departments
#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from departments"
#-------------------------------
#| dept_no | dept_name            | 
#-------------------------------
#| d010 | BI                   | 
#| d009 | Customer Service     | 
#| d005 | Development          | 
#| d002 | Finance              | 
#| d003 | Human Resources      | 
#| d001 | Marketing            | 
#| d004 | Production           | 
#| d006 | Quality Management   | 
#| d008 | Research             | 
#| d007 | Sales                | 
#-------------------------------


5. Criar a tabela benefits(cod int(2)  AUTO_INCREMENT PRIMARY KEY, name varchar(30)) no bd employees
#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "create table benefits(cod int(2)  AUTO_INCREMENT PRIMARY KEY, name varchar(30))"

6. Inserir os valores (null,'food vale') na tabela benefits

#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "insert into benefits values(null, 'food vale')"
# INFO tool.EvalSqlTool: 1 row(s) updated.

7. Pesquisar todos os registros da tabela benefits
#sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from benefits"
#-----------------------------
#| cod | name                 | 
#-----------------------------
#| 1  | food vale            | 
#-----------------------------

          
                      



use master
go

drop database tarefas
go 

create database tarefas
go

use tarefas
go


create table pessoas (
id int primary key identity (1,1),
nome varchar(100),
email varchar(100),
sexo varchar(20)
)

create table tarefa (
id int primary key identity (1,1),
titulo varchar(100) not null,
prazo_estimado date,
descricao varchar(250),
data_inicio date not null,
data_termino date
)

create table rel_tarefa_pessoa (
id int primary key identity (1,1),
id_tarefa int,
id_pessoas int,
foreign key (id_pessoas) references pessoas (id),
foreign key (id_tarefa) references tarefa (id)
)

create table metodologia (
id int primary key identity (1,1),
titulo varchar(100),

foreign key (id) references tarefa (id)
)
go


insert into pessoas (nome, email, sexo)
values 
('Julia','pessoa1@hotmail.com','feminino'),
('Maria','pessoa2@hotmail.com','feminino'),
('Larissa','pessoa3@hotmail.com','feminino'),

-- Tarefas atrasadas.
('Matheus','pessoa4@hotmail.com','masculino'), 

-- Não fazem parte de nenhuma tarefa.
('Thiago','pessoa5@hotmail.com','masculino'),
('Nelson','pessoa6@hotmail.com','masculino')


insert into tarefa
values 
('Tarefa 1','2018-07-08','Descricao tarefa 1','2018-07-08','2018-07-08'),
('Tarefa 2','2018-07-08','Descricao tarefa 2','2018-07-08','2018-07-08'),

-- Tarefas atrasadas.
('Tarefa 3','2018-07-08','Descricao tarefa 3','2018-07-08','2018-07-09'),
('Tarefa 4','2018-07-08','Descricao tarefa 4','2018-07-05','2018-07-09')

insert into rel_tarefa_pessoa
values 
-- Tarefa 1 > Julia
(1,1),

-- Tarefa 1 > Maria
(1,2),

-- Tarefa 2 > Larissa
(2,3),

-- Tarefa 3 > Thiago
(3,4),

-- Tarefa 4 > Thiago
(4,4)

insert into metodologia (titulo)
values 
('SQLSQLSQL'),
('SQLSQLSQL'),
('SQLSQLSQL'),
('End')
go

select * from rel_tarefa_pessoa
select * from pessoas
select * from metodologia
select * from tarefa

-- 1 > Primeiro Exercício 
select p.nome, r.id_tarefa
from pessoas as p
left join rel_tarefa_pessoa as r
on r.id_pessoas = p.id where r.id_tarefa is null
go

-- 2 > Segundo Exercício
select count(titulo) as 'Qtd utilizada', titulo as 'Metodologia'
from metodologia group by titulo order by count(titulo) DESC
go

-- 3 > Terceiro Exercício
create view homens as 
select count(*) as 'Homens'
from pessoas as p
join rel_tarefa_pessoa as r
on p.id = r.id_pessoas where p.sexo = 'masculino'
go

create view mulheres as
select count(*) as 'Mulheres'
from pessoas as p
join rel_tarefa_pessoa as r
on p.id = r.id_pessoas where p.sexo = 'feminino'
go

select * from homens, mulheres

-- 4 > Quarto Exercício
select p.nome as 'Nome', t.prazo_estimado as 'Prazo estimado', t.data_termino as 'Termino'
from pessoas as p
join rel_tarefa_pessoa as r
on p.id = r.id_pessoas
join tarefa as t
on r.id_tarefa = t.id where t.data_termino > t.prazo_estimado
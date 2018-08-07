use master 
use aula0708

/*

create table tarefa (
id_tarefa int primary key identity(1,1),
titulo nvarchar (100) not null,
prazoestimado varchar (100),
descricao varchar (100),
datainicio date not null,
datatermino date )

create table rel_tarf_pessoas  (
id int primary key identity(1,1),
id_tarefa int,
id_pessoa int )

create table metodologia (
id_metodologia int primary key identity(1,1),
titulo_metodologia nvarchar (100) ) 
*/

create table
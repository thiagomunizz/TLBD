USE Master;
GO
DROP DATABASE tarefas;
GO

create table tb_pessoas (
id_pessoas int primary key identity(1,1),
nome nvarchar (100) not null,
email varchar (100) not null,
sexo varchar (50) not null )                                           
    


create table tb_tarefa (
id_tarefa int primary key identity(1,1),
titulo nvarchar (100) not null,
prazoestimado varchar (100),
descricao varchar (100),
datainicio date not null,
datatermino date )

create table tb_rel_tarf_pessoas  (
id_rel_tarf_pessoas int primary key identity(1,1),
id_tarefa int,
id_pessoas int )

create table tb_metodologia (
id_metodologia int primary key identity(1,1),
titulo_metodologia nvarchar (100) ) 


/*INSERT tb_pessoas*/

insert into tb_pessoas (nome, email, sexo)
values ('Matheus Duraes','matheusduraes@gmail.com','Masculino'), ('Nelson Youssif','nelsonyoussif@yahoo.com','Masculino'), ('Larissa Oliveira', 'larissaoliveira@hotmail.com','Feminino'), ('José Carlos','josecarlos@hotmail.com','Masculino'), ('Débora Moraes','deboramoraes@gmail.com.br','Feminino')


select * from tb_pessoas

/*INSERT tb_tarefa*/

insert into tb_tarefa
values ('Montar','5 minutos','montagem simples','14/08/18','14/08/18')

select * from tb_tarefa



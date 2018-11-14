use master
drop database aula
create database aula
use aula


create table funcionario (
id_func int primary key identity (1,1),
nome_func varchar (200) )


create table departamento (
id_dpto int primary key identity (1,1),
nome_dpto varchar (200) )


begin transaction insert into departamento (nome_dpto) values ('RH') insert into funcionario (nome_func) values ('Thiago') commit

select * from departamento
select * from funcionario
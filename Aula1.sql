use master
drop database aulabanco
create database aulabanco
use aulabanco
go

create table tb_clientes(
id_cliente int NOT NULL PRIMARY KEY IDENTITY (1,1),
nome varchar(100),
endereco varchar(500),
fone nvarchar,
email varchar(100)
)

create table tb_hardware(
id_hardware int NOT NULL PRIMARY KEY IDENTITY (1,1),
descricao varchar,
preco float,
qtde int,
qtde_mini int
)

create table tb_vendas(
id_venda int NOT NULL PRIMARY KEY IDENTITY (1,1),
id_cliente int,
data date,
valor_total float,
desconto float,
valor_pago float,
)

create table tb_vendas_itens(
id_item int,
id_venda int,
id_hardware int,
id_cliente int,
qtde_item int,
total_itens int
)

alter table tb_vendas
add constraint fk_id_cliente
foreign key (id_cliente)
references tb_clientes(id_cliente)

alter table tb_vendas
add constraint fk_id_harware
foreign key (id_cliente)
references tb_hardware(id_hardware)

alter table tb_vendas_itens
add constraint fk_id_venda
foreign key (id_venda)
references tb_vendas(id_venda)

insert into tb_clientes (id_cliente,nome, endereco, fone, email)
values ('joao', 'rua1', '23', 'a@b') 
 
insert into tb_vendas (id_cliente)
values (1)

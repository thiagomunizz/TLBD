use master 
drop database lojainfo
create database lojainfo
use lojainfo

create table tb_clientes (
id_cliente int primary key identity(1,1) not null,
nome nvarchar(80),
endereco nvarchar(50),
fone nvarchar(20),
email nvarchar(70)

)
go

create table tb_hardware (
id_hardware int primary key identity(1,1) not null,
descricao nvarchar(200),
preco int,
qtde int,
qtde_min int
) 
go

create table tb_vendas (
id_vendas int primary key identity(1,1) not null,
id_cliente int,
data date,
valor_total int,
desconto int,
valor_pago int
)
go

create table tb_vendas_itens (
id_item int primary key identity(1,1) not null,
id_vendas int,
id_hardware int, 
qtde_item int,
total_item int
)
go

alter table tb_vendas add constraint fk_id_cliente foreign key (id_cliente) references tb_clientes (id_cliente)
alter table tb_vendas_itens add constraint fk_id_vendas foreign key (id_vendas) references tb_vendas (id_vendas)
alter table tb_vendas_itens add constraint fk_id_hardware foreign key (id_hardware) references tb_hardware (id_hardware)

insert into tb_clientes(nome,endereco,fone,email)
values('Matheus','Rua 01','01234567','email_1@gmail.com')

insert into tb_clientes(nome,endereco,fone,email)
values('Carlos','Rua 02	','12345678','email_2@gmail.com')

insert into tb_clientes(nome,endereco,fone,email)
values('João','Rua 03 ','23456789','email_3@gmail.com')

insert into tb_clientes(nome,endereco,fone,email)
values('Vagner','Rua 04 ','34567890','email_4@gmail.com')

insert into tb_clientes(nome,endereco,fone,email)
values('welligton','Rua 05','45678901','email_5@gmail.com')

insert into tb_hardware(descricao,preco,qtde,qtde_min)
values('Placa Mãe','150','45','05')

insert into tb_hardware(descricao,preco,qtde,qtde_min)
values('Placa Mãe','150','45','05')

insert into tb_hardware(descricao,preco,qtde,qtde_min)
values('Mouse','20','45','05')

insert into tb_hardware(descricao,preco,qtde,qtde_min)
values('Teclado','20','45','05')

insert into tb_vendas(id_cliente,valor_total,data,desconto,valor_pago)
values(1,400,'19/09/2018',50,350)

insert into tb_vendas(id_cliente,valor_total,data,desconto,valor_pago)
values(2,800,'2018-09-19',30,770)

insert into tb_vendas(id_cliente,valor_total,data,desconto,valor_pago)
values(3,900,'2018-09-19',20,880)

insert into tb_vendas(id_cliente,valor_total,data,desconto,valor_pago)
values(5,1000,'2018-09-19',15,985)

select * from tb_clientes
select * from tb_hardware
select * from tb_vendas
select * from tb_vendas_itens
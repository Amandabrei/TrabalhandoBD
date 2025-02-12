-- explorando os comandos ddl 
-- está com os selects junto

select now() as Timestamp;


create database if not exists manipulation;
use manipulation;

create table bankAccounts(
	Id_account int auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint identification_account_constraint unique (Ag_num, Ac_num)
);

insert into bankAccounts (Ag_num, Ac_num, Saldo) values (156, 264358, 0);
select * from bankAccounts;

alter table bankAccounts add LimiteCredito float not null default 500.00;

alter table bankAccounts add email varchar(60);

-- para retirar o email, pode usar alter table pode modificar (nome_tabela modify) coluna ou retirar, 
-- pode adicionar uma constraint (add_constraint_nome)

alter table bankAccounts drop column email;

desc bankAccounts;

create table bankClient(
	Id_client int auto_increment,
    ClientAccount int,
    Cpf varchar(11) not null,
    Rg varchar(9) not null,
    Nome varchar(50) not null,
	Endereço varchar(100) not null,
    Renda_mensal float,
    primary key (iD_Client, ClientAccount),
    constraint fk_account_client foreign key (ClientAccount) references bankAccounts(Id_account)
    on update cascade
);

alter table bankClient add UFF char(2) not null default 'RJ';

insert into bankClient (ClientAccount, Cpf, Rg, Nome, Endereço, Renda_mensal) values(1, 98798798709, 09867098, 'fulano', ' rua 10', 6500.6);
select * from bankClient;

update bankClient set UFF = 'MG' where Id_client = 3;
select * from bankClient;

create table bankTransactions(
	Id_transactions int auto_increment primary key,
    Ocorrencia datetime,
    Status_transaction varchar(20),
    Valor_transferido float,
    Source_account int,
    constraint fk_source_transaction foreign key (Source_account) references
    bankAccount(id_Account),
    constraint fk_destionation_transaction foreign key (destination_account) references
    bankAccounts(id_Account)
);

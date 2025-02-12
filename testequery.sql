show databases;
create database if not exists first_example;
use first_example;
CREATE TABLE person (
	person_id smallint unsigned,
	fname varchar (20),
	lname varchar (20),
	gender enum('M','F'),
	birth_date DATE,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorte_food_person_id foreign key (person_id) 
    references person(person_id)
);

desc favorite_food;
show databases;
desc information_schema.table_constraints;
select * from information_schema.table_constraints
where constraint_schema = 'first_example';

desc person;

insert into person values ('1','Carolina','Silva','F','1978-08-21',
							'rua tal', 'Cidade J', 'Brasil','38400386');
                            ('2','Luiz','Silva','M','1982-05-10',
							'rua TT', 'Cidade F', 'Brasil','7600386');
                            ('3','Pedro','Bastos','M','2008-07-08',
							'rua teste', 'Cidade K', 'Brasil','68500324');
                            ('4','Roger','Rodrigues','M','1977,02,01',
							'rua U', 'Cidade T', 'Brasil','54400324');
                            ('5','Naty','Vily','F','2010-12-08',
							'rua BB', 'Cidade A', 'Brasil','21500324');
                            ('6','Maya','Lima','F','2000-02-09',
							'rua Que', 'Cidade M', 'Brasil','37500324');
select * from person;

delete from person where person_id = 4 
or person_id =6;

desc favorite_food;

insert into favorite_food values 	(1, 'lasanha'),
									(2, 'rosca'),
                                    (3, 'carne assada'),
                                    (5, 'fetuccine');
select * from favorite_food;
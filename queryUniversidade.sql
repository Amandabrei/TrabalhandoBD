-- create database company;
create schema if not exists company_constraints;
use company_constraints;

-- drop table employee;

select * from information_schema.table_constraints
	Where constraint_schema = 'company_constraints';
    
    
-- restrição atribuida a um dominio
-- create domain D_num as int check(D_num > 0 and D_num < 21);


create table employee(
	Fname varchar(15) NOT NULL,
	Minit char,
	Lname varchar(15) NOT NULL,
	Ssn char(9) NOT NULL,
	Bdate date,
	Address varchar(30),
	Sexo char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int NOT NULL,
    constraint chk_salary_employee check (Salary > 2000.0),
	constraint pk_employee primary key (Ssn)
);

alter table empoyee
	add constraint fk_employee
    foreign key (Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;
    
alter table employee modify Dno int not null default 1;

desc employee; 
   
create table departament(
	Dname varchar(15) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9),
    Mgr_start_date date,
    constraint chk_datedept check (dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

-- 'def' , 'company_constraints' , departament_ibfk_1' , company_constraints' , 'departament' , 'FOREIG KEY' , 'YES'
-- modificar uma costraint: drop e add

alter table departament drop constraint departament_ibfk_1;
alter table departament
		add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
        on update cascade;

desc departament;

create table dept_locations(
	Dnumber int NOT NULL,
    Dlocation varchar(15) NOT NULL,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint pk_dept_locations foreign key (Dnumber) references departament(Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;

alter table dept_locations
		add constraint fk_dept_locations foreign key(Dnumber) references employee(Dnumber)
        on delete cascade
        on update cascade;

create table project(
	Pname varchar(15) NOT NULL,
    Pnumber int NOT NULL,
    Plocation varchar(15),
    Dnum int NOT NULL,
    primary key (Pnumber),
    constraint unique_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) NOT NULL,
    Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    primary key (Essn, Pno),
    constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_project_works_on foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) NOT NULL,
    Dependent_name varchar(15) NOT NULL,
	Sexo char, -- F ou M
    Bdate date,
    Relationship varchar(8),
    Age int not null,
	constraint chk_age_dependent  check (Age < 22),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

show tables;
desc dependent;

-- na linha abaixo se quiser ver todas as PK usa referencials e se quiser 
-- e se quiser puxar todas as restrições usa table

    


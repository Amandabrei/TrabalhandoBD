-- inserção de dados no bd company

use company_constraints;
show tables;

-- load data infile 'path' into table employee
-- 	fields terminated by ','
--    lines terminated by ';'
--    ;

select * from works_on;
insert into employee values('John', 'B', 'Smith', 123456789, '1977-07-10','876-Engrad-LongBrach-NJ', 'M', 34000, null,5),
							('Carol', 'A', 'Rosa', 222233334, '1978-01-09', '731-Fondren-Houston-TX', 'F', 50000, null,5),
							('Alicia', 'C', 'Luz', 444455566, '1978-01-09', '731-Fondren-Houston-TX', 'F', 20000, null,4),
							('Jennifer', 'D', 'Burg', 224455566, '1978-01-09', '731-Fondren-Houston-TX', 'F', 10000, null,4),
							('Ramesh', 'E', 'Smith', 888999011, '1978-01-09', '731-Fondren-Houston-TX', 'M', 25000, null,5),
							('Pedro', 'F', 'Vilel', 234543123,'2008-07-08', '1259-Padre-Pio-BR','M',85000,null,4);

insert into employee values('Amanda', 'M', 'Breidenbach',101010101, '1982-10-05', '222-Padre-Pio-BR', 'F', 85000,null,4),
						   ('Alessandro', 'B', 'Marques', 202020202, '1978-07-22', '223-Padre-Pio-BR','M', 110000,null,5),
                           ('Valentina', 'A', 'Azambuja', 303030303, '1985-07-14', '111-Araguari-BR','F', 66000,null,4),
                           ('Pedro-Henrique', 'P', 'Azambuja', 404040404, '1981-07-08', '333-Araguari-BR', 'M', 85000,null,5);
                           
insert into dependent values(123456789, 'Miguel', 'M', '2000-05-10','Filho'),
							(444455566, 'Joy','M', '2014-07-14', 'Filho'),
                            (444455566, 'Alice', 'F', '2010-08-09', 'Filha'),
							(101010101, 'Pepe', 'M', '2008-07-08', 'Filho'),
							(101010101, 'Tina', 'F', '2014-08-07', 'Filha'),
                            (888999011, 'Ed', 'M', '2000-10-10', 'Filho'),
                            (888999011, 'Lia', 'F', '2002-12-05', 'Filha'),
							(888999011, 'Diva', 'F', '2002-12-05', 'Filha');
                      
                            
insert into departament values('Gerent', 5, 123456789, '1988-05-22','1986-05-22'),
							  ('Administracao', 4, 444455566, '1995-01-01', '1994-01-01'),
                              ('Sede', 1, 888999011, '1981-06-19', '1980-06-19');
                              
insert into dept_locations values(1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
								 (5, 'Sugarland'),
                                 (5, 'Houston');
                                 
insert into project values ('ProdutX', 1, 'Bellaire', 5),
						   ('ProdutY', 2, 'Sugarland', 5),
                           ('ProdutZ', 3, 'Houston', 5),
                           ('Computerizaton', 10, 'Stafford', 4),
                           ('Reorganozation', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);
                           
insert into works_on values (123456789, 1, 32.5),
							(222233334, 2, 28.8),
							(444455566, 2, 28.0),
                            (224455566, 1, 20.0),
                            (888999011, 10, 10.0),
                            (234543123, 20, 30.0);
                        
                        
select * from employee;

-- gerente e seu departamento
select Ssn, Fname, Dname From employee e, departament d where (e.Ssn = Mgr_ssn);

-- nomes dos funcionarios e seus dependentes
select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;
					
-- achando o aniverásio e endereco de um funcionário, no exemplo o John
select Bdate, Adress from employee
	where Fname = 'John' and Mint='B' and Lname='Smith';
    
-- recuperando departamento específico
select * from departament where Dname = 'Gerent';


select Fname, Lname, Adress from employee as e, departament
	where Dname = 'Gerent' and Dnumber-Dno;

desc works_on;
select * from project;

select * from project, works_on where Pnumber = Pno;

select Pname, Essn, Fname, Hours 
from project, works_on, employee
	where Pnumber = Pno and Essn = Ssn;

-- Dnumer : departament
desc departament;
desc dept_locations;

select * from departament;
select * from dept_locations;

-- retirar a ambiguidade através do alias ou AS Statement
select Dname, l.Dlocation as Departament_name
	from departament as d, dept_locations as l
    where d.Dnumber = l.Dnumber;
    
select * from employee;

select concat(Fname, '', Lname) as Employee from employee;

select * from dependent;






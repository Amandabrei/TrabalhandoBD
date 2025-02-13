select Fname, Lname from employee, departament where Dname = 'Gerent' and Dnumber=Dno;
select concat(Fname, Lname) as Complete_name from employee, departament where Dname = 'Gerent' and Dnumber=Dno;

-- 
--
--
-- expressões e alias

select Fname, Lname, Salary, Salary * 0.011 from employee;

-- estava muito cheio de numeros no INSS para diminuir use
-- round, no exemplo abaixo coloquei 2 casas apos o zero
select Fname, Lname, Salary, round (Salary * 0.011,2) as INSS from employee;

-- definir um aumento de salario a partir de uma condição usando where
-- para gerentes que trabalham no projeto associado ao Produt
select * 
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber);
    
-- para gerentes que trabalham no projeto associado apenas ao ProdutX
select * 
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and Pname = 'ProdutX');
    
-- usando concat para refinar a tabela
select concat (Fname, ' ', Lname) as Complete_name, Salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and Pname = 'ProdutX');
    
-- aumentando o salário 10%, apenas para employee que estão no 
-- projetX - também diminui casas decimais no salário para 2 apos a vírgula
-- o alias é essa letra na frente das tabelas
select concat (Fname, ' ', Lname) as Complete_name, Salary, round (Salary*1.1,2) as increased_salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and Pname = 'ProdutX');
    
-- definindo alias para legibilidade da consulta
select concat(e.Fname,' ', e.Lname) as Employee_Name, e.Adress from employee e, departament d
	where d.Dname = 'Gerent' and d.Dnumber = e.Dno;
    
-- 
--
--
-- expressões e concatenação de strings

-- recuperando informações dos departamentos presente em Stafford
select Dname as Departament_Name , Mgr_ssn as Manager, Adress from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation = 'Stafford';

-- recuperando informações dos departamentos presente em Houston, filtrando nome e lname
select Dname as Departament_Name, Fname, Lname from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation = 'Houston' and Mgr_ssn = e.Ssn;


--
--
--
-- like e between
-- recuperar informações do nome do departamento e endereço usando like
select concat(Fname, ' ', Lname) as Complete_Name, Dname as Departament_Name from employee, departament
	where (Dno = Dnumber and Adress like '%Stafford');

select concat(Fname, ' ', Lname) Complete_Name, Adress from employee
	where (Adress like '%Houston');

select Fname, lname from employee 
	where (Salary > 30000 and Salary < 45000);
    
select Fname, Lname from employee where (Salary between 2000 and 4000);

--
--
-- 
-- Opedadores lógicos
-- recuperando utilizando and or
select Bdate, Adress from employee
	where Fname = 'John' and Mint = 'B' and Lname = 'Smith';
    
select * from departament
	where Dname = 'Gerent' or Dname = 'Administração';
    
select concat(Fname, Lname) as Complete_name from employee, departament 
	where Dname = 'Gerent' and Dnumber = Dno;




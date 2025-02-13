-- subqueries

use company_constraints;

select * from employee;

select distinct Pnumber from project
	where Pnumber in
		(
			select distinct Pno 
			from works_on, employee
			where (Essn = Ssn and Lname = 'Smith') 
		or
		(
			select Pnumber 
			from project, departament, employee
			where (Mgr_ssn = Ssn and Lname = 'Smith' and Dnum = Dnumber)
     	));
        

--
--

select distinct * from works_on
	where (Pno, Hours) in (select Pno, Hours
		from works_on
			where Essn = 123456789);
            
            
            
--
--
-- cláusuluas com exists e unique

-- quais employees possuem dependentes filhas
select e.Fname, e.Lname from employee as e
	where exists (select * from dependent as d
		where e.Ssn = d.Essn and Relationship = 'Filha');

-- empregados que não possuem dependentes
select e.Fname, e.Lname from employee as e
	where not exists (select * from dependent as d
		where e.Ssn = d.Essn);

-- empregados que possuem filhos e filhas
 select e.Fname, e.Lname from employee as e
	where exists (select * from dependent as d
		where e.Ssn = d.Essn);  
	
-- gerentes que possuem filhos ou filhas
 select e.Fname, e.Lname from employee as e
	where exists (select * from dependent as d
		where e.Ssn = d.Essn) 
        and 
        (select * from departament
			where Ssn = Mgr_ssn);      
            
            
desc dependentes;

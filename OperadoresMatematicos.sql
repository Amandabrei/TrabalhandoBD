--
--
--
-- Operadores Matemáticos, deve criar tabelas tem q ter as mesmas estruturas
-- union, union all, except e intersect

create database opmate;
use opmate;

create table R(
	A char(20)
);

create table S(
	A char(20)
);

insert into R(A) values ('a1'), ('a2'), ('a3'), ('a4');
insert into S(A) values ('a1'), ('a1'), ('a2'), ('a3'),('a4'), ('a5');

select * from R;

select * from S;

-- recuperar as informações de S onde o artibuto A naõ está presente em release savepoint
--
--
-- usando except
select * from S where A not in (select A from R);


-- uni as duas tabelas
(select distinct R.A from R)
	union
		(select distinct S.A from S);
        -- ou -- 
(select R.A from R)
	union
		(select S.A from S);
        
--
--
-- intersect
select R.A from R where R.A in (select S.A from S);
        

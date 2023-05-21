use crud;
alter table if exists filhos drop foreign key fk_pai;
drop table if exists pais;
drop table if exists filhos;
create table pais(
	pai_id int primary key auto_increment,
	nome varchar(20)
);
create table filhos(
	filho_id int primary key auto_increment,
	nome varchar(20),
	pai int,
	constraint fk_pai foreign key(pai) 
	references pais(pai_id)
	on update cascade
	on delete set null
);

insert into pais(nome)values('josé');
insert into pais(nome)values('jorge');
insert into pais(nome)values('joel');
insert into pais(nome)values('joão');
insert into pais(nome)values('jaime');

insert into filhos(nome,pai)values('gerson',1);
insert into filhos(nome,pai)values('joelma',2);
insert into filhos(nome,pai)values('joel',3);
insert into filhos(nome,pai)values('cristiane',4);
insert into filhos(nome,pai)values('javique',5);



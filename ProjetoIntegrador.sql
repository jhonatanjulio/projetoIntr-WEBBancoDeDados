drop database if exists dbIntre;
 
create database dbIntre;
 
use dbIntre;
 
create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50),
cpfFunc char(11),
dataNasc date,
rgFunc char(11),
dataExp date,
UF char(2),
primary key(codFunc)
);
 
create table tbUsuarios(
codUsu int not null auto_increment,
nomeUsu varchar(50),
login char(8),
senha char(8),
primary key(codUsu)
);
 
create table tbClientes(
codCli int not null auto_increment,
nome varchar(50),
email varchar(50),
telCli char(11),
primary key(codCli)
);	
 
create table tbProjetos(
codProj int not null auto_increment,
formaContato varchar(50), 
logradouro varchar(100) not null,
bairro varchar(50) not null,
estado char(2), 
cidade varchar(50), 
complemento varchar(50),
tipoImovel varchar(50), 
tipoServico varchar(50),
metragem int, -- metragem numero quebrado não int
revestimentos varchar(50),
marcenaria varchar(50),
descricaoAmbiente text,
fotosAmbiente blob,
codCli int not null,
codAmb int not null,
primary key(codProj),
foreign key(codCli) references tbClientes(codCli),
foreign key(codAmb) references tbAmbientes(codAmb)
);
 
create table tbOrcamentos(
codOrc int not null auto_increment,
valorInicial decimal(9,2) not null,
valorTotal decimal(9,2), 
codCli int not null,
codProj int not null,
codUsu int not null,
primary key(codOrc),
foreign key(codCli) references tbClientes(codCli),
foreign key(codProj) references tbProjetos(codProj),
foreign key(codUsu) references tbUsuarios(codUsu)
);
 
create table tbAmbientes(
codAmb int not null auto_increment,
NomeAmb varchar(15),
primary key(codAmb)
);
 
create table tbGaleria(
codGal int not null auto_increment,
titulo varchar(50),
descricao text,
fotosGaleria blob,
primary key(codGal)
);
 
desc Funcionarios;
desc Usuarios;
desc Clientes;
desc Projetos;
desc Orcamentos;
desc Ambientes;
desc Galeria;


-- Tabelas que terão INSERTs fixos:
create table tbExtras(
codExtra int not null auto_increment,
descricao varchar(255) not null,
valor decimal(9, 2),
primary key(codExtra)
);

-- INSERTs fixos para a tabela Extras:
insert into tbExtras(descricao, valor) values ('Pasta de entrega', 10.00);
insert into tbExtras(descricao, valor) values ('Plotagens', 15.00);
insert into tbExtras(descricao, valor) values ('Overdelivery', 0.0);
insert into tbExtras(descricao, valor) values ('Visitas técnicas avulsas', 150.00);
insert into tbExtras(descricao, valor) values ('Taxas de Prefeitura', 0.0);
insert into tbExtras(descricao, valor) values ('RRT', 150.00);
insert into tbExtras(descricao, valor) values ('Papelaria', 0.0);
insert into tbExtras(descricao, valor) values ('Deslocamento', 0.0);

create table tbTipoOrcamento(
codTipo int not null auto_increment,
descricao varchar(255) not null,
primary key(codTipo)
);

-- INSERTs fixos para a tabela TipoOrcamento:
insert into tbTipoOrcamento(descricao) values ("BÁSICO"); -- cod 1
insert into tbTipoOrcamento(descricao) values ("PL + 3D"); -- cod 2
insert into tbTipoOrcamento(descricao) values ("COMPLETO + 3D"); -- cod 3

create table tbMetragens(
codTipo int not null,
descricao varchar(255) not null,
metragemMin decimal,
metragemMax decimal,
valor decimal(9, 2),
foreign key(codTipo) references tbTipoOrcamento(codTipo)
);

-- INSERTs fixos para a tabela Metragens:

-- Para o tipo de Orçamento: BÁSICO:
insert into tbMetragens(codTipo, descricao, metragemMin, metragemMax, valor) values (1, "Um cômodo", 15, 15, 225.00);

-- Para o tipo de Orçamento: PL + 3D:
insert into tbMetragens(codTipo, descricao, metragemMin, metragemMax, valor) values (2, "Um cômodo", 15, 15, 225.00);

-- Para o tipo de Orçamento: COMPLETO + 3D:
insert into tbMetragens(codTipo, descricao, metragemMin, metragemMax, valor) values (3, "Um cômodo", 15, 15, 225.00);
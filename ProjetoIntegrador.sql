-- drop database dbIntre;
 
create database dbIntre;
 
use dbIntre;
 
create table Funcionarios(
codFunc int not null auto_increment,
nomeFunc varchar (50),
cpfFunc char (11),
dataNasc date,
rgFunc char (11),
dataExp date,
UF char (2),
primary key (codFunc)
);
 
create table Usuarios(
codUsu int not null auto_increment,
nomeUsu varchar (50),
login char (8),
senha char (8),
primary key (codUsu)
);
 
create table Clientes(
codCli int not null auto_increment,
nome varchar (50),
email varchar (50),
telCli char (11),
primary key (codCli)
);	
 
create table Projetos(
codProj int not null auto_increment,
formaContato varchar (50), 
logradouro varchar (100) not null,
bairro varchar (50) not null,
estado char (2), 
cidade varchar (50), 
complemento varchar (50),
tipoImovel varchar (50), 
tipoServico varchar (50),
metragem int,
revestimentos varchar (50),
marcenaria varchar (50),
descricaoAmbiente text,
fotosAmbiente blob,
codCli int not null,
codAmb int not null,
primary key (codProj),
foreign key (codCli) references Clientes (codCli),
foreign key (codAmb) references Ambientes (codAmb)
);
 
create table Orcamentos(
codOrc int not null auto_increment,
valorInicial decimal (9,2) not null,
valorTotal decimal (9,2), 
codCli int not null auto_increment,
codProj int not null auto_increment,
primary key (codOrc),
foreign key (codCli) references Clientes (codCli),
foreign key (codProj) references Projetos (codProj),
foreign key (codUsu) references Usuarios (codUsu)
);
 
create table Ambientes(
codAmb int not null auto_increment,
NomeAmb varchar (15),
primary key (codAmb)
);
 
create table Galeria(
codGal int not null auto_increment,
titulo varchar (50),
descricao text,
fotosGaleria blob,
primary key (codGal)
);


 
desc Funcionarios;
desc Usuarios;
desc Clientes;
desc Projetos;
desc Orcamentos;
desc Ambientes;
desc Galeria;
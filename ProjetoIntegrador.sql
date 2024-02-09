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
NomeUsu varchar (50),
Login char (8),
Senha char (8),
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
FormaContato varchar (50), 
Logradouro varchar (100) not null,
Bairro varchar (50) not null,
Estado char (2), 
Cidade varchar (50), 
Complemento varchar (50),
TipoImovel varchar (50), 
TipoServico varchar (50),
Metragem int,
Revestimentos varchar (50),
Marcenaria varchar (50),
DescricaoAmbiente text,
FotosAmbiente blob,
codCli int not null,
codAmb int not null,
primary key (codProj),
foreign key (codCli) references Clientes (codCli),
foreign key (codAmb) references Ambientes (codAmb)
);
 
create table Orcamentos(
codOrc int not null auto_increment,
ValorInicial decimal (9,2) not null,
ValorTotal decimal (9,2), 
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
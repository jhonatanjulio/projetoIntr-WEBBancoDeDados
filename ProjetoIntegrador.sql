-- drop database dbIntre;
 
create database dbIntre;
 
use dbIntre;
 
create table Funcionarios(
codFunc int not null auto_increment,
nomeFunc varchar (50) not null,
cpfFunc char (11) not null,
dataNasc date not null,
rgFunc char (11) not null,
dataExp date not null,
UF char (2) not null,
primary key (codFunc)
);
 
create table Usuarios(
codUsu int not null auto_increment,
nomeUsu varchar (50) not null,
login char (8) not null,
senha char (8) not null,
primary key (codUsu)
);
 
create table Clientes(
codCli int not null auto_increment,
nomeCli varchar (50) not null,
emailCli varchar (50) not null,
telCli char (11) not null,
primary key (codCli)
);	
 
create table Projetos(
codProj int not null auto_increment,
formaContato varchar (50) not null, 
logradouro varchar (100) not null,
bairro varchar (50) not null,
estado char (2) not null, 
cidade varchar (50) not null, 
complemento varchar (50) not null,
tipoImovel varchar (50) not null, 
tipoServico varchar (50) not null,
metragem decimal (4,2) not null, 
revestimentos varchar (50) not null,
marcenaria varchar (50) not null,
descricaoAmbiente text not null,
fotosAmbiente blob not null,
codCli int not null,
codAmb int not null,
primary key (codProj),
foreign key (codCli) references Clientes (codCli),
foreign key (codAmb) references Ambientes (codAmb)
);
 
create table Orcamentos(
codOrc int not null auto_increment,
valorInicial decimal (9,2) not null,
valorTotal decimal (9,2) not null, 
codCli int not null,
codProj int not null,
codUsu int not null,
primary key (codOrc),
foreign key (codCli) references Clientes (codCli),
foreign key (codProj) references Projetos (codProj),
foreign key (codUsu) references Usuarios (codUsu)
);
 
create table Ambientes(
codAmb int not null auto_increment,
NomeAmb varchar (15) not null,
primary key (codAmb)
);
 
create table Galeria(
codGal int not null auto_increment,
tituloGal varchar (50) not null,
descricaoGal text not null,
fotosGaleria blob not null,
primary key (codGal)
);


 
desc Funcionarios;
desc Usuarios;
desc Clientes;
desc Projetos;
desc Orcamentos;
desc Ambientes;
desc Galeria;
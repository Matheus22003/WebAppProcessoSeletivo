/*Inicio Criação de Tabelas*/
CREATE TABLE Estados(
	EstadoID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NomeEstado varchar(30) NOT NULL,
	Sigla varchar(2) NOT NULL
);

CREATE TABLE Generos(
	GeneroID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Genero varchar(255) NOT NULL
);

CREATE TABLE Pessoas(
	PessoasID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nome varchar(150) NOT NULL,
	Cpf varchar(11) NOT NULL,
	Ativo bit DEFAULT(1),
	data_criacao datetime NOT NULL DEFAULT(getdate()),
	data_exclusao datetime,
	Estado int NOT NULL FOREIGN KEY REFERENCES Estados(EstadoID),
	Genero int NOT NULL FOREIGN KEY REFERENCES Generos(GeneroID)
);
/*Fim Criação de Tabelas*/
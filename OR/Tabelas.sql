CREATE TYPE tipo_Endereco as OBJECT( 
    rua VARCHAR (45), 
    cidade VARCHAR(25), 
    CEP CHAR(9), 
    Numero NUMBER,
 	CONSTRUCTOR FUNCTION tipo_Endereco(SELF IN OUT NOCOPY tipo_Endereco, Rua VARCHAR2, Cidade VARCHAR2, CEP VARCHAR2, Numero NUMBER) RETURN SELF AS RESULT); 

/

CREATE OR REPLACE TYPE BODY tipo_Endereco as 
	CONSTRUCTOR FUNCTION tipo_Endereco(SELF IN OUT tipo_Endereco,  Rua VARCHAR2, Cidade VARCHAR2, Cep VARCHAR2, numero NUMBER ) 
    RETURN SELF AS RESULT IS BEGIN
	SELF.rua := Rua; SELF.cidade := Cidade;
	SELF.CEP := Cep; SELF.Numero := numero;
	END;
END;

/
-- Varray
CREATE TYPE array_telefone AS VARRAY(3) OF VARCHAR2(11);
/
-- Cliente
CREATE OR REPLACE TYPE tipo_Cliente AS OBJECT (
    Nome VARCHAR2(40),
    Data_nascimento DATE,
    Estado_civil VARCHAR2(10),
    Genero VARCHAR2(20),
    Telefone array_telefone,
    CPF_cliente CHAR(11),
    endereco REF tipo_Endereco
)NOT FINAL;
/
--Banco
CREATE OR REPLACE TYPE tipo_Banco AS OBJECT (
    Nome VARCHAR2(40),
    Telefone array_telefone,
    CNPJ CHAR(14),
    
    ORDER MEMBER FUNCTION compareTo(b tipo_Banco) RETURN INTEGER  
);	
/
CREATE TYPE BODY tipo_Banco As  
ORDER MEMBER FUNCTION compareTo(b tipo_Banco) RETURN INTEGER 
	BEGIN  
		IF Nome > b.Nome THEN  
			RETURN -1  
		ELSIF Nome < b.Nome THEN  
			RETURN 1  
		ELSE   
			RETURN 0   
  
		END IF;  
	END compareTo;  
END;
/
-- Imovel
CREATE TYPE tipo_Imovel AS OBJECT(
    idImovel NUMBER,
    Valor FLOAT,
    Parcelas FLOAT,
    Endereco tipo_Endereco,
    CPF_Proprietario CHAR(11),
    Titulo VARCHAR2(40),
    Tipo VARCHAR2(40),
    Descricao VARCHAR2(200),
    Quartos NUMBER,
    Banheiros NUMBER
);
/
-- Corretor
CREATE TYPE tipo_Corretor AS OBJECT (
    Nome VARCHAR2(40),
    CPF_corretor CHAR(11),
    Telefone array_telefone,
    CPF_gerenciador CHAR(11)
);
/
--Visita
CREATE TYPE tipo_Visita AS OBJECT(
	idImovel NUMBER,
    CPF_proprietario CHAR(11),
    CPF_locatario CHAR(11),
    CPF_corretor CHAR(11),
    Data DATE,
    Avaliacao NUMBER,
    MEMBER PROCEDURE mudar_avaliacao(a NUMBER)
);
/
CREATE OR REPLACE TYPE BODY tipo_Visita AS
MEMBER PROCEDURE mudar_avaliacao(a NUMBER) IS
BEGIN
Avaliacao := a;
END;
END;

/
-- Financia
CREATE TYPE tipo_Financia AS OBJECT(
    CPF_locatario CHAR(11),
    CNPJ_banco CHAR(14),
    idImovel NUMBER,
    Parcelas NUMBER
);
/
-- Aluga
CREATE OR REPLACE TYPE tipo_Aluga AS OBJECT(
    idImovel NUMBER,
    CPF_corretor CHAR(11),
    CPF_locatario CHAR(11),
    Mensalidade FLOAT,
    Inicio DATE,
    Fim DATE,
	MAP MEMBER FUNCTION valor_anual RETURN FLOAT
);
/
CREATE OR REPLACE TYPE BODY tipo_aluga AS
MAP MEMBER FUNCTION valor_anual RETURN FLOAT IS
BEGIN
RETURN (Mensalidade * 12);
END;
END;
/

-- Anuncia
CREATE TYPE tipo_Anuncia AS OBJECT(
    CPF_proprietario CHAR(11),
    idImovel NUMBER,
    Cliente_desejado VARCHAR2(40),
    Status VARCHAR2(10),
    Data DATE
);
/
--Contata: 
CREATE TYPE tipo_Contata AS OBJECT(
    CPF_corretor CHAR(11),
    CPF_locatario CHAR(11)
);
/
-- Subtipo para Locatário
CREATE OR REPLACE TYPE tipo_Locatario UNDER tipo_Cliente (
    Tipo_desejado VARCHAR2(50),
    Ocupacao VARCHAR2(20),
    Renda_Media FLOAT,
    Tem_Pet CHAR(3)
);
/ 
-- Subtipo para Proprietário
CREATE OR REPLACE TYPE tipo_Proprietario UNDER tipo_Cliente (
);
/ 
-- Tabela Endereco
CREATE TABLE Endereco OF tipo_Endereco (
    PRIMARY KEY (CEP)
);
/
-- Tabela Cliente
CREATE TABLE Cliente OF tipo_Cliente (
    PRIMARY KEY (CPF_cliente),
    endereco WITH ROWID REFERENCES Endereco,
    CONSTRAINT chk_estado_civil CHECK (Estado_civil IN ('Solteiro', 'Casado', 'Divorciado', 'Viúvo'))
);

/
-- Tabela Banco
CREATE TABLE Banco OF tipo_Banco(
    CONSTRAINT Banco_pk PRIMARY KEY (CNPJ)
);
/

-- Tabela Imóvel
CREATE TABLE Imovel OF tipo_Imovel (
    PRIMARY KEY (idImovel),
    CONSTRAINT fk_proprietario FOREIGN KEY (CPF_Proprietario) REFERENCES Cliente(CPF_cliente)
);
/

--Tabela Corretor
CREATE TABLE Corretor OF tipo_Corretor (
    PRIMARY KEY (CPF_corretor),
    CONSTRAINT fk_gerenciador FOREIGN KEY (CPF_gerenciador) REFERENCES Cliente(CPF_cliente)
);
/
--Tabela Locatario
CREATE TABLE Locatario OF tipo_Locatario (
    PRIMARY KEY (CPF_cliente)
);
/
--Tabela Proprietario
CREATE TABLE Proprietario OF tipo_Proprietario (
    PRIMARY KEY (CPF_cliente)
);
/
-- Tabela Visita
CREATE TABLE Visita OF tipo_Visita (
    PRIMARY KEY (idImovel, CPF_proprietario, CPF_locatario, CPF_corretor),
    CONSTRAINT fk_visita_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel),
    CONSTRAINT fk_visita_proprietario FOREIGN KEY (CPF_proprietario) REFERENCES Proprietario(CPF_cliente),
    CONSTRAINT fk_visita_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_cliente),
    CONSTRAINT fk_visita_corretor FOREIGN KEY (CPF_corretor) REFERENCES Corretor(CPF_corretor)
);
/

-- Tabela Financia
CREATE TABLE Financia OF tipo_Financia(
    PRIMARY KEY (CPF_locatario, CNPJ_banco, idImovel),
    CONSTRAINT fk_financia_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_cliente),
    CONSTRAINT fk_financia_banco FOREIGN KEY (CNPJ_banco) REFERENCES Banco(CNPJ),
    CONSTRAINT fk_financia_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel)
);
/

-- Tabela Aluga
CREATE TABLE Aluga OF tipo_Aluga(
    PRIMARY KEY (idImovel, CPF_locatario, CPF_corretor),
    CONSTRAINT fk_aluga_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel),
    CONSTRAINT fk_aluga_corretor FOREIGN KEY (CPF_corretor) REFERENCES Corretor(CPF_corretor),
    CONSTRAINT fk_aluga_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_cliente)
);
/
-- Tabela Contata
CREATE TABLE Contata OF tipo_Contata(
    PRIMARY KEY (CPF_corretor, CPF_locatario),
    CONSTRAINT fk_contata_corretor FOREIGN KEY (CPF_corretor) REFERENCES Corretor(CPF_corretor),
    CONSTRAINT fk_contata_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_cliente)
);
/
-- Tabela Anuncia
CREATE TABLE Anuncia OF tipo_Anuncia(
    PRIMARY KEY (CPF_proprietario, idImovel),
    CONSTRAINT fk_anuncia_proprietario FOREIGN KEY (CPF_proprietario) REFERENCES Proprietario(CPF_cliente),
    CONSTRAINT fk_anuncia_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel)
);
/
-- Alter Type para usar o REF:

--mudando o tipo_imovel para referenciar o endereço
ALTER TYPE tipo_Imovel DROP ATTRIBUTE Endereco CASCADE; 
ALTER TYPE tipo_Imovel ADD ATTRIBUTE endereco REF tipo_endereco CASCADE; 


--mudando o tipo_financia
ALTER TYPE tipo_Financia DROP ATTRIBUTE CPF_locatario CASCADE; 
ALTER TYPE tipo_Financia ADD ATTRIBUTE Locatario REF tipo_Locatario CASCADE; 

ALTER TYPE tipo_Financia DROP ATTRIBUTE CNPJ_banco CASCADE; 
ALTER TYPE tipo_Financia ADD ATTRIBUTE Banco REF tipo_Banco CASCADE; 

ALTER TYPE tipo_Financia DROP ATTRIBUTE idImovel CASCADE;
ALTER TYPE tipo_Financia ADD ATTRIBUTE Imovel REF tipo_Imovel CASCADE;

--funções
CREATE OR REPLACE FUNCTION getTelefonesPorCPF(cpf IN CHAR) RETURN array_telefone IS
    telefones array_telefone;
BEGIN
    SELECT c.Telefone
    INTO telefones
    FROM Corretor c
    WHERE c.CPF_corretor = cpf;
    
    RETURN telefones;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Retorna NULL se não encontrar o corretor
END;
/
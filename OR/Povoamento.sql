-- tabela endereço
INSERT INTO Endereco
VALUES ('Rua das Flores','São Paulo', '01234-567',123);
INSERT INTO Endereco
VALUES ('Rua das Flores','São Paulo', '01001-000',456);
INSERT INTO Endereco
VALUES ('Avenida Brasil','São Paulo', '22001-000',455);
INSERT INTO Endereco
VALUES ('Rua da Paz','Recife', '13001-000',789);
INSERT INTO Endereco
VALUES ('Rua do Sol','Recife', '25001-000',101);
INSERT INTO Endereco
VALUES ('Avenida Central','Recife', '14001-000',202);
INSERT INTO Endereco
VALUES ('Rua da Liberdade','Rio de Janeiro', '35001-000',303);
INSERT INTO Endereco
VALUES ('Rua das Acácias','Rio de Janeiro', '40001-000',404);
INSERT INTO Endereco
VALUES ('Avenida Independência','Brasília', '50001-000',505);
INSERT INTO Endereco
VALUES ('Rua das Palmeiras','Brasília', '60001-000',606);
INSERT INTO Endereco
VALUES ('Avenida Paulista','Brasília', '70001-000',707);
INSERT INTO Endereco
VALUES ('Rua dos Pinheiros','Limoeiro', '01234-567',100);
INSERT INTO Endereco
VALUES ('Avenida Paulista','Limoeiro', '23456-789',200);
INSERT INTO Endereco
VALUES ('Rua da Liberdade','Limoeiro', '34567-890',300);
INSERT INTO Endereco
VALUES ('Rua do Sol','Florianópolis', '45678-901',400);
INSERT INTO Endereco
VALUES ('Avenida Central','Florianópolis', '56789-012',500);
INSERT INTO Endereco
VALUES ('Rua das Flores','Florianópolis', '67890-123',600);
INSERT INTO Endereco
VALUES ('Avenida Paulista','São Paulo', '78901-234',700);
INSERT INTO Endereco
VALUES ('Rua da Liberdade','São Paulo', '89012-345',800);
INSERT INTO Endereco
VALUES ('Rua do Sol','São Paulo', '90123-456',900);
INSERT INTO Endereco
VALUES ('Avenida Central','São Paulo', '12345-698',910);
INSERT INTO Endereco
VALUES ('Rua Pedro Gonzaga de Lima','São Paulo', '58100-740',123);
INSERT INTO Endereco
VALUES ('Rua Rio Grande do Sul','Curitiba', '29901-120',123);
INSERT INTO Endereco
VALUES ('Rua Travessa 15','São Vicente', '68927-131',55);
INSERT INTO Endereco
VALUES ('Rua Agenor Veloso','São Luiz', '64023-285',564);
INSERT INTO Endereco
VALUES ('Rua Siqueira Campos','São Luiz', '78130-426',58);
INSERT INTO Endereco
VALUES ('Praça Athos Abilhoa','São Paulo', '81450-412',511);
INSERT INTO Endereco
VALUES ('Rua São José','São Paulo', '65607-440',567);


-- tabela cliente
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01234-567';

    INSERT INTO Cliente
    VALUES ('João Silva', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('11912345678', NULL, NULL), '12345678901', v_endereco_ref);
END;
/
-- tabela cliente
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01001-000';

    INSERT INTO Cliente
    VALUES ('Mariana Silva', TO_DATE('2003-11-01', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('11987654321', NULL, NULL), '12345678903', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '22001-000';

    INSERT INTO Cliente
    VALUES ('Pedro Santos', TO_DATE('1998-05-15', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('21987654321', NULL, NULL), '78901234567', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '13001-000';

    INSERT INTO Cliente
    VALUES ('Ana Oliveira', TO_DATE('2005-07-05', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('19987654321', '81994757498', NULL), '12345678909', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '25001-000';

    INSERT INTO Cliente
    VALUES ('Lucas Lima', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('24977654321', '81994757497', NULL), '98765432109', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '14001-000';

    INSERT INTO Cliente
    VALUES ('Beatriz Souza', TO_DATE('1999-09-25', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('16985654321', '81994757491', '16996739626'), '34567890123', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '35001-000';

    INSERT INTO Cliente
    VALUES ('Rafael Santos', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('31987654322', '31994757491', '31996739626'), '67890123456', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '40001-000';

    INSERT INTO Cliente
    VALUES ('Juliana Pereira', TO_DATE('2002-12-30', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('41987654322', '41994757491', NULL), '01234567810', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '50001-000';

    INSERT INTO Cliente
    VALUES ('André Silva', TO_DATE('1995-08-18', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('51987654322', '51994757491', NULL), '23456789012', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '60001-000';

    INSERT INTO Cliente
    VALUES ('Camila Santos', TO_DATE('2000-04-02', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('61937654321', '61994757491', NULL), '45678901234', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '70001-000';

    INSERT INTO Cliente
    VALUES ('Lucas Silva', TO_DATE('1996-11-07', 'YYYY-MM-DD'), 'Divorciado', 'Masculino', array_telefone('71987652321', '71994757491', NULL), '78901234562', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01234-567';

    INSERT INTO Cliente
    VALUES ('Bruno Almeida', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('11987653321', NULL, NULL), '98765432100', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '34567-890';

    INSERT INTO Cliente
    VALUES ('Carlos Oliveira', TO_DATE('1972-08-15', 'YYYY-MM-DD'), 'Divorciado', 'Masculino', array_telefone('19987655321', NULL, NULL), '34567890122', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '45678-901';

    INSERT INTO Cliente
    VALUES ('Fernanda Santos', TO_DATE('1999-04-10', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('24987555321', NULL, NULL), '67890122456', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '56789-012';

    INSERT INTO Cliente
    VALUES ('Roberto Souza', TO_DATE('1987-12-25', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('24987554321', NULL, NULL), '01234567890', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '67890-123';

    INSERT INTO Cliente
    VALUES ('Camila Lima', TO_DATE('2004-12-25', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('98765554321', NULL, NULL), '18765432109', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '78901-234';

    INSERT INTO Cliente
    VALUES ('Pedro Pereira', TO_DATE('1991-09-05', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('98765554321', NULL, NULL), '34367890123', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '89012-345';

    INSERT INTO Cliente
    VALUES ('Ana Silva', TO_DATE('1991-09-09', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('98767554321', NULL, NULL), '67890123458', v_endereco_ref);
END;
/

DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '90123-456';

    INSERT INTO Cliente
    VALUES ('Lucas Santos', TO_DATE('2002-09-09', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('98765554321', NULL, NULL), '01234567590', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '12345-698';

    INSERT INTO Cliente
    VALUES ('Beatriz Souza', TO_DATE('1995-07-07', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('71987654321', NULL, NULL), '28765432109', v_endereco_ref);
END;
/


-- tabela Banco
INSERT INTO Banco VALUES (
    tipo_Banco('Banco do Brasil', array_telefone('11987654321', '11912345678', '11998765432'), '12345678000199')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Caixa Econômica Federal', array_telefone('21876543210', '21812345679', '21898765431'), '98765432000188')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Bradesco', array_telefone('31987654321', '31912345678', NULL), '56789012000177')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco do Brasil', array_telefone('31987654321', '31912345678', '1112345678'), '12345678000195')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Itaú Unibanco', array_telefone('11987654321', NULL, NULL), '98765432000100')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Santander', array_telefone('2123456789', NULL, NULL), '12345678000276')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Bradesco', array_telefone('2134567890', NULL, NULL), '12345678000357')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Caixa Econômica Federal', array_telefone('3198765432', NULL, NULL), '12345678000438')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco do Nordeste', array_telefone('4187654321', NULL, NULL), '12345678000519')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco de Brasília', array_telefone('6187654321', NULL, NULL), '12345678000600')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco Safra', array_telefone('1134567890', NULL, NULL), '12345678000781')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco Pan', array_telefone('11987654322', NULL, NULL), '12345678000862')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco Votorantim', array_telefone('1134567891', NULL, NULL), '12345678000943')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco Daycoval', array_telefone('1134567892', NULL, NULL), '12345678001024')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco Alfa', array_telefone('1134567893', NULL, NULL), '12345678001105')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco Fibra', array_telefone('1134567894', NULL, NULL), '12345678001286')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco BTG Pactual', array_telefone('1134567895', NULL, NULL), '12345678001367')
);
INSERT INTO Banco VALUES (
    tipo_Banco('Banco ModalMais', array_telefone('1134567896', NULL, NULL), '12345678001448')
);


--tabela Proprietario
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '22001-000';

    INSERT INTO Proprietario
    VALUES ('Pedro Santos', TO_DATE('1998-05-15', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('21987654321', NULL, NULL), '78901234567', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '13001-000';

    INSERT INTO Proprietario
    VALUES ('Ana Oliveira', TO_DATE('2005-07-05', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('19987654321', '81994757498', NULL), '01234567890', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '25001-000';

    INSERT INTO Proprietario
    VALUES ('Lucas Lima', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('24977654321', '81994757497', NULL), '98765432109', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '14001-000';

    INSERT INTO Proprietario
    VALUES ('Beatriz Souza', TO_DATE('1999-09-25', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('16985654321', '81994757491', '16996739626'), '34567890123', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '35001-000';

    INSERT INTO Proprietario
    VALUES ('Rafael Santos', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('31987654322', '31994757491', '31996739626'), '67890123456', v_endereco_ref);
END;
/


-- tabela Locatario
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '67890-123';

    INSERT INTO Locatario
    VALUES ('Camila Lima', TO_DATE('2004-12-25', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('98765554321', NULL, NULL), '18765432109', v_endereco_ref, 'Casa', 'Engenheiro', 5700.00, 'Sim');
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '35001-000';

    INSERT INTO Locatario
    VALUES ('Rafael Santos', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('31987654322', '31994757491', '31996739626'), '67890123456', v_endereco_ref, 'Casa', 'Engenheiro', 7500.00, 'Nao');
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '40001-000';

    INSERT INTO Locatario
    VALUES ('Juliana Pereira', TO_DATE('2002-12-30', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('41987654322', '41994757491', NULL), '01234567810', v_endereco_ref, 'Casa', 'Engenheiro', 7500.00, 'Nao');
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '50001-000';

    INSERT INTO Locatario
    VALUES ('André Silva', TO_DATE('1995-08-18', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('51987654322', '51994757491', NULL), '23456789012', v_endereco_ref, 'Apartamento', 'Professor', 4000.00, 'Nao');
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '60001-000';

    INSERT INTO Locatario
    VALUES ('Camila Santos', TO_DATE('2000-04-02', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('61937654321', '61994757491', NULL), '45678901234', v_endereco_ref, 'Casa', 'Gerente', 7000.00, 'Nao');
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '70001-000';

    INSERT INTO Locatario
    VALUES ('Lucas Silva', TO_DATE('1996-11-07', 'YYYY-MM-DD'), 'Divorciado', 'Masculino', array_telefone('71987652321', '71994757491', NULL), '78901234562', v_endereco_ref, 'Cobertura', 'Advogado', 9000.00, 'Nao');
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01234-567';

    INSERT INTO Locatario
    VALUES ('Bruno Almeida', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('11987653321', NULL, NULL), '98765432100', v_endereco_ref,'Apartamento', 'Designer', 4800.00, 'Sim');
END;
/


--tabela Corretor
INSERT INTO Corretor VALUES (
    tipo_Corretor('Carlos Eduardo', '12345678901', array_telefone('21987654321', NULL, NULL), NULL)  -- Sem gerenciador
);
INSERT INTO Corretor VALUES (
    tipo_Corretor('Mariana Alves', '23456789012', array_telefone('21998765432', '21988765432', NULL), '78901234567')  -- Gerenciado por CPF
);
INSERT INTO Corretor VALUES (
    tipo_Corretor('Fernanda Souza', '34567890123', array_telefone('31987654323', NULL, NULL), '12345678901')  -- Gerenciado por Carlos Eduardo
);
INSERT INTO Corretor VALUES (
    tipo_Corretor('Bruno Lima', '45678901234', array_telefone('22987654324', '21988765434', NULL), '23456789012')  -- Gerenciado por Mariana Alves
);
INSERT INTO Corretor VALUES (
    tipo_Corretor('Aline Santos', '56789012345', array_telefone('21987654325', NULL, '31994757491'), NULL)  -- Sem gerenciador
);
INSERT INTO Corretor VALUES (
    tipo_Corretor('Fernanda Santos', '67890122456', array_telefone('24987555321', NULL, NULL), NULL)  -- Sem gerenciador
);
INSERT INTO Corretor VALUES (
    tipo_Corretor('Ana Oliveira', '12345678909', array_telefone('19987654321', '81994757498', NULL), NULL)  -- Sem gerenciador
);
--corretor que também é gerente
INSERT INTO Corretor VALUES (
    tipo_Corretor('João Batista', '67890123456', array_telefone('41987654326', '41988765436', NULL), NULL)  -- Sem gerenciador
);



--tabela Contata
INSERT INTO Contata VALUES(
    tipo_Contata('23456789012', '01234567810')
);
INSERT INTO Contata VALUES(
    tipo_Contata('34567890123', '23456789012')
);
INSERT INTO Contata VALUES(
    tipo_Contata('45678901234', '45678901234')
);
INSERT INTO Contata VALUES(
    tipo_Contata('56789012345', '78901234562')
);
INSERT INTO Contata VALUES(
    tipo_Contata('67890123456', '98765432100')
);


--Tabela Imóvel
DESC tipo_Imovel
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '22001-000';

    INSERT INTO Imovel
    VALUES (3, 200000, 140, '78901234567','Apartamento aconchegante', 'Apartamento', 'Apartamento aconchegante com ótima distribuição', 2, 2, v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '13001-000';

    INSERT INTO Imovel
    VALUES (4, 600000, 340, '12345678909','Apartamento com ótima área de lazer', 'Apartamento', 'Condominio possui academia, salão de jogos e salão de festas', 3, 2, v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '25001-000';

    INSERT INTO Imovel
    VALUES (5, 400000, 240, '98765432109','Casa com bastante quartos', 'Casa', 'Casa perfeita para uma familia grande', 5, 2, v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '14001-000';

    INSERT INTO Imovel
    VALUES (6, 100000, 340, '34567890123','Cobertura Duplex', 'Cobertura', 'Cobertura duplex para quem busca espaço e conforto', 6, 5, v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '35001-000';

    INSERT INTO Imovel
    VALUES (7, 100000, 140, '67890123456','Casa em condominio grande', 'Casa', 'Casa com piscina', 4, 3, v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '40001-000';

    INSERT INTO Imovel
    VALUES (8, 500000, 240, '01234567810','Apartamento com localização ótima', 'Apartamento', 'Apartamento com localização privilegiada no centro', 4, 3, v_endereco_ref);
END;
/


-- Tabela Visita
INSERT INTO Visita
VALUES(1, '78901234567', '01234567810', '12345678901', TO_DATE('2020-03-22', 'YYYY-MM-DD'), 3);
INSERT INTO Visita
VALUES(2, '12345678909', '01234567890', '23456789012', TO_DATE('2024-03-22', 'YYYY-MM-DD'), 4);
INSERT INTO Visita
VALUES(3, '98765432109', '45678901234', '34567890123', TO_DATE('2024-09-21', 'YYYY-MM-DD'), 4);
INSERT INTO Visita
VALUES(4, '34567890123', '78901234562', '45678901234', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 1);
INSERT INTO Visita
VALUES(5, '67890123456', '98765432100', '56789012345', TO_DATE('2022-03-22', 'YYYY-MM-DD'), 5);


--tabela Financia
DECLARE
    v_locatario_ref REF tipo_Locatario;
	v_banco_ref REF tipo_Banco;
	v_imovel_ref REF tipo_Imovel;
BEGIN
    SELECT REF(e) INTO v_locatario_ref
    FROM Locatario e
    WHERE e.CPF_Cliente = '01234567810';

	SELECT REF(e) INTO v_banco_ref
    FROM Banco e
    WHERE e.CNPJ = '12345678000199';

	SELECT REF(e) INTO v_imovel_ref
    FROM Imovel e
    WHERE e.idImovel = 1;

    INSERT INTO Financia
    VALUES (120, v_locatario_ref, v_banco_ref, v_imovel_ref);
END;
/
DECLARE
    v_locatario_ref REF tipo_Locatario;
	v_banco_ref REF tipo_Banco;
	v_imovel_ref REF tipo_Imovel;
BEGIN
    SELECT REF(e) INTO v_locatario_ref
    FROM Locatario e
    WHERE e.CPF_Cliente = '45678901234';

	SELECT REF(e) INTO v_banco_ref
    FROM Banco e
    WHERE e.CNPJ = '12345678000195';

	SELECT REF(e) INTO v_imovel_ref
    FROM Imovel e
    WHERE e.idImovel = 3;

    INSERT INTO Financia
    VALUES (300, v_locatario_ref, v_banco_ref, v_imovel_ref);
END;
/
DECLARE
    v_locatario_ref REF tipo_Locatario;
	v_banco_ref REF tipo_Banco;
	v_imovel_ref REF tipo_Imovel;
BEGIN
    SELECT REF(e) INTO v_locatario_ref
    FROM Locatario e
    WHERE e.CPF_Cliente = '78901234562';

	SELECT REF(e) INTO v_banco_ref
    FROM Banco e
    WHERE e.CNPJ = '56789012000177';

	SELECT REF(e) INTO v_imovel_ref
    FROM Imovel e
    WHERE e.idImovel = 4;

    INSERT INTO Financia
    VALUES (520, v_locatario_ref, v_banco_ref, v_imovel_ref);
END;
/
DECLARE
    v_locatario_ref REF tipo_Locatario;
	v_banco_ref REF tipo_Banco;
	v_imovel_ref REF tipo_Imovel;
BEGIN
    SELECT REF(e) INTO v_locatario_ref
    FROM Locatario e
    WHERE e.CPF_Cliente = '98765432100';

	SELECT REF(e) INTO v_banco_ref
    FROM Banco e
    WHERE e.CNPJ = '98765432000100';

	SELECT REF(e) INTO v_imovel_ref
    FROM Imovel e
    WHERE e.idImovel = 5;

    INSERT INTO Financia
    VALUES (120, v_locatario_ref, v_banco_ref, v_imovel_ref);
END;
/


-- Tabela Aluga
INSERT INTO Aluga
VALUES (1, '12345678901', '01234567810', 1200.00, TO_DATE('1985-03-22', 'YYYY-MM-DD'), TO_DATE('1990-03-22', 'YYYY-MM-DD'));
INSERT INTO Aluga
VALUES (3, '34567890123', '45678901234', 700.00, TO_DATE('2020-09-06', 'YYYY-MM-DD'), TO_DATE('2021-09-06', 'YYYY-MM-DD'));
INSERT INTO Aluga
VALUES (1, '45678901234', '78901234562', 1200.00, TO_DATE('2017-03-20', 'YYYY-MM-DD'), TO_DATE('2021-03-20', 'YYYY-MM-DD'));
INSERT INTO Aluga
VALUES (4, '56789012345', '98765432100', 6000.00, TO_DATE('1985-03-22', 'YYYY-MM-DD'), TO_DATE('1996-03-22', 'YYYY-MM-DD'));


--tabela Anuncia 
INSERT INTO Anuncia
VALUES ('78901234567', 1, 'Família', 'Ativo', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Anuncia
VALUES ('98765432109', 3, 'Solteiro', 'Ativo', TO_DATE('2024-08-10', 'YYYY-MM-DD'));
INSERT INTO Anuncia
VALUES ('34567890123', 4, 'Família', 'Inativo', TO_DATE('2024-08-15', 'YYYY-MM-DD'));
INSERT INTO Anuncia
VALUES ('67890123456', 5, 'Estudante', 'Ativo', TO_DATE('2024-08-18', 'YYYY-MM-DD'));
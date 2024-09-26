SELECT DEREF(C.endereco), C.CPF_cliente, C.Nome FROM Cliente C;
SELECT DEREF(C.endereco).CEP, DEREF(C.endereco).cidade, C.CPF_cliente, C.nome FROM Cliente C;

-- estado civil dos clientes
SELECT COUNT(*), Cliente.Estado_civil as Estado_civil
FROM Cliente GROUP BY (Cliente.Estado_civil);

-- cidade com mais clientes
SELECT cidade, contagem
FROM (
    SELECT COUNT(*) AS contagem, DEREF(Cliente.endereco).cidade AS cidade
    FROM Cliente
    GROUP BY DEREF(Cliente.endereco).cidade
)
WHERE contagem = (
    SELECT MAX(contagem)
    FROM (
        SELECT COUNT(*) AS contagem
        FROM Cliente
        GROUP BY DEREF(Cliente.endereco).cidade
    )
);

--ordenando os nomes dos bancos em ordem alfabética e mostrando os telefones
SELECT b.Nome, t.COLUMN_VALUE AS Telefone, b.CNPJ
FROM Banco b,
    TABLE(b.Telefone) t
ORDER BY b.Nome;

-- de quem é o imóvel com maior valor
SELECT *
FROM (
    SELECT CPF_PROPRIETARIO, VALOR, IDIMOVEL
    FROM Imovel
    ORDER BY VALOR DESC
) 
WHERE ROWNUM = 1;

-- qual o telefone do corretor de tal cpf
DECLARE
    cpf_input CHAR(11) := '23456789012'; -- Substitua pelo CPF desejado
    telefones array_telefone;
BEGIN
    telefones := getTelefonesPorCPF(cpf_input);
    
    -- Exibindo os telefones
    IF telefones IS NOT NULL THEN
        FOR i IN 1 .. telefones.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(telefones(i));
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Corretor não encontrado.');
    END IF;
END;
/

-- qual imovel teve menor avaliação
SELECT *
FROM (
    SELECT Avaliacao, CPF_proprietario, CPF_locatario, idImovel
    FROM Visita
    ORDER BY Avaliacao
) 
WHERE ROWNUM = 1;

-- consultando a soma das mensalidade de um determinado imovel
SELECT SUM(Mensalidade) AS Valor_Total_Mensalidade
FROM Aluga
WHERE idImovel = 3

-- qual o tipo desejado de cliente para um imovel
SELECT Cliente_desejado
FROM Anuncia
WHERE idImovel = 5

-- endereço do imovel anunciado
SELECT 
    a.CPF_PROPRIETARIO,
    i.TITULO,
    DEREF(i.ENDERECO).cidade,
    DEREF(i.ENDERECO).CEP
FROM 
    ANUNCIA a
JOIN 
    IMOVEL i ON a.IDIMOVEL = i.IDIMOVEL

-- Seleciona nome, genero, endereço e lista os telefones de proprietarios
SELECT nome, genero, LISTAGG(t.column_value, ', ') WITHIN GROUP(ORDER BY t.column_value)AS telefone, DEREF(endereco).rua AS rua,
DEREF(endereco).cidade AS cidade
FROM proprietario p, TABLE(p.telefone) t
GROUP BY p.nome, p.genero, DEREF(p.endereco).rua, DEREF(p.endereco).cidade;

-- Seleciona Imoveis que tem proprietário do sexo feminino
SELECT idImovel, Valor, DEREF(i.endereco).cidade AS cidade
FROM imovel i
JOIN proprietario p ON i.cpf_proprietario = p.cpf_cliente
WHERE p.genero ='Feminino';

-- Seleciona nome do banco e lista os telefones para bancos que tem um financiamento com algum locatario
SELECT  
    b.nome,  
    LISTAGG(t.column_value, ', ') WITHIN GROUP (ORDER BY t.column_value) AS telefone 
FROM  
    Banco b,  
    TABLE(b.telefone) t
WHERE b.cnpj IN (SELECT b.cnpj
FROM Banco b 
INNER JOIN financia f  
    ON b.cnpj = DEREF(f.banco).cnpj
INNER JOIN locatario l  
    ON DEREF(f.locatario).cpf_cliente = l.cpf_cliente  
) 
GROUP BY  
    b.nome

--TESTANDO A FUNÇÃO valor_anual
DECLARE
  v_aluguel tipo_Aluga;
  v_valor_anual FLOAT;
BEGIN
  -- Criando uma instância do tipo_aluga
  v_aluguel := tipo_Aluga(idImovel => 123,
                         CPF_corretor => '12345678901',
                         CPF_locatario => '98765432101',
                         Mensalidade => 1000,
                         Inicio => TO_DATE('01/01/2024', 'DD/MM/YYYY'),
                         Fim => TO_DATE('31/12/2024', 'DD/MM/YYYY'));

  -- Calculando o valor anual
  v_valor_anual := v_aluguel.valor_anual;

  DBMS_OUTPUT.PUT_LINE('Valor anual: ' || v_valor_anual);
END;
/

--Quais corretores contataram clientes que desejam uma casa
SELECT c.Nome, l.Tipo_desejado
FROM Corretor c
INNER JOIN Contata co ON c.CPF_corretor = co.CPF_corretor
INNER JOIN Locatario l ON co.CPF_locatario = l.CPF_cliente
INNER JOIN Aluga a ON l.CPF_cliente = a.CPF_locatario
INNER JOIN Imovel i ON a.idImovel = i.idImovel
WHERE l.Tipo_desejado LIKE '%Casa%';

-- Quais imóveis foram visitados por um determinado corretor e qual a avaliação média dessas visitas
SELECT i.Titulo, AVG(v.Avaliacao) AS Media_Avaliacao
FROM Imovel i
INNER JOIN Visita v ON i.idImovel = v.idImovel
WHERE v.CPF_corretor = '34567890123'  
GROUP BY i.Titulo;

--Quais imóveis receberam mais visitas em um determinado período
SELECT i.Titulo, COUNT(*) AS Numero_Visitas
FROM Imovel i
INNER JOIN Visita v ON i.idImovel = v.idImovel
WHERE v.Data BETWEEN '01-JAN-2023' AND '31-MAR-2024'  
GROUP BY i.Titulo
ORDER BY Numero_Visitas DESC;

-- Quais clientes possuem um imóvel alugado
SELECT c.Nome, COUNT(*) AS Numero_Imoveis_Alugados
FROM Cliente c
INNER JOIN Aluga a ON c.CPF_cliente = a.CPF_locatario
GROUP BY c.Nome
HAVING COUNT(*) = 1;
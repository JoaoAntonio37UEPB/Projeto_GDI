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

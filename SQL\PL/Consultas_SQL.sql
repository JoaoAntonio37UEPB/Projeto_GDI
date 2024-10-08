-- Qual a média de valor por tipo de Imóvel em ordem crescente?
SELECT tipo, ROUND(AVG(valor),2) AS media_valor
FROM imovel
GROUP BY tipo
ORDER BY media_valor;

-- Contagem de imoveis para cada quantidade de quartos, com mensalidade acima de 2000
SELECT quartos, COUNT(*) AS qtd_imoveis
FROM imovel i
INNER JOIN aluga a ON i.idimovel = a.idimovel
WHERE mensalidade > 2000.00
GROUP BY quartos
ORDER BY quartos ASC;

-- Seleciona imoveis que tem piscina em sua descricao e com 3,4 ou 5 quartos
SELECT titulo, valor, quartos, banheiros
FROM imovel 
WHERE descricao LIKE '%piscina%'
    AND quartos IN (3,4,5);

-- Seleciona titulo, descricao e mensalidade de imoveis disponíveis entre Julho e Dezembro de 2025
SELECT titulo, descricao, mensalidade AS mensalidade_anterior
FROM aluga
INNER JOIN imovel ON aluga.idimovel = imovel.idimovel
WHERE fim NOT BETWEEN '01-JUL-25' AND '31-DEC-25';


-- Imoveis não visitados
SELECT titulo, rua, valor, parcelas
FROM imovel i
LEFT JOIN visita v ON i.idimovel = v.idimovel
WHERE avaliacao IS NULL;

-- Retorna nome e telefone de corretores que não estão participando de um aluguel
SELECT nome, telefone 
FROM corretores 
WHERE cpf_corretor IN (SELECT cpf_corretor 
FROM corretores 
MINUS 
SELECT cpf_corretor  
FROM aluga )
– Cria um usuario e da direito de conexão a ele
CREATE USER usuario IDENTIFIED BY senha;
GRANT CONNECT TO usuario;


-- Imovel com maior preço
SELECT MAX(Valor) AS ValorMaximo
FROM Imovel;

-- Imovel com mais quartos
SELECT MAX(Quartos) AS ValorMaximo
FROM Imovel;

-- Imovel com menor preço
SELECT MIN(Valor) AS ValorMinimo
FROM Imovel;

--Imovel com menos parcelas
SELECT MIN(Parcelas) AS ValorMinimo
FROM Imovel;


--Adicionando uma coluna cidade na tabela Imovel
ALTER TABLE Imovel
ADD Cidade VARCHAR2(100);


--preenchendo a nova coluna de imovel
UPDATE Imovel SET Cidade = 'São Paulo' WHERE idImovel = 1;
UPDATE Imovel SET Cidade = 'São Paulo' WHERE idImovel = 2;
UPDATE Imovel SET Cidade = 'Recife' WHERE idImovel = 3;
UPDATE Imovel SET Cidade = 'Rio de Janeiro' WHERE idImovel = 4;
UPDATE Imovel SET Cidade = 'Cuiabá' WHERE idImovel = 5;
UPDATE Imovel SET Cidade = 'Recife' WHERE idImovel = 6;
UPDATE Imovel SET Cidade = 'São Paulo' WHERE idImovel = 7;
UPDATE Imovel SET Cidade = 'São Paulo' WHERE idImovel = 8;

--Caso algum cliente mude de telefone
UPDATE Cliente SET Telefone = '(11) 99475-7498' WHERE CPF_cliente = '12345678903';


--Criando uma view que mostra locatários que não tenham pets
CREATE VIEW LocatarioSemPet AS
SELECT CPF_locatario, Renda_Media, Tipo_desejado, Ocupacao
FROM Locatario
WHERE Tem_Pet = 'Nao';


--SUBCONSULTA COM OPERADOR RELACIONAL

-- A consulta principal seleciona os imóveis com valor maior do que a média dos valores dos imóveis na cidade de "São Paulo".
SELECT idImovel, Cidade, Valor
FROM Imovel
WHERE Valor > (
    – Aqui fica a subconsulta que calcula a média dos valores dos imóveis na cidade de "São Paulo".
    SELECT AVG(Valor)
    FROM Imovel
    WHERE Cidade = 'São Paulo'
);
-- listar as cidades que têm mais de 3 imóveis e calcular a média dos valores deles:
SELECT Cidade, COUNT(idImovel) AS TotalImoveis, AVG(Valor) AS MediaValor
FROM Imovel
GROUP BY Cidade
HAVING COUNT(idImovel) > 3;

--IN
--quais são os nomes e telefones dos locatarios que possuem salario abaixo de R$ 6000?

SELECT nome, telefone
FROM cliente 
WHERE cpf_cliente IN (SELECT cpf_locatario FROM locatario WHERE renda_media< 6000)


--Criando index para Status na tabela Anuncia para fazer consultas mais rapidamente
CREATE INDEX idx_status
ON Anuncia (Status);

-- Apagando visitas que aconteceram antes de uma certa data para limpar o banco de dados
DELETE FROM Visita
WHERE DATA < DATE '2024-05-01';

-- Apagando visitas com nota menor que 4
DELETE FROM Visita
WHERE AVALIACAO < 4;



--ANY
--quais são as ocupações dos locatários que possuem maiores salários entre os próprios locatários?

SELECT ocupacao, renda_media
FROM locatario
WHERE renda_media > ANY(SELECT renda_media FROM locatario);


--ALL
--Retornar o nome e o salário dos locatarios cujo salário seja maior que o salário de todos os locatarios que tenha mias de R$5000 de salario.

SELECT cpf_locatario, renda_media
FROM locatario
WHERE renda_media > ALL(SELECT renda_media FROM locatario where renda_media < 5000);

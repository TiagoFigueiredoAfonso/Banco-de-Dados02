1) Crie uma view que tenha como saída: o nome dos funcionários, data de contração dele, o nome
do departamento que ele trabalha e o nome dos projetos controlados pelo departamento. A data de
contratação deve sair no formato DD/MM/YYYY. Mostre como usar a view.

CREATE OR REPLACE VIEW TABELA01(FUNCIONÁRIO, DATA_CONTRATACAO, NOME_DEPARTAMENTO, NOME_PRJETO ) AS
SELECT F.NOME, TO_CHAR(F.DATA_CONTRATACAO, 'DD/MM/YYYY'), DP.NOME, PJ.NOME
FROM FUNCIONARIO F JOIN DEPARTAMENTO DP ON DP.CODIGO = F.CODIGO_DEPARTAMENTO
JOIN PROJETO PJ ON DP.CODIGO = PJ.CODIGO_DEPARTAMENTO

SELECT * FROM TABELA01

2) Crie uma view que tenha como saída: o nome dos funcionários, tempo de contratação em anos
dos funcionários, o nome e o tempo de criação do departamento que estão vinculados e o nome da
localização do departamento. Considere somente departamentos criados no ano de 2013. Mostre
como usar a view.

CREATE OR REPLACE VIEW TABELA02 AS
SELECT F.NOME AS FUNCIONARIO, EXTRACT(YEAR FROM AGE(F.DATA_CONTRATACAO)) AS DATA_CONTRATACAO, DP.DATA_CRIACAO, L.NOME AS LOCAL
FROM FUNCIONARIO F JOIN DEPARTAMENTO DP ON DP.CODIGO = F.CODIGO_DEPARTAMENTO
JOIN LOCALIZACAO L ON L.CODIGO = DP.CODIGO_LOCALIZACAO
WHERE DP.DATA_CRIACAO BETWEEN '2013-01-01' AND '2013-12-01';

SELECT * FROM TABELA02;

3) Crie uma view que tenha como saída: Os dados dos projetos ativos controlados por
departamentos criados entre o ano de 2013 e 2020. Mostre como usar a view.

CREATE OR REPLACE VIEW TABELA03 AS 
SELECT DP.NOME AS DEPARTAMENTO, PJ.NOME AS NOME_PROJETO_ATIVOS, DP.DATA_CRIACAO
FROM DEPARTAMENTO DP JOIN PROJETO PJ ON DP.CODIGO = PJ.CODIGO_DEPARTAMENTO
WHERE PJ.ATIVO = 'TRUE'
AND DP.DATA_CRIACAO BETWEEN '2013-01-01' AND '2020-12-31';

SELECT * FROM TABELA03;

4) Crie uma view que tenha como saída: A quantidade de funcionários contratados por ano e a
média salarial destes funcionários. Arredonde a média em duas casas decimais. Ordene pelo ano a
saída. Mostre como usar a view.

CREATE OR REPLACE VIEW TABELA04 (QUANTIDADE_CONTRATOS, ANO, MEDIA_SALARIAL) AS
SELECT COUNT(F.NOME), TO_CHAR(F.DATA_CONTRATACAO, 'YYYY'), ROUND(AVG(F.SALARIO),2)
FROM FUNCIONARIO F
GROUP BY F.DATA_CONTRATACAO;

SELECT * FROM TABELA04;

5) Remova a view criada no exercício dois.

DROP VIEW TABELA02;
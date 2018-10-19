--EX 1 --

USE PEDIDOS

--Ex 2 --

SELECT P.NUM_PEDIDO, P.DATA_EMISSAO, P.VLR_TOTAL, V.NOME AS NOME_VENDEDOR
FROM TB_PEDIDO P JOIN TB_VENDEDOR V ON V.CODVEN = P.CODVEN;


-- EX 3 --

SELECT PE.NUM_PEDIDO , PE.DATA_EMISSAO , PE.VLR_TOTAL, C.NOME
FROM TB_PEDIDO PE
JOIN TB_CLIENTE C ON PE.CODCLI = C.CODCLI

-- EX 4 --

SELECT C.NOME AS NOME_CLIENTE, V.NOME AS NOME_VENDEDOR, P.NUM_PEDIDO
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
JOIN  TB_VENDEDOR V ON P.CODVEN = V.CODVEN

-- EX 5--

SELECT I.*, P.DESCRICAO
FROM TB_ITENSPEDIDO I 
JOIN TB_PRODUTO P ON I.ID_PRODUTO = P.ID_PRODUTO;

-- EX 6--

SELECT P.COD_PRODUTO, P.DESCRICAO, T.TIPO 
FROM TB_PRODUTO P JOIN TB_TIPOPRODUTO T ON P.COD_TIPO = T.COD_TIPO; 

--EX7--

SELECT P.COD_PRODUTO,P.DESCRICAO,U.UNIDADE,TP.TIPO FROM 
TB_PRODUTO P 
JOIN TB_UNIDADE U ON U.COD_UNIDADE=P.COD_UNIDADE 
JOIN TB_TIPOPRODUTO TP ON TP.COD_TIPO=P.COD_TIPO;

--EX8--

SELECT IP.NUM_PEDIDO,IP.NUM_ITEM,IP.COD_PRODUTO,IP.QUANTIDADE,IP.PR_UNITARIO,P.COD_PRODUTO,P.DESCRICAO,TP.TIPO,U.UNIDADE,C.COR 
FROM TB_ITENSPEDIDO IP JOIN TB_PRODUTO P 
ON P.ID_PRODUTO = IP.ID_PRODUTO 
JOIN TB_COR C ON C.CODCOR = IP.CODCOR 
JOIN TB_UNIDADE U ON P.COD_UNIDADE=U.COD_UNIDADE 
JOIN TB_TIPOPRODUTO TP ON TP.COD_TIPO = P.COD_TIPO;

--EX9--

 SELECT IP.NUM_PEDIDO,IP.NUM_ITEM,IP.COD_PRODUTO,IP.QUANTIDADE,IP.PR_UNITARIO,P.COD_PRODUTO,P.DESCRICAO,TP.TIPO,U.UNIDADE,C.COR 
FROM TB_ITENSPEDIDO IP JOIN TB_PRODUTO P 
ON P.ID_PRODUTO = IP.ID_PRODUTO 
JOIN TB_COR C ON C.CODCOR = IP.CODCOR 
JOIN TB_UNIDADE U ON P.COD_UNIDADE=U.COD_UNIDADE 
JOIN TB_TIPOPRODUTO TP ON TP.COD_TIPO = P.COD_TIPO;

--EX 10--

SELECT P.*,V.NOME FROM TB_PEDIDO P 
JOIN TB_VENDEDOR V ON V.CODVEN = P.CODVEN 
WHERE V.NOME='MARCELO' AND YEAR(P.DATA_EMISSAO) = 2017 
AND MONTH(P.DATA_EMISSAO) =1;


--EX11--

SELECT	NOME, TB_PEDIDO.DATA_EMISSAO FROM TB_CLIENTE
JOIN TB_PEDIDO ON TB_CLIENTE.CODCLI = TB_PEDIDO.CODCLI
WHERE TB_PEDIDO.DATA_EMISSAO BETWEEN '2017-01-01' AND '2017-12-31';

--EX12--

SELECT DESCRICAO FROM TB_PRODUTO
JOIN TB_ITENSPEDIDO ON TB_PRODUTO.ID_PRODUTO = TB_ITENSPEDIDO.ID_PRODUTO
WHERE DATA_ENTREGA BETWEEN '2017-01-01' AND '2017-01-31';

--PT13

SELECT NUM_PEDIDO,
	   VLR_TOTAL,
	   TB_CLIENTE.NOME
FROM TB_PEDIDO
       JOIN TB_CLIENTE ON TB_PEDIDO.CODCLI = TB_CLIENTE.CODCLI
	   WHERE (DATA_EMISSAO BETWEEN '2017-01-01' AND '2017-01-31') AND (NOME LIKE 'MARCIO%')

SELECT DATA_EMISSAO FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2017-01-01 00:00:00.000' AND '2017-01-31 23:59:59 59'

--EX14
SELECT TB_PEDIDO.NUM_PEDIDO,
	   QUANTIDADE,
	   PR_UNITARIO,
	   TB_PRODUTO.DESCRICAO,
	   TB_VENDEDOR.NOME
FROM TB_ITENSPEDIDO
		JOIN TB_PRODUTO ON TB_PRODUTO.ID_PRODUTO = TB_ITENSPEDIDO.ID_PRODUTO
		JOIN TB_PEDIDO ON TB_ITENSPEDIDO.NUM_PEDIDO = TB_PEDIDO.NUM_PEDIDO
		JOIN TB_VENDEDOR ON TB_VENDEDOR.CODVEN = TB_PEDIDO.CODVEN

--EX14
SELECT TB_PEDIDO.NUM_PEDIDO,
	   QUANTIDADE,
	   PR_UNITARIO,
	   TB_PRODUTO.DESCRICAO,
	   TB_VENDEDOR.NOME
FROM TB_ITENSPEDIDO
		JOIN TB_PRODUTO ON TB_PRODUTO.ID_PRODUTO = TB_ITENSPEDIDO.ID_PRODUTO
		JOIN TB_PEDIDO ON TB_ITENSPEDIDO.NUM_PEDIDO = TB_PEDIDO.NUM_PEDIDO
		JOIN TB_VENDEDOR ON TB_VENDEDOR.CODVEN = TB_PEDIDO.CODVEN




-- 17 
SELECT
 TB_FORNECEDOR.NOME,
 TB_FORNECEDOR.FONE1,
 TB_PRODUTO.DESCRICAO
FROM TB_FORNECEDOR
INNER JOIN TB_PRODUTO ON TB_PRODUTO.DESCRICAO = TB_PRODUTO.DESCRICAO 
WHERE DESCRICAO = 'CANETA STAR I'



-- 18 
 SELECT
 TB_PRODUTO.DESCRICAO,
 TB_FORNECEDOR.NOME
FROM TB_PRODUTO
INNER JOIN TB_FORNECEDOR ON TB_FORNECEDOR.NOME = TB_FORNECEDOR.NOME 
WHERE NOME LIKE 'LINCE%'


-- 19 
SELECT
 TB_FORNECEDOR.NOME,
 TB_FORNECEDOR.FONE1,
 TB_PRODUTO.DESCRICAO,
 TB_PRODUTO.QTD_REAL,
 TB_PRODUTO.QTD_MINIMA
FROM TB_FORNECEDOR
INNER JOIN TB_PRODUTO ON TB_PRODUTO.DESCRICAO = TB_PRODUTO.DESCRICAO 
WHERE QTD_REAL < QTD_MINIMA;




--20 EX
--EX19
SELECT P.*,F.NOME FROM TB_FORNECEDOR F 
JOIN TB_PROD_FORN PF ON PF.COD_FORNECEDOR = F.COD_FORNECEDOR 
JOIN TB_PRODUTO P ON P.ID_PRODUTO = PF.ID_PRODUTO 
WHERE F.NOME LIKE 'FESTO%';
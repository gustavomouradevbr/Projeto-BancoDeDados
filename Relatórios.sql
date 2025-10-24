-- Relatórios 

SELECT p.id_produto, p.nome AS produto, p.preco, c.nome AS categoria, f.nome AS fornecedor
FROM produto p
JOIN categoria c ON p.id_categoria = c.id_categoria
JOIN fornecedor f ON p.id_fornecedor = f.id_fornecedor;

SELECT c.nome AS cliente, SUM(v.valor_total) AS total_gasto
FROM cliente c
JOIN venda v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_gasto DESC;

SELECT p.nome AS produto, e.quantidade
FROM produto p
JOIN estoque e ON p.id_produto = e.id_produto
WHERE e.quantidade < 10
ORDER BY e.quantidade ASC;

SELECT f.nome AS funcionario, COUNT(v.id_venda) AS total_vendas
FROM funcionario f
JOIN venda v ON f.id_funcionario = v.id_funcionario
GROUP BY f.id_funcionario
ORDER BY total_vendas DESC;

SELECT forma_pagamento, ROUND(AVG(valor_total),2) AS valor_medio
FROM venda
GROUP BY forma_pagamento;

SELECT p.nome AS produto, SUM(vi.quantidade) AS total_vendido
FROM venda_item vi
JOIN produto p ON vi.id_produto = p.id_produto
GROUP BY p.id_produto
ORDER BY total_vendido DESC
LIMIT 10;

SELECT c.nome, SUM(v.valor_total) AS total_compras
FROM cliente c
JOIN venda v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
HAVING total_compras > 500;

SELECT p.nome AS produto, p.preco, 
(SELECT valor FROM promocao pr WHERE CURDATE() BETWEEN pr.data_inicio AND pr.data_fim ORDER BY pr.valor DESC LIMIT 1) AS desconto_ativo
FROM produto p;

SELECT v.id_venda, c.nome AS cliente, f.nome AS funcionario, v.valor_total, v.data_venda
FROM venda v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN funcionario f ON v.id_funcionario = f.id_funcionario
WHERE MONTH(v.data_venda) = 6 AND YEAR(v.data_venda) = 2024;

SELECT c.nome AS categoria, COUNT(p.id_produto) AS total_produtos
FROM categoria c
LEFT JOIN produto p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria;

SELECT nome, cargo, salario
FROM funcionario
WHERE salario > (SELECT AVG(salario) FROM funcionario);

SELECT status, COUNT(id_venda) AS total_vendas, ROUND(SUM(valor_total),2) AS valor_total
FROM venda
GROUP BY status;

SELECT f.nome AS fornecedor, COUNT(p.id_produto) AS produtos_fornecidos
FROM fornecedor f
JOIN produto p ON f.id_fornecedor = p.id_fornecedor
GROUP BY f.id_fornecedor;

SELECT nome, email
FROM cliente
WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM venda);

SELECT c.nome AS categoria, SUM(vi.quantidade) AS total_vendido
FROM venda_item vi
JOIN produto p ON vi.id_produto = p.id_produto
JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria
ORDER BY total_vendido DESC;

SELECT tipo_pagamento, SUM(valor) AS total_recebido
FROM pagamento
GROUP BY tipo_pagamento;

SELECT p.nome, SUM(vi.quantidade * vi.preco_unitario) AS valor_movimentado
FROM produto p
JOIN venda_item vi ON p.id_produto = vi.id_produto
GROUP BY p.id_produto
ORDER BY valor_movimentado DESC;

SELECT c.nome AS cliente, f.nome AS funcionario, COUNT(v.id_venda) AS total_atendimentos
FROM venda v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN funcionario f ON v.id_funcionario = f.id_funcionario
GROUP BY c.id_cliente, f.id_funcionario
ORDER BY total_atendimentos DESC;

SELECT f.nome AS funcionario, ROUND(AVG(v.valor_total),2) AS media_venda
FROM funcionario f
JOIN venda v ON f.id_funcionario = v.id_funcionario
GROUP BY f.id_funcionario;

SELECT v.id_venda, c.nome AS cliente, f.nome AS funcionario, v.valor_total, v.data_venda
FROM venda v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN funcionario f ON v.id_funcionario = f.id_funcionario
ORDER BY v.data_venda DESC
LIMIT 10;

SELECT c.endereco AS cidade, COUNT(v.id_venda) AS total_vendas, SUM(v.valor_total) AS total_valor
FROM venda v
JOIN cliente c ON v.id_cliente = c.id_cliente
GROUP BY c.endereco;


SELECT nome, tipo, valor, data_inicio, data_fim
FROM promocao
WHERE CURDATE() BETWEEN data_inicio AND data_fim;

SELECT nome
FROM produto
WHERE id_produto IN (
    SELECT id_produto
    FROM venda_item
    GROUP BY id_produto
    HAVING COUNT(id_venda) > 1
);

SELECT MONTH(data_venda) AS mes, YEAR(data_venda) AS ano, SUM(valor_total) AS total_mensal
FROM venda
GROUP BY ano, mes
ORDER BY ano, mes;

SELECT c.nome, COUNT(v.id_venda) AS quantidade_compras
FROM cliente c
JOIN venda v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY quantidade_compras DESC
LIMIT 5;
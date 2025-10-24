-- Views

DROP VIEW IF EXISTS vw_vendas_resumo;

CREATE VIEW vw_vendas_resumo AS
SELECT 
    v.id_venda,
    v.data_venda,
    c.nome AS cliente,
    f.nome AS funcionario,
    v.valor_total,
    v.status
FROM venda v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN funcionario f ON v.id_funcionario = f.id_funcionario;

CREATE OR REPLACE VIEW vw_top_clientes AS
SELECT 
    c.nome, 
    SUM(v.valor_total) AS total_gasto
FROM cliente c
JOIN venda v ON c.id_cliente = v.id_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 10;

CREATE OR REPLACE VIEW vw_top_produtos AS
SELECT 
    p.nome, 
    SUM(vi.quantidade) AS qtd_vendida
FROM produto p
JOIN venda_item vi ON p.id_produto = vi.id_produto
GROUP BY p.nome
ORDER BY qtd_vendida DESC
LIMIT 10;

CREATE OR REPLACE VIEW vw_faturamento_diario AS
SELECT 
    DATE(data_venda) AS dia, 
    SUM(valor_total) AS total
FROM venda
WHERE status = 'PAGO'
GROUP BY dia;

CREATE OR REPLACE VIEW vw_pagamentos_tipo AS
SELECT 
    tipo_pagamento, 
    COUNT(*) AS qtd, 
    SUM(valor) AS total
FROM pagamento
GROUP BY tipo_pagamento;

CREATE OR REPLACE VIEW vw_clientes_sem_compras AS
SELECT 
    c.nome
FROM cliente c
LEFT JOIN venda v ON v.id_cliente = c.id_cliente
WHERE v.id_venda IS NULL;

CREATE OR REPLACE VIEW vw_produtos_sem_venda AS
SELECT 
    p.nome
FROM produto p
LEFT JOIN venda_item vi ON vi.id_produto = p.id_produto
WHERE vi.id_venda_item IS NULL;

CREATE OR REPLACE VIEW vw_vendas_pagas AS
SELECT *
FROM venda
WHERE status = 'PAGO';

CREATE OR REPLACE VIEW vw_produto_estoque AS
SELECT 
    p.nome, 
    e.quantidade, 
    e.localizacao
FROM produto p
JOIN estoque e ON e.id_produto = p.id_produto;

CREATE OR REPLACE VIEW vw_funcionario_vendas AS
SELECT 
    f.nome, 
    COUNT(v.id_venda) AS qtd_vendas, 
    SUM(v.valor_total) AS total
FROM funcionario f
LEFT JOIN venda v ON f.id_funcionario = v.id_funcionario
GROUP BY f.nome;

CREATE OR REPLACE VIEW vw_promocoes_ativas AS
SELECT *
FROM promocao
WHERE CURDATE() BETWEEN data_inicio AND data_fim;
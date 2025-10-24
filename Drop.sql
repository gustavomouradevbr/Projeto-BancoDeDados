-- Drop

DROP VIEW IF EXISTS vw_faturamento_diario;

DROP VIEW IF EXISTS vw_top_clientes;

DROP VIEW IF EXISTS vw_top_produtos;

DROP VIEW IF EXISTS vw_estoque_baixo;

DROP VIEW IF EXISTS vw_vendas_pagas;

DROP VIEW IF EXISTS vw_produto_estoque;

DROP VIEW IF EXISTS vw_clientes_sem_compras;

DROP VIEW IF EXISTS vw_vendas_resumo;

DROP VIEW IF EXISTS vw_produtos_sem_venda;

DROP VIEW IF EXISTS vw_pagamentos_tipo;


DROP TABLE IF EXISTS pagamento;

DROP TABLE IF EXISTS venda_item;

DROP TABLE IF EXISTS venda;

DROP TABLE IF EXISTS estoque;

DROP TABLE IF EXISTS produto;

DROP TABLE IF EXISTS categoria;

DROP TABLE IF EXISTS cliente;

DROP TABLE IF EXISTS funcionario;

DROP TABLE IF EXISTS fornecedor;

DROP TABLE IF EXISTS promocao;

DROP DATABASE IF EXISTS loja_roupas;
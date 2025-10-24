-- Update 

UPDATE produto SET preco = preco * 1.10 WHERE id_produto = 1;

UPDATE estoque SET quantidade = quantidade + 15 WHERE id_produto = 2;

UPDATE fornecedor SET nome = 'Fornecedor Alpha Ltda.' WHERE id_fornecedor = 1;

UPDATE funcionario SET salario = salario + 500 WHERE id_funcionario = 2;

UPDATE venda SET status = 'CANCELADO' WHERE id_venda = 6;

UPDATE cliente SET email = 'joao.silva@novoemail.com' WHERE id_cliente = 1;

UPDATE categoria SET descricao = 'Moda masculina completa: camisas, calças e ternos' WHERE id_categoria = 1;

UPDATE promocao SET valor = 25 WHERE nome = 'Promo Acessórios';

UPDATE venda SET forma_pagamento = 'PIX' WHERE id_venda = 3;

UPDATE fornecedor SET telefone = '11970001111' WHERE id_fornecedor = 5;

UPDATE funcionario SET cargo = 'Subgerente' WHERE id_funcionario = 7;

UPDATE estoque SET quantidade = quantidade - 10 WHERE id_produto = 8;

UPDATE cliente SET nome = 'Maria Souza Oliveira' WHERE id_cliente = 2;

UPDATE venda SET valor_total = valor_total - 50 WHERE id_venda = 5;

UPDATE funcionario SET salario = 0 WHERE id_funcionario = 20;

UPDATE produto SET cor = 'Azul Escuro' WHERE id_produto = 14;

UPDATE venda_item SET desconto = 15 WHERE id_venda = 10 AND id_produto = 5;

UPDATE promocao SET data_fim = '2025-02-15' WHERE nome = 'Promo Verão';

UPDATE funcionario SET salario = salario + 100 WHERE cargo LIKE 'Vendedor%';

UPDATE produto p
JOIN categoria c ON p.id_categoria = c.id_categoria
SET p.preco = p.preco * 1.05
WHERE c.nome = 'Roupas Femininas';



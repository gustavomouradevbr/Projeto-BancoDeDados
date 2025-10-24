CREATE DATABASE IF NOT EXISTS loja_roupas;
USE loja_roupas;

CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  ativo TINYINT(1) DEFAULT 1
);

CREATE TABLE fornecedor (
  id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  cnpj VARCHAR(20),
  telefone VARCHAR(20),
  telefone2 VARCHAR(20),
  email VARCHAR(100),
  endereco VARCHAR(255)
);

CREATE TABLE produto (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  sku VARCHAR(30) UNIQUE NOT NULL,
  nome VARCHAR(150) NOT NULL,
  descricao TEXT,
  preco DECIMAL(12,2),
  margem_lucro DECIMAL(5,2) DEFAULT 0.00,
  tamanho VARCHAR(10),
  cor VARCHAR(50),
  marca VARCHAR(80),
  id_categoria INT,
  id_fornecedor INT,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,
  cpf CHAR(11) UNIQUE,
  email VARCHAR(120),
  telefone VARCHAR(20),
  endereco VARCHAR(255),
  data_cadastro DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE funcionario (
  id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150),
  cpf CHAR(11) UNIQUE,
  cargo VARCHAR(80),
  salario DECIMAL(10,2),
  telefone VARCHAR(20),
  email VARCHAR(120),
  data_admissao DATE
);

CREATE TABLE estoque (
  id_estoque INT AUTO_INCREMENT PRIMARY KEY,
  id_produto INT,
  quantidade INT,
  localizacao VARCHAR(100),
  data_entrada DATE,
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE venda (
  id_venda INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  id_funcionario INT,
  data_venda DATETIME DEFAULT (CURRENT_TIMESTAMP),
  valor_total DECIMAL(12,2) DEFAULT 0.00,
  status ENUM('PENDENTE','PAGO','CANCELADO','DEVOLVIDO'),
  forma_pagamento VARCHAR(50),
  referencia_pagamento VARCHAR(120),
  observacoes TEXT,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE venda_item (
  id_venda_item INT AUTO_INCREMENT PRIMARY KEY,
  id_venda INT,
  id_produto INT,
  quantidade INT,
  preco_unitario DECIMAL(10,2),
  desconto DECIMAL(10,2),
  FOREIGN KEY (id_venda) REFERENCES venda(id_venda) ON DELETE CASCADE,
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE pagamento (
  id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
  id_venda INT,
  data_pagamento DATETIME DEFAULT (CURRENT_TIMESTAMP),
  valor DECIMAL(12,2),
  tipo_pagamento ENUM('CARTAO','DINHEIRO','PIX','BOLETO','OUTRO'),
  referencia VARCHAR(120),
  FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);

CREATE TABLE promocao (
  id_promocao INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120),
  descricao TEXT,
  data_inicio DATE,
  data_fim DATE,
  tipo ENUM('PERCENTUAL','FIXO'),
  valor DECIMAL(10,2)
);




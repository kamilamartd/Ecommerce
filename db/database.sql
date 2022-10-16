CREATE DATABASE lojaVirtual;
Use lojaVirtual;

CREATE TABLE cliente(
    nome char(50),
    cpf varchar(12) NOT NULL PRIMARY KEY,
    email char(50),
    senha char(6)
);

CREATE TABLE pedido(
    idPedido int (50) PRIMARY KEY,
    cpf varchar(12),

    CONSTRAINT fk_cpf FOREIGN KEY(cpf) REFERENCES cliente(cpf)
);

CREATE TABLE cartao (
    numeroCartao int (20)PRIMARY KEY,
    idPagamento int (50),
    nomeImpresso char (50),
    vencimento date,
    codigoSegunca int (3),
    parcela float (4,2)
);

CREATE TABLE pagamento(
    idPagamento int (50) PRIMARY KEY,
    idPedido int (50),
    numeroCartao int(20),
    valorTotal float (4,2),

    CONSTRAINT fk_numeroCartao FOREIGN KEY(numeroCartao) REFERENCES cartao(numeroCartao)
);

CREATE TABLE venda(
    data date,
    idPedido int (50),
    idPagamento int (50),

    CONSTRAINT fk_idPedido FOREIGN KEY(idPedido) REFERENCES pedido(idPedido),
    CONSTRAINT fk_idPagamento FOREIGN KEY(idPagamento) REFERENCES pagamento(idPagamento)
);

CREATE TABLE item(
    idItem int (50)PRIMARY KEY,
    idPedido int (50),
    quantidade int (250),
    
    CONSTRAINT fk_itemIdPedido FOREIGN KEY(idPedido) REFERENCES pedido(idPedido)
);

CREATE TABLE produto(
    idProduto int (6)PRIMARY KEY,
    idItem int (50),
    nome char (50),
    cor char (20),
    tipo char (40),
    corte char (40),
    tamanho char (5),
    publico char (40),
    promocao float(4,2),
    valor float (4,2), 

    CONSTRAINT fk_idItem FOREIGN KEY(idItem) REFERENCES item(idItem)
);


CREATE TABLE tbadmin(
  email VARCHAR(50) NOT NULL PRIMARY KEY,
  senha VARCHAR(50) NOT NULL
);

INSERT INTO tbadmin (email, senha) VALUES (`admin@ifsp.edu.br`, md5(`1234`));
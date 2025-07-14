CREATE DATABASE sistema_cerealista;
\c sistema_cerealista
SET datestyle TO 'ISO,DMY';

CREATE TABLE IF NOT EXISTS usuario (
    cpf VARCHAR NOT NULL,
    nome_completo VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    senha VARCHAR NOT NULL,
    perfil VARCHAR NOT NULL,
    status VARCHAR NOT NULL,
    visualizar_pedidos BOOLEAN NOT NULL,
    gerar_relatorios BOOLEAN NOT NULL,
    cadastrar_cotacoes BOOLEAN NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (cpf)
    );

CREATE TABLE IF NOT EXISTS endereco (
    codigo INT NOT NULL,
    nome_endereco VARCHAR NOT NULL,
    cep VARCHAR NOT NULL,
    logradouro VARCHAR NOT NULL,
    numero VARCHAR,
    complemento VARCHAR,
    bairro VARCHAR NOT NULL,
    cidade VARCHAR NOT NULL,
    estado VARCHAR NOT NULL,
    ponto_referencia VARCHAR,
    usuario_cpf VARCHAR NOT NULL,
    CONSTRAINT pk_endereco PRIMARY KEY (codigo),
    CONSTRAINT fk_endereco_usuario FOREIGN KEY (usuario_cpf) REFERENCES usuario(cpf)
    );

CREATE TABLE IF NOT EXISTS conta_bancaria (
    codigo INT NOT NULL,
    banco VARCHAR NOT NULL,
    agencia VARCHAR NOT NULL,
    conta VARCHAR NOT NULL,
    tipo_conta VARCHAR NOT NULL,
    titular VARCHAR NOT NULL,
    usuario_cpf VARCHAR NOT NULL,
    CONSTRAINT pk_conta_bancaria PRIMARY KEY (codigo),
    CONSTRAINT fk_conta_bancaria_usuario FOREIGN KEY (usuario_cpf) REFERENCES usuario(cpf)
    );

CREATE TABLE IF NOT EXISTS chave_pix (
    codigo INT NOT NULL,
    tipo_chave VARCHAR NOT NULL,
    chave VARCHAR NOT NULL,
    titular VARCHAR NOT NULL,
    usuario_cpf VARCHAR NOT NULL,
    CONSTRAINT pk_chave_pix PRIMARY KEY (codigo),
    CONSTRAINT fk_chave_pix_usuario FOREIGN KEY (usuario_cpf) REFERENCES usuario(cpf)
    );

CREATE TABLE IF NOT EXISTS pedido_venda (
    codigo INT NOT NULL,
    usuario_cpf VARCHAR NOT NULL,
    endereco_codigo INT,
    tipo_grao VARCHAR NOT NULL,
    quantidade DECIMAL NOT NULL,
    status VARCHAR NOT NULL,
    observacoes TEXT,
    data_criacao TIMESTAMP NOT NULL,
    data_atualizacao TIMESTAMP,
    CONSTRAINT pk_pedido_venda PRIMARY KEY (codigo),
    CONSTRAINT fk_pedido_venda_usuario FOREIGN KEY (usuario_cpf) REFERENCES usuario(cpf),
    CONSTRAINT fk_pedido_venda_endereco FOREIGN KEY (endereco_codigo) REFERENCES endereco(codigo)
    );

CREATE TABLE IF NOT EXISTS cotacao (
    codigo INT NOT NULL,
    pedido_venda_codigo INT NOT NULL,
    funcionario_cpf VARCHAR NOT NULL,
    valor DECIMAL NOT NULL,
    data_envio TIMESTAMP NOT NULL,
    status VARCHAR NOT NULL,
    validade TIMESTAMP NOT NULL,
    CONSTRAINT pk_cotacao PRIMARY KEY (codigo),
    CONSTRAINT fk_cotacao_pedido_venda FOREIGN KEY (pedido_venda_codigo) REFERENCES pedido_venda(codigo),
    CONSTRAINT fk_cotacao_funcionario FOREIGN KEY (funcionario_cpf) REFERENCES usuario(cpf)
    );

CREATE TABLE IF NOT EXISTS negociacao (
    codigo INT NOT NULL,
    cotacao_codigo INT NOT NULL,
    valor_proposta DECIMAL NOT NULL,
    descricao TEXT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    CONSTRAINT pk_negociacao PRIMARY KEY (codigo),
    CONSTRAINT fk_negociacao_cotacao FOREIGN KEY (cotacao_codigo) REFERENCES cotacao(codigo)
    );

CREATE TABLE IF NOT EXISTS pagamento (
    codigo INT NOT NULL,
    pedido_venda_codigo INT NOT NULL,
    condicao_pagamento VARCHAR NOT NULL,
    data_vencimento TIMESTAMP,
    data_hora TIMESTAMP NOT NULL,
    chave_pix_codigo INT,
    conta_bancaria_codigo  INT,
    CONSTRAINT pk_pagamento PRIMARY KEY (codigo),
    CONSTRAINT uk_pagamento_pedido_venda UNIQUE (pedido_venda_codigo),
    CONSTRAINT fk_pagamento_pedido_venda FOREIGN KEY (pedido_venda_codigo) REFERENCES pedido_venda(codigo),
    CONSTRAINT fk_pagamento_chave_pix FOREIGN KEY (chave_pix_codigo) REFERENCES chave_pix(codigo),
    CONSTRAINT fk_pagamento_conta_bancaria FOREIGN KEY (conta_bancaria_codigo) REFERENCES conta_bancaria(codigo)
    );

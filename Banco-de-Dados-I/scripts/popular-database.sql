INSERT INTO usuario (cpf, nome_completo, email, senha, perfil, status, visualizar_pedidos, gerar_relatorios, cadastrar_cotacoes) VALUES
('12345678901', 'Alex Spohr', 'alex@cerealista.com', 'senha123', 'funcionario', 'ativo', TRUE, TRUE, TRUE),
('23456789012', 'Guilherme Rocha', 'guilherme@email.com', 'senha456', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('34567890123', 'Maria Silva', 'maria@email.com', 'senha789', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('45678901234', 'João Santos', 'joao@email.com', 'senha012', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('56789012345', 'Ana Oliveira', 'ana@email.com', 'senha345', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('67890123456', 'Pedro Costa', 'pedro@email.com', 'senha678', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('78901234567', 'Carla Mendes', 'carla@email.com', 'senha901', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('89012345678', 'Lucas Pereira', 'lucas@email.com', 'senha234', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('90123456789', 'Fernanda Lima', 'fernanda@email.com', 'senha567', 'cliente', 'ativo', FALSE, FALSE, FALSE),
('01234567890', 'Ricardo Alves', 'ricardo@email.com', 'senha890', 'cliente', 'ativo', FALSE, FALSE, FALSE);

INSERT INTO endereco (codigo, nome_endereco, cep, logradouro, numero, complemento, bairro, cidade, estado, ponto_referencia, usuario_cpf) VALUES
(1, 'Fazenda Roncador', '65860-000', 'Estrada do Milharal', 'S/N', 'Km 10', 'Zona Rural', 'Santa Maria', 'RS', 'Após a ponte', '23456789012'),
(2, 'Fazenda ABC', '78643-000', 'Rua das Colheitas', '100', 'Galpão B', 'Centro', 'Porto Alegre', 'RS', 'Próximo ao trevo', '23456789012');

INSERT INTO endereco (codigo, nome_endereco, cep, logradouro, numero, complemento, bairro, cidade, estado, ponto_referencia, usuario_cpf) VALUES
(3, 'Sítio do João', '23456-789', 'Rodovia dos Grãos', '250', 'Fazenda', 'Zona Rural', 'Passo Fundo', 'RS', 'Entrada com porteira', '45678901234'),
(4, 'Fazenda da Ana', '34567-890', 'Estrada do Trigo', '550', '', 'Campo Novo', 'Cruz Alta', 'RS', 'Ao lado da igreja', '56789012345'),
(5, 'Armazém Central', '45678-901', 'Avenida das Colheitas', '1200', 'Galpão 3', 'Industrial', 'Pelotas', 'RS', 'Próximo ao posto BR', '67890123456');

INSERT INTO conta_bancaria (codigo, banco, agencia, conta, tipo_conta, titular, usuario_cpf) VALUES
(1, 'Banco do Brasil', '1234', '56789-0', 'corrente', 'Guilherme Rocha', '23456789012'),
(2, 'Banco Santander', '1234', '12345-0', 'corrente', 'Agropecuária Rocha Ltda', '23456789012');

INSERT INTO chave_pix (codigo, tipo_chave, chave, titular, usuario_cpf) VALUES
(1, 'email', 'guilherme@email.com', 'Guilherme Rocha', '23456789012'),
(2, 'celular', '51987654321', 'Guilherme Rocha', '23456789012');

INSERT INTO pedido_venda (codigo, usuario_cpf, endereco_codigo, tipo_grao, quantidade, status, observacoes, data_criacao, data_atualizacao) VALUES
(1, '23456789012', 1, 'milho', 1000, 'pendente', 'Grãos secos e de boa qualidade', '2025-04-10 09:00:00', '2025-04-10 09:00:00'),
(2, '23456789012', 2, 'soja', 800, 'cotacao_enviada', 'Safra recente, armazenada em silo', '2025-04-11 10:30:00', '2025-04-10 09:00:00'),
(3, '23456789012', NULL, 'trigo', 500, 'aprovado', 'Entrega urgente', '2025-04-12 11:45:00', '2025-04-10 09:00:00'),
(4, '23456789012', 1, 'milho', 1200, 'recusado', 'Valor abaixo do esperado', '2025-04-13 14:20:00', '2025-04-10 09:00:00'),
(5, '23456789012', NULL, 'soja', 1500, 'concluído', 'Pagamento via PIX', '2025-04-14 16:00:00', '2025-04-15 10:00:00'),
(6, '23456789012', 2, 'trigo', 700, 'concluído', 'Pagamento via transferência', '2025-04-15 08:45:00', '2025-04-16 10:30:00'),
(7, '23456789012', NULL, 'milho', 900, 'pendente', 'Para análise', '2025-04-16 13:30:00', '2025-04-10 09:00:00'),
(8, '34567890123', 3, 'soja', 2000, 'aprovado', 'Safra de alta qualidade', '2025-04-11 09:15:00', '2025-04-10 09:00:00'),
(9, '45678901234', NULL, 'trigo', 600, 'cotacao_enviada', 'Grãos selecionados', '2025-04-12 10:40:00', '2025-04-10 09:00:00'),
(10, '56789012345', 4, 'milho', 1800, 'concluído', 'Entrega imediata', '2025-04-13 11:20:00', '2025-04-10 09:00:00');

INSERT INTO cotacao (codigo, pedido_venda_codigo, funcionario_cpf, valor, data_envio, status, validade) VALUES
(1, 1, '12345678901', 67000.00, '2025-04-11 14:00:00', 'pendente', '2025-04-18 23:59:59'),
(2, 2, '12345678901', 100800.00, '2025-04-12 10:00:00', 'aceita', '2025-04-19 23:59:59'),
(3, 3, '12345678901', 37500.00, '2025-04-13 11:00:00', 'aceita', '2025-04-20 23:59:59'),
(4, 4, '12345678901', 80400.00, '2025-04-14 15:00:00', 'recusada', '2025-04-21 23:59:59'),
(5, 5, '12345678901', 189000.00, '2025-04-15 09:00:00', 'aceita', '2025-04-22 23:59:59'),
(6, 6, '12345678901', 52500.00, '2025-04-16 09:30:00', 'aceita', '2025-04-23 23:59:59'),
(7, 8, '12345678901', 252000.00, '2025-04-12 11:00:00', 'aceita', '2025-04-24 23:59:59'),
(8, 9, '12345678901', 45000.00, '2025-04-13 11:30:00', 'pendente', '2025-04-25 23:59:59'),
(9, 10, '12345678901', 120600.00, '2025-04-14 12:00:00', 'aceita', '2025-04-26 23:59:59');

INSERT INTO negociacao (codigo, cotacao_codigo, valor_proposta, descricao, data_hora) VALUES
    (1, 1, 70000.00, 'Proposta de contraoferta para valor mais justo', '2025-04-12 10:00:00');

INSERT INTO pagamento (codigo, pedido_venda_codigo, condicao_pagamento, data_vencimento, data_hora, chave_pix_codigo, conta_bancaria_codigo) VALUES
(1, 5, 'PIX', NULL, '2025-04-15 10:00:00', 1, NULL),
(2, 6, 'Transferência Bancária', '2025-04-30 23:59:59', '2025-04-16 10:30:00', NULL, 2);

UPDATE pedido_venda SET status = 'concluído' WHERE codigo IN (5, 6);

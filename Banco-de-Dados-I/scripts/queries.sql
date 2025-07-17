--Buscar pedidos por cliente
SELECT
    pv.codigo,
    pv.tipo_grao,
    pv.quantidade,
    pv.data_criacao,
    pv.data_atualizacao,
    c.valor,
    pv.status
FROM pedido_venda pv
         LEFT JOIN cotacao c ON c.pedido_venda_codigo = pv.codigo
WHERE pv.usuario_cpf = '23456789012'
ORDER BY pv.codigo;

--Buscar pedido pelo código
SELECT
    pv.codigo,
    pv.tipo_grao,
    pv.quantidade,
    pv.data_criacao,
    pv.status,
    c.valor,
    e.nome_endereco
FROM pedido_venda pv
         JOIN cotacao c ON c.pedido_venda_codigo = pv.codigo
         LEFT JOIN endereco e ON e.codigo = pv.endereco_codigo
WHERE pv.codigo = 1;


--Buscar endereços por cliente
SELECT
    e.codigo AS id,
    e.nome_endereco AS titulo,
    e.logradouro,
    e.numero,
    e.complemento,
    e.bairro,
    e.cidade,
    e.estado,
    e.cep,
    e.ponto_referencia
FROM endereco e
WHERE e.usuario_cpf = '23456789012';


--Listar recebimentos por cliente
SELECT
    pv.codigo AS pedido,
    pg.data_hora AS data_pagamento,
    c.valor,
    pg.condicao_pagamento
FROM pagamento pg
         JOIN pedido_venda pv ON pg.pedido_venda_codigo = pv.codigo
         JOIN cotacao c ON c.pedido_venda_codigo = pv.codigo AND c.status = 'aceita'
WHERE pv.status = 'concluído' and pv.usuario_cpf = '23456789012'
ORDER BY pg.data_hora DESC;

--Listar contas bancárias
SELECT
    codigo,
    banco,
    agencia,
    conta,
    tipo_conta,
    titular
FROM conta_bancaria
WHERE usuario_cpf = '23456789012';

--Listar chave pix
SELECT
    codigo,
    tipo_chave,
    chave,
    titular
FROM chave_pix
WHERE usuario_cpf = '23456789012';
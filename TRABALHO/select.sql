select cliente.nome
from cliente 
where status = 'ativo';

select produto.descricao
from produto
where produto.estoque_atual < produto.estoque_minimo;

select venda.venda_id
from venda
where data_venda = "2026-03-05";

select fornecedor.nome
from fornecedor
where fornecedor.cidade = "São Paulo";

select funcionario.nome, funcionario.salario
from funcionario
where funcionario.salario > 3000;

select produto.produto_id, produto.descricao
from produto
where produto.data_cadastro > '2026-02-01';

select venda.venda_id, funcionario.nome, cliente.nome
from venda
inner join cliente
on venda.cliente_id = cliente.cliente_id
inner join funcionario
on venda.funcionario_id = funcionario.funcionario_id;

select produto.descricao, item_compra.quantidade, item_compra.valor_total
from produto
inner join item_compra
on produto.produto_id = item_compra.produto_id;

select compra.compra_id, funcionario.nome, fornecedor.nome
from compra
inner join funcionario
on compra.funcionario_id = funcionario.funcionario_id
inner join fornecedor
on compra.fornecedor_id = fornecedor.fornecedor_id;
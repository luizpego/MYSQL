alter table cliente
add column email_secundario varchar(100);

alter table produto
modify column preco_venda decimal(12,2);

alter table compra
drop column observacao;

alter table produto
add column data_atualizacao date;

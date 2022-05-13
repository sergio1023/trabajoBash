#!/usr/bin/env bash

MYSQL="mysql -u sergio -psergio"

$MYSQL<<FIN
	use jardineria
	select codigo_pedido from pedido
	into outfile "/var/lib/mysql-files/tmp.txt"
	where estado = 'Entregado'

FIN

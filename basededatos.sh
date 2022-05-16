#!/usr/bin/env bash

MYSQL="mysql -u sergio -psergio"
$MYSQL<<FIN
	use jardineria
	select estado into outfile "/var/lib/mysql-files/tmp1.txt" from pedido
	where estado = 'entregado'; 
FIN

while read dni
	do
		
		
	done </var/lib/mysql-files/tmp1.txt

read nombre
read apellido

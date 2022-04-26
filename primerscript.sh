#!/usr/bin/env bash

read nombre x y z
resultado=`expr $a + $b`
resultado2=$(expr $a \* $b) 

# TEST > página 25

test condicion
[ condicion ]

# IF > página 26

if [ condicion ]
 then
   v
  elif [ condicion ]
    f
fi

# CASE > página 28

case $op in
 a) sentencia
 b) sentencia
 c) sentencia
 default) sentencia por defecto
esac


# FOR > página

for i in lista
	do
	  sentencias
	done
	
	

for i in uno,dos,tres,cuatro
for i in $*
 

for((i=0;$i < 10;$i++))
  do
     echo $i
  done
  
 # WHILE > página  30
  
 while [ condicion ]
  do
     sentencias
  done
  
 campo1$campo2$campo3$campo4 > $ es el separador
 OIFS=$IFS
 IFS=
  
 while read var1 var2 var3 var4
   do
     sentencias
   done < $fichero
  IFS=$OIFS
  
  until [ condicion ]
    do
		sentencias
	done
	
# Funcion > página 33
 function nombre_function{
	 codigo de funcion
	}
	
# MYSQL > página 34
	
MYSQL = 'mysql -u root -pcontraseña'

$MYSQL<<FIN
  use empresa;
  select * into out file '/var/lib/mysql_files/tmp.txt'
  fields terminated by "$"
  from empleados where apellido like "a%";
FIN

 IFS=$
 while read a b c 
 do 
 ...
 done < /var/lib/mysql_files/tmp.txt

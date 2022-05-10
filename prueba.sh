#!/usr/bin/env bash

#read -p "¿Cuantas latas tienes?: " a
#echo  $a

ruta=$(yad --width=400 --height=50 --title "Busca tu archivo" --form --center --file \
	--column="") 2> /dev/null
	
comandoll=$(ls -l $ruta)
echo "$comandoll"

yad --width=400 --height=400 --title "Permisos del archivo" --center --list --column="" --column="" --text="${comandoll}"

nombre="soysergi.txt"
concatena="ruta$nombre"
echo $concatena

rm archivo.txt
echo "$ruta" > archivo.txt

ls -l

mv archivo.txt $concatena

ls -l

myfile="$ruta"
echo "${myfile%/*}"
concat="ruta${myfile##*/}"
echo $concat

echo "$concat" > ~/Escritorio/trabajoBash/basura/veamos.txt

cd basura/
rutaca=$(cat rutantiguapermisos.txt)
echo $rutaca

cadena=$rutaca
echo "${cadena%/*}"

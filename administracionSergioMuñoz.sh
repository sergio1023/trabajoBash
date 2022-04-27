#!/usr/bin/env bash

#read -p "¿Cuantas latas tienes?: " a
#echo  $a

function fpermisos(){
	ruta=$(yad --width=400 --height=50 --title "Busca tu archivo" --form --center --field=fichero:FL \
	--column="") 2> /dev/null
	permisos=$(yad --width=400 --height=50 --title "Establece permisos" --center --text-align=center \
	--text="Establece permisos al fichero" --entry --button=Establecer:0 --button=Cancelar:1)
	
	ans=$?
	
		if [ $ans -eq 0 ]
		then
			chmod $permisos $ruta
			echo "Permisos establecidos"
		else
			echo "No quiere continuar"
		fi
	resultado=$(yad --width=400 --height=50 --title "Permisos del archivo" --center )
 }
function ftareas(){
	echo "Tarea"
 }
function fborrar(){
	echo "borrar"
	borrar=$(yad --width=400 --height=350 --title "Archivo a borrar" --form --center --field=fichero:FL \
	--column="" ) 2> /dev/null
	rm -r $borrar
	echo "Has borrado el archivo" $borrar
}
function frecuperar(){
	echo "recuperar"
 }
function salir (){
      exit 0
     }


op1="<span weight=\"bold\" font=\"12\">Gestion permisos</span>"
op2="<span weight=\"bold\" font=\"12\">Tareas programadas</span>"
op3="<span weight=\"bold\" font=\"12\">Borrar ficheros</span>"
op4="<span weight=\"bold\" font=\"12\">Recuperar ficheros</span>"
op5="<span weight=\"bold\" font=\"12\">Salir</span>"

op=$(yad --width=300 --height=250 --title "Menu utilidades" --list \
--column="" --column="" 1 "${op1}" 2 "${op2}" 3 "${op3}" 4 "${op4}" 5 "${op5}" --center) 2> /dev/null

op=`echo $op | cut -f1 -d"|"`

case $op in
	"1") fpermisos;;
	"2") ftareas;;
	"3") fborrar;;
	"4") frecuperar;;
	"5") salir;;
esac

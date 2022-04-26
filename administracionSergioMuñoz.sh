#!/usr/bin/env bash

read -p "¿Cuantas latas tienes?: " a
echo  $a

op1="<span weight=\"bold\" font=\"12\">Gestion permisos</span>"
op2="<span weight=\"bold\" font=\"12\">Tareas programadas</span>"
op3="<span weight=\"bold\" font=\"12\">Borrar ficheros</span>"
op4="<span weight=\"bold\" font=\"12\">Recuperar ficheros</span>"
op5="<span weight=\"bold\" font=\"12\">Salir</span>"

op=$(yad --width=300 --height=250 --title "Menu utilidades" --list --column="" --column="" 1 "${op1}" 2 "${op2}" 3 "${op3}" 4 "${op4}" 5 "${op5}" --center) 2> /dev/null


case $op in
	1) fpermisos;;
	2) ftareas;;
	3) fborrar;;
	4) frecuperar;;
	5) salir;;
esac

function fpermisos{
	
 }
function ftareas{
	
 }
function fborrar{
	
}
function frecuperar{
	
 }

function salir {
      exit 0
     }      

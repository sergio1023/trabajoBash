#!/usr/bin/env bash

#read -p "¿Cuantas latas tienes?: " a
#echo  $a

function fpermisos(){
	ruta=$(yad --width=400 --height=50 --title "Selecciona archivo" --form --center --file \
	--column="") 2> /dev/null
	permisospropietarios=$(yad --width=400 --height=50 --title "Permisos para propietarios" --center --text-align=center \
	--text="Establece permisos de propietario al fichero" --entry --button=Establecer:0 )
	while [ $permisospropietarios -gt 7 ]
		do
			yad --width=400 --height=50 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7"
			permisospropietarios=$(yad --width=400 --height=50 --title "Permisos para propietarios" --center --text-align=center \
			--text="Establece permisos de propietario al fichero" --entry --button=Establecer:0 )
		done
	
	permisosgrupos=$(yad --width=400 --height=50 --title "Permisos para grupos" --center --text-align=center \
	--text="Establece permisos de grupos al fichero" --entry --button=Establecer:0 )
	while [ $permisosgrupos -gt 7 ]
		do
			yad --width=400 --height=50 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7"
			permisosgrupos=$(yad --width=400 --height=50 --title "Permisos para grupos" --center --text-align=center \
			--text="Establece permisos de grupos al fichero" --entry --button=Establecer:0 )
		done
	permisosotros=$(yad --width=400 --height=50 --title "Permisos para otros" --center --text-align=center \
	--text="Establece permisos de otros al fichero" --entry --button=Establecer:0 )
	while [ $permisosotros -gt 7 ]
		do
			yad --width=400 --height=50 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7"
			permisosotros=$(yad --width=400 --height=50 --title "Permisos para otros" --center --text-align=center \
			--text="Establece permisos de otros al fichero" --entry --button=Establecer:0 )
		done
		
		permisos="$permisospropietarios$permisosgrupos$permisosotros"
		chmod $permisos $ruta
		comandols=$(ls -l $ruta)
		echo $comandols
			resultado=$(yad --width=400 --height=300 --title "Permisos finales del archivo" --center  \
			--text="${comandols}")
 }
function ftareas(){
	echo "Tarea"
 }
function fborrar(){
	borrar=$(yad --width=300 --height=300 --title "¿Qué quieres borrar?" --form --center --file \
	--column="" ) 2> /dev/null
	mv $borrar /Escritorio/trabajoBash/basura
	#type  /Escritorio/trabajoBash/basura/ruta.txt >> $borrar Almacenar en ruta.txt la ruta que vamos a borrar 
	#nombreborrar = cutd -d "/ > ruta.txt" filtrar por el nombre de archivo
	concatenaruta="ruta$nombreborrar"
	#rename ruta.txt $concatenaruta concatenarlo para que quede un nombre adecuado
	
	
	resultadoborrar=$(yad --width=500 --height=300 --title "Archivo borrado" --center --text-align=center --list  \
	--column="" --text="Has borrado:" ${borrar})
}
function frecuperar(){
	recuperar=$(yad --width=400 --height=50 --title "Recuperación de archivos" --center --text-align=center \
	--form --file --column="")
	
	
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

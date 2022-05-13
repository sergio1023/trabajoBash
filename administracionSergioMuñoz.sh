#!/usr/bin/env bash

function fpermisos(){
	ruta=$(yad --width=300 --height=200 --title "Selecciona archivo" --form --center --file \
	--column="") 2> /dev/null
	permisospropietarios=$(yad --width=100 --height=20 --title "Permisos para propietarios" --center --text-align=left \
	--text="Guía de permisos:
	1 = ejecución
	2 = escritura
	3 = escritura y ejecución
	4 = lectura 
	5 = lectura y ejecución
	6 = lectura y escritura
	7 = lectura, escritura y ejecución" --entry --button=Establecer:0 ) 2> /dev/null
	while [[ $permisospropietarios -gt 7  ||  $permisospropietarios -eq "" ]]
		do
			yad --width=100 --height=150 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7" --button=Recibido:0
			permisospropietarios=$(yad --width=100 --height=20 --title "Permisos para propietarios" --center --text-align=center \
			--text="Guía de permisos:
	1 = ejecución
	2 = escritura
	3 = escritura y ejecución
	4 = lectura 
	5 = lectura y ejecución
	6 = lectura y escritura
	7 = lectura, escritura y ejecución" --entry --button=Establecer:0 )
		done
	
	permisosgrupos=$(yad --width=100 --height=20 --title "Permisos para grupos" --center --text-align=center \
	--text="Guía de permisos:
	1 = ejecución
	2 = escritura
	3 = escritura y ejecución
	4 = lectura 
	5 = lectura y ejecución
	6 = lectura y escritura
	7 = lectura, escritura y ejecución" --entry --button=Establecer:0 )
	while [[ $permisosgrupos -gt 7  || $permisosgrupos -eq "" ]]
		do
			yad --width=100 --height=150 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7" --button=Recibido:0
			permisosgrupos=$(yad --width=100 --height=20 --title "Permisos para grupos" --center --text-align=center \
			--text="Guía de permisos:
	1 = ejecución
	2 = escritura
	3 = escritura y ejecución
	4 = lectura 
	5 = lectura y ejecución
	6 = lectura y escritura
	7 = lectura, escritura y ejecución" --entry --button=Establecer:0 )
		done
	permisosotros=$(yad --width=100 --height=20 --title "Permisos para otros" --center --text-align=center \
	--text="Guía de permisos:
	1 = ejecución
	2 = escritura
	3 = escritura y ejecución
	4 = lectura 
	5 = lectura y ejecución
	6 = lectura y escritura
	7 = lectura, escritura y ejecución" --entry --button=Establecer:0 )
	while [[ $permisosotros -gt 7  || $permisosotros = "" ]]
		do
			yad --width=100 --height=150 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7" --button=Recibido:0
			permisosotros=$(yad --width=100 --height=20 --title "Permisos para otros" --center --text-align=center \
			--text="Guía de permisos:
	1 = ejecución
	2 = escritura
	3 = escritura y ejecución
	4 = lectura 
	5 = lectura y ejecución
	6 = lectura y escritura
	7 = lectura, escritura y ejecución" --entry --button=Establecer:0 )
		done
		
		permisos="$permisospropietarios$permisosgrupos$permisosotros"
		chmod $permisos $ruta
		comandols=$(ls -l $ruta)
			resultado=$(yad --width=400 --height=300 --title "Permisos finales del archivo" --center  \
			--text="${comandols}")
			
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
			
 }
function ftareas(){
	
	chmod 777 /etc/crontab
	tareas=$(yad  --form --width=350 --height=420 --title "Especifica la tarea programada" --text="Ponga '*' para no seleccionar ninguna hora, mes etc..." \
            --center --field="Minutos" --field="Horas" --field="Días del mes" --field="Mes" --field="Dia de la semana" --field="Descripción" --field="Comando")   
            
            ans=$?
            
            if [ $ans -eq 0 ]
				then
					IFS="|" read -r -a array <<< "$tareas"
					minutos=${array[0]}
					hora=${array[1]}
					diames=${array[2]}
					mes=${array[3]}
					diasemana=${array[4]}
					descripcion=${array[5]}
					comando=${array[6]}
					editar=$(echo "$minutos $hora $diames $mes $diasemana $USER $comando" >> /etc/crontab )
					ok=$(yad --center --info --title= "Tareas programadas" --text="Tarea editada correctamente")
			else
					cancelar=$(yad --center --info --title="Error en la tarea" --image="stop" --text="Pruebe otra vez, la tarea no se completó")
			fi
                           
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
 }
function fborrar(){
	borrar=$(yad --width=300 --height=300 --title "¿Qué quieres borrar?" --form --center --file \
	--column="" ) 2> /dev/null
	mv $borrar basura/
	echo "$borrar" > basura/ruta.txt
	myfile="$borrar"
	concatenaruta="rutantigua${myfile##*/}"
	mv basura/ruta.txt basura/$concatenaruta
	resultadoborrar=$(yad --width=500 --height=300 --title "Archivo borrado" --center --text-align=center --list  \
	--column="" --text="Has borrado:" ${borrar})
	
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
}
function frecuperar(){
	cd basura/
	recuperar=$(yad --width=230 --height=230 --title "Recuperación o borrado permanente de archivos" --form  --center --text-align=left --file  \
	--column="" )
	pregunta=$(yad --width=230 --height=230 --title "¿Que desea hacer?" --center --text-align=left \
			--text="
Escriba <b>borrar</b> para borrar definitivamente el archivo

Escriba <b>dantiguo</b> para recuperar en la ruta antigua

Escriba <b>dactual</b> para recuperar en la ruta actual" --entry --button=Establecer:0)
			
			

while [[ $pregunta = "" ]] 
do
						advertencia=$(yad --width=230 --height=230 --center  --text-align=left --column="" \
						 --text="
Escriba <b>borrar</b> para borrar definitivamente el archivo

Escriba <b>dantiguo</b> para recuperar en la ruta antigua

Escriba <b>dactual</b> para recuperar en la ruta actual")
						pregunta=$(yad --width=230 --height=230 --title "¿Que desea hacer?" --center  --text-align=left \
						--text="
Escriba <b>borrar</b> para borrar definitivamente el archivo

Escriba <b>dantiguo</b> para recuperar en la ruta antigua

Escriba <b>dactual</b> para recuperar en la ruta actual" --entry --button=Establecer:0)
done

if [ $pregunta = "borrar" ]
				then
					myfileborrar="$recuperar"
					concatenaborrar="rutantigua${myfileborrar##*/}"
					rm -r $recuperar
					rm -r $concatenaborrar
					comandolsbasura=$(ls -l)
					yad --width=550 --height=300 --title "Contenido de la basura" --center --text="${comandolsbasura}"
				elif [ $pregunta = "dantiguo" ]
					then
					rutantes="${recuperar##*/}"
					cadena=$(cat rutantigua$rutantes)
					cadena2="${cadena%/*}"
					cadena3="rutantigua$rutantes"
					mv $recuperar $cadena2
					comandolsl=$(ls -l $cadena2)
					cd basura/
					rm -r $cadena3
					yad --width=550 --height=300 --title "Archivo recuperado con éxito" --center --text="
					Archivo recuperado en directorio antiguo
					${comandolsl}"
					cd ..
				elif [ $pregunta = "dactual" ]
					then
						myfileborrar2="$recuperar"
						concatenaborrar2="rutantigua${myfileborrar2##*/}"
						rm -r $concatenaborrar2
						cd ..
						mv $recuperar .
						comandolsactual=$(ls -l)
						yad --width=550 --height=300 --title "Archivo recuperado con éxito" --center --text="
						Archivo recuperado en directorio actual
						${comandolsactual}"	
					fi
			
				
							 				
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

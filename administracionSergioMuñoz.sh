#!/usr/bin/env bash

function fpermisos(){
	ruta=$(yad --width=400 --height=50 --title "Selecciona archivo" --form --center --file \
	--column="") 2> /dev/null
	permisospropietarios=$(yad --width=400 --height=50 --title "Permisos para propietarios" --center --text-align=center \
	--text="Establece permisos de propietario al fichero" --entry --button=Establecer:0 ) 2> /dev/null
	while [ $permisospropietarios -gt 7 || $permisospropietarios = "" ];
		do
			yad --width=400 --height=50 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7"
			permisospropietarios=$(yad --width=400 --height=50 --title "Permisos para propietarios" --center --text-align=center \
			--text="Establece permisos de propietario al fichero" --entry --button=Establecer:0 )
		done
	
	permisosgrupos=$(yad --width=400 --height=50 --title "Permisos para grupos" --center --text-align=center \
	--text="Establece permisos de grupos al fichero" --entry --button=Establecer:0 )
	while [ $permisosgrupos -gt 7  || $permisosgrupos = "" ];
		do
			yad --width=400 --height=50 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7"
			permisosgrupos=$(yad --width=400 --height=50 --title "Permisos para grupos" --center --text-align=center \
			--text="Establece permisos de grupos al fichero" --entry --button=Establecer:0 )
		done
	permisosotros=$(yad --width=400 --height=50 --title "Permisos para otros" --center --text-align=center \
	--text="Establece permisos de otros al fichero" --entry --button=Establecer:0 )
	while [ $permisosotros -gt 7  || $permisosotros = "" ];
		do
			yad --width=400 --height=50 --center --text-align=center --column="" --text="Escriba un número entre el 0 y 7"
			permisosotros=$(yad --width=400 --height=50 --title "Permisos para otros" --center --text-align=center \
			--text="Establece permisos de otros al fichero" --entry --button=Establecer:0 )
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
	tareas=$(yad  width=700 height=700 --form --title "Especifica la tarea programada" --text="Ponga '*' para no seleccionar ninguna hora, mes etc..." \
            --center  --form --field="Minutos" --field="Horas" --field="Días del mesS" --field="Mes" --field="Dia de la semana" --field="Descripción" --field="Comando" --field="Editar")   
            
            ans=$?
            
            if [ $ans -eq 0 ];
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
					cancelar=$(yad --center --info --title="Error en la tarea" --image="stop" --text="Pruebe otra vez")
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
	recuperar=$(yad --width=400 --height=50 --title "Recuperación o borrado permanente de archivos" --form --center --file  \
	--column="" --alpha --palette)
	# obligar al yad $recuperar a trabajar en el directorio /basura
	pregunta=$(yad --width=400 --height=50 --title "¿Que desea hacer?" --center --text-align=center \
			--text="Escriba borrar o recuperar" --entry --button=Establecer:0)
			
			while [ $pregunta != "borrar" || $pregunta != "recuperar" ];
					do
						yad --width=400 --height=50 --center --text-align=center --column="" --text="Debe escribir borrar o recuperar"
						pregunta=$(yad --width=400 --height=50 --title "¿Que desea hacer?" --center --text-align=center \
						--text="Escriba borrar o recuperar" --entry --button=Establecer:0)
					done
			
			if [ $pregunta = "borrar" ];
				then
					myfileborrar="$recuperar"
					concatenaborrar="rutantigua${myfileborrar##*/}"
					rm -r $recuperar
					rm -r basura/$concatenaborrar
					comandolsbasura=$(ls -l basura)
					yad --width=550 --height=300 --title "Contenido de la basura" --center --text="${comandolsbasura}"
				elif [ $pregunta = "recuperar" ];
					then
						echo "hola"
					#mv $recuperar #ruta guardada en los archivos de rutaantigua
					#comandolsl="ls -l ruta de archivo recuperado"
					#yad --width=550 --height=300 --title "Archivo recuperado con éxito" --text="Contenido del directorio actual" --center --text="${comandolsl}"
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

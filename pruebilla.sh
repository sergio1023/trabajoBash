#!/usr/bin/env bash

ruta=$(yad --width=400 --height=50 --title "Busca tu archivo" --list --center --column="" --checklist FALSE miguel FALSE serg FALSE capullo \
	--column="" ) 2> /dev/null

echo $ruta
ans=$?
if [ $? -eq 0 ]
	then
		IFS="|" read -r -a elementos <<< "$ruta"
		miguel=${elementos[1]}
		miguel=${elementos[3]}
		miguel=${elementos[5]}
else
echo "mal"
fi


while [[ $pregunta != "borrar" || $pregunta != "dantiguo" || $pregunta != "dactual" || $pregunta = "" ]]
					do
						advertencia=$(yad --width=230 --height=230 --center  --text-align=left --column="" \
						 --text="
						Escriba borrar para borrar definitivamente el archivo
						Escriba dantiguo para recuperar en la ruta antigua
						Escriba dactual para recuperar en la ruta actual")
						pregunta=$(yad --width=230 --height=230 --title "¿Que desea hacer?" --center  --text-align=left \
						--text="
						Escriba borrar para borrar definitivamente el archivo
						Escriba dantiguo para recuperar en la ruta antigua
						Escriba dactual para recuperar en la ruta actual" --entry --button=Establecer:0)
					done

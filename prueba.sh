#!/usr/bin/env bash

ruta=$(yad --width=400 --height=50 --title "Busca tu archivo" --form --center --file \
	--column="") 2> /dev/null
	
comandoll=$(ls -l $ruta)
echo "$comandoll"

yad --width=400 --height=400 --title "Permisos del archivo" --center --list --column="" --column="" Permisos ${comandoll}

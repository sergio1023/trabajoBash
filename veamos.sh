#!/usr/bin/env bash

read -p "dime algo en este hola: " hola
echo $hola

if [ $hola = "que" ]
	then
	 echo "1 2 3 4 5 6 7 8 "
	 else 
	 yad --width=500 --height=250 --center --text="Saldrás de aquí" --title="Misión cumplida"
	 
fi

exit 0

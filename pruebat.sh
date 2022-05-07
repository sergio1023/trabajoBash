#!/usr/bin/env bash

comandolsbasura=$(ls -l basura)
yad --width=550 --height=300 --title "Contenido de la basura" --center --text="${comandolsbasura}"


tareas=$(yad --form  width="500" height="500" \
            --title "Especifica la tarea programada" \
            --text="Rellene con '*' los espacios en blanco" \
            --center \
            --field="MINUTOS" \
            --field="HORAS" \
            --field="DÍAS DEL MES" \
            --field="MES" \
            --field="AÑO"
            --field="USUARIO"
            --field="COMANDO") >> /etc/crontab
            
   
   toni=$(yad --title="https://atareao.es" \
    --center \
    --width=250 \
    --height=80 \
    --text-align=center \
    --text="¿Quieres continuar?" \
    --button=Si:0 \
    --button=No:1)
    
       ans=$?
if [ $ans -eq 1 ]
then
    yad --width=550 --height=300 --title "Contenido de la basura" --center --text="${comandolsbasura}"
else
    echo "continua capullo"
fi     
            

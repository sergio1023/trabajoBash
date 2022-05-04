#!/usr/bin/env bash

comandolsbasura=$(ls -l basura)
yad --width=550 --height=300 --title "Contenido de la basura" --center --text="${comandolsbasura}"

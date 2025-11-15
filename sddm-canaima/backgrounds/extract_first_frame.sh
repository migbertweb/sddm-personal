#!/usr/bin/env bash

# Archivo: extract_first_frame.sh
#
# Descripción: Script de utilidad para extraer el primer frame de un video de fondo
# y guardarlo como imagen PNG. Útil para crear placeholders que se muestran mientras
# se carga el video de fondo animado en el tema SDDM.
#
# Autor: migbertweb
#
# Fecha: 2024
#
# Repositorio: https://github.com/migbertweb/sddm-personal
#
# Licencia: MIT License
#
# Uso: ./extract_first_frame.sh <background_video>
#
# Nota: Este proyecto usa Licencia MIT. Se recomienda (no obliga) mantener 
# derivados como código libre, especialmente para fines educativos.

green='\033[0;32m'
red='\033[0;31m'
cyan='\033[0;36m'
reset="\033[0m"

if [[ ! -f "$1" ]]; then
    echo -e "Usage: ./extract_first_frame.sh ${cyan}<background_video>${reset}"
    exit
fi

ffmpeg -i "$1" -vf "select=eq(n\,34)" -vframes 1 $(basename backgrounds/$1 | cut -d"." -f1).png

#!/usr/bin/env bash

# Archivo: test.sh
#
# Descripción: Script para probar el tema SDDM sin necesidad de reiniciar el sistema.
# Ejecuta el greeter de SDDM en modo de prueba, permitiendo verificar que el tema
# funciona correctamente y que todas las dependencias están instaladas antes de
# aplicar los cambios permanentemente.
#
# Autor: migbertweb
#
# Fecha: 2024
#
# Repositorio: https://github.com/migbertweb/sddm-personal
#
# Licencia: MIT License
#
# Uso: ./test.sh [debug] - Ejecuta el tema en modo prueba. Opcionalmente con modo debug.
#
# Nota: Este proyecto usa Licencia MIT. Se recomienda (no obliga) mantener 
# derivados como código libre, especialmente para fines educativos.

green='\033[0;32m'
red='\033[0;31m'
bred='\033[1;31m'
cyan='\033[0;36m'
grey='\033[2;37m'
reset="\033[0m"

# Test for debug param ( debug | -debug | -d | --debug )
if [[ "$1" =~ ^(debug|-debug|--debug|-d)$ ]]; then
    QT_IM_MODULE=qtvirtualkeyboard QML2_IMPORT_PATH=./components/ sddm-greeter-qt6 --test-mode --theme .
else
    config_file=$(awk -F '=' '/^ConfigFile=/ {print $2}' metadata.desktop)
    echo -e "${green}Testing Silent theme...${reset}\nLoading config: ${config_file}\nDon't worry about the infinite loading, SDDM won't let you log in while in 'test-mode'."
    QT_IM_MODULE=qtvirtualkeyboard QML2_IMPORT_PATH=./components/ sddm-greeter-qt6 --test-mode --theme . > /dev/null 2>&1
fi

if [ ! -d "/usr/share/sddm/themes/silent" ]; then
    echo -e "\n${bred}[WARNING]: ${red}theme not installed!${reset}"
    echo -e "Run ${cyan}'./install.sh'${reset} or copy the contents of the theme to ${cyan}'/usr/share/sddm/themes/silent/'${reset} and set the current theme to ${cyan}'silent'${reset} in ${cyan}'/etc/sddm.conf'${reset}:\n"
    echo -e "    ${grey}# /etc/sddm.conf${reset}"
    echo -e "    [Theme]"
    echo -e "    Current=silent"
fi

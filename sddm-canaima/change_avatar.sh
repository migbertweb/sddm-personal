#!/usr/bin/env bash

# Archivo: change_avatar.sh
#
# Descripción: Script de utilidad para cambiar el avatar de un usuario en SDDM.
# Toma una imagen, la recorta a formato cuadrado, la redimensiona a 256x256 píxeles
# y la coloca en el directorio de avatares de SDDM. Crea una copia de seguridad
# automática si ya existe un avatar para el usuario.
#
# Autor: migbertweb
#
# Fecha: 2024
#
# Repositorio: https://github.com/migbertweb/sddm-personal
#
# Licencia: MIT License
#
# Uso: ./change_avatar.sh <username> <path_to_image>
#
# Nota: Este proyecto usa Licencia MIT. Se recomienda (no obliga) mantener 
# derivados como código libre, especialmente para fines educativos.

green='\033[0;32m'
red='\033[0;31m'
cyan='\033[0;36m'
reset="\033[0m"

print_help () {
    echo -e "Usage: ./change_avatar.sh ${cyan}<username> <path_to_image>${reset}"
}
if [ "$#" -ne 2 ]; then
    print_help
    exit
fi

USERNAME="$1"
IMAGE="$2"

if ! id "$USERNAME" >/dev/null 2>&1; then
    echo -e "${red}User '$USERNAME' not found!${reset}"
    print_help
    exit
fi

if [[ ! -f "$IMAGE" ]]; then
    echo -e "${red}Invalid image file!${reset}"
    print_help
    exit
fi

if [[ -f "/usr/share/sddm/faces/$USERNAME.face.icon" ]]; then
    echo -e "${green}Creating backup for '/usr/share/sddm/faces/$USERNAME.face.icon'${reset}"
    sudo cp -f "/usr/share/sddm/faces/$USERNAME.face.icon" "/usr/share/sddm/faces/$USERNAME.face.icon.bkp"
fi

sudo cp "$IMAGE" "/usr/share/sddm/faces/tmp_face"
# Crop image to square:
sudo mogrify -gravity center -crop 1:1 +repage "/usr/share/sddm/faces/tmp_face"
# Resize face to 256x256:
sudo mogrify -resize 256x256 "/usr/share/sddm/faces/tmp_face"
sudo mv "/usr/share/sddm/faces/tmp_face" "/usr/share/sddm/faces/$USERNAME.face.icon"

echo -e "\n${green}Avatar updated for user '$USERNAME'!${reset}"

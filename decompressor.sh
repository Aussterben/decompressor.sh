#!/bin/bash

##############################################
#            Script By Aussterben            #
##############################################

# Recuerda dar permisos de ejecución con "chmod +x filter.sh"

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n\n${redColour}[!] Saliendo${endColour}\n"
  exit 1
}

# ctrl +c 
trap ctrl_c INT

if [ -e data.gz ]; then 
  first_file_name='data.gz'
  decompressed_file_name="$(7z l data.gz | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"

  7z x $first_file_name &>/dev/null

  while [ $decompressed_file_name ]; do
    echo -e "\n${yellowColour}[+]${endColour}${blueColour} Nuevo archivo descomprimido:${endColour}${purpleColour} $decompressed_file_name${endColour}"
    7z x $decompressed_file_name &>/dev/null
    decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
  done

  if [ -e "data9.bin" ]; then
    pass=$(cat data9.bin | awk 'NF{print $NF}')
    echo -e "\n${yellowColour}[+]${endColour}${blueColour} La contraseña para bandit13 es ->${endColour}${redColour} $pass${endColour}"
  fi

  # Limpiar todo
  rm *.bin; rm {data6,data2}
else 
  echo -e "\n${redColour}[!] El archivo no existe o no fue encontrado${endColour}"; exit 1
fi

#!/bin/bash

#1. Análisis de tráfico de red Escribe un script llamado analisis_trafico.sh que lea un archivo de registro de red y extraiga todas las direcciones IP únicas que aparecen.
#Requisito: Utiliza el comando grep con la opción -oE para extraer solo las partes del texto que coincidan con la expresión regular de una dirección IPv4 (es decir, 4 bloques de 1 a 3 números separados por puntos).
#Resultado esperado:
#$ ./analisis_trafico.sh registro.log
#192.168.1.10
#10.0.0.5

if [[ $1 ]]; then
    archivo=$1
    for resultado in `grep -oE  "^[0-9\.]+" $archivo` ; do
        echo $resultado
    done
else
    echo "No has introducido ningún parametro"
fi
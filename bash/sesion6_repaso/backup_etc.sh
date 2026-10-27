#!/bin/bash

shell="${1:-/var/backups}"
num_copias="${2:-7}"

fecha=$(date +%Y%m%e-%H%M%S)

registrar() {
    local mensaje="$1"
    
    echo "$mensaje"
    
    logger -t aso-backup "$mensaje"
}


if [[ ! -d "$shell" ]]; then
    echo "El directorio de destino no existe."
    exit 1
fi

if [[ $num_copias =~ ^[0-9]$ ]]; then

    if [[ $num_copias -gt 0  ]]; then
        tar -czvf /home/sanmungar/copias/etc-$fecha.tar.gz /etc
    else
        echo "El número debe ser mayor que 0."
    fi
else
    echo "El segundo parámetro debe ser un número."
    exit 1
fi

contador=0

for archivo in "$shell"/*; do
    
    nombre_archivo=$(basename "$archivo")
    
    if [[ $nombre_archivo =~ ^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$ ]]; then
        contador=$((contador + 1))
    fi
done

if [[ $contador -gt $num_copias ]]; then
    registrar "Aviso: Hay $contador copias, superando el máximo de $num_copias."
fi
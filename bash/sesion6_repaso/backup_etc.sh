#!/bin/bash

fecha= date +%Y%m%e-%H%M%S

shell="${1:-/var/backups}"
num_copias="${2:7}"

if [[ ! -d "$shell" ]]; then
    echo "El directorio de destino no existe."
    exit 1
else
    carpeta=$(BASENAME "shell")
fi

if [[ ! $num_copias =~ [1-9] ]]; then
    echo "El segundo parámetro debe ser un número."
    exit 1
fi

if [[ $num_copias -gt 0  ]]; then
    echo "El número debe ser mayor que 0."
fi

comprimido= tar -czvf etc-$fecha
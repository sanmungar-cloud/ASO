#!/bin/bash

fichero="${1:-/etc/login.defs}"

if [[ ! -f "$fichero" ]]; then
    echo "Error: El fichero '$fichero' no existe."
    exit 1
fi

totales=0
utiles=0

while read -r linea; do
    totales=$((totales + 1))
    
    if [[ -z "$linea" ]] || [[ "$linea" =~ ^# ]]; then
        continue 
    fi
    
    echo "$linea"
    utiles=$((utiles + 1))
    
done < "$fichero"

echo "-------------"
echo "Líneas totales: $totales"
echo "Líneas útiles: $utiles"
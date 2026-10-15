#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Uso: $0 <fichero_configuracion>"
    exit 1
fi

fichero="$1"

if [[ ! -f "$fichero" ]]; then
    echo "Error: El fichero '$fichero' no existe."
    exit 1
fi


sed '/^#/d; /^$/d' "$fichero"
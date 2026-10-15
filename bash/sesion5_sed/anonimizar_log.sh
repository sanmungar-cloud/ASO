#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Uso: $0 <fichero_log>"
    exit 1
fi

fichero="$1"

if [[ ! -f "$fichero" ]]; then
    echo "Error: El fichero '$fichero' no existe."
    exit 1
fi

fichero_anonimo="${fichero}.anonimo"

sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/X.X.X.X/g' "$fichero" > "$fichero_anonimo"

echo "Fichero anonimizado: $fichero_anonimo"
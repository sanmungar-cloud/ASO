#!/bin/bash

dias="$1"

if [[ ! "$dias" =~ ^[0-9]{1,3}$ ]]; then
    echo "Error: ${1:-nada} no es un número de días válido"
    exit 1
fi

fichero="login.defs"

if [[ ! -f "$fichero" ]]; then
    echo "Error: No se encuentra el fichero '$fichero' en la carpeta actual."
    exit 1
fi

antes=$(grep '^PASS_MAX_DAYS' "$fichero")

sed -i.bak -E "s/^(PASS_MAX_DAYS[[:blank:]]+)[0-9]+/\1$dias/" "$fichero"

despues=$(grep '^PASS_MAX_DAYS' "$fichero")

echo "Antes: $antes"
echo "Después: $despues"
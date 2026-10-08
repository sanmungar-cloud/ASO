#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Uso: $0 <direccion_IPv4>"
    exit 1
fi

ip="$1"

if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "$ip tiene formato de IP"
else
    echo "$ip no tiene formato de IP"
fi

# --- Respuesta a la pregunta ---
# ¿Qué responde el script con 999.999.999.999?
# Responde: "999.999.999.999 tiene formato de IP".
#
# ¿Es una IP válida?
# No, no es una IP válida en la vida real. El formato es correcto, 
# pero en una dirección IPv4 real cada número (octeto) representa 8 bits y solo puede tomar valores del 0 al 255.
# Nuestra expresión regular actual solo valida la "forma", no la lógica matemática.
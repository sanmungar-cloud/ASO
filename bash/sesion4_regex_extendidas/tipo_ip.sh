#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Uso: $0 <direccion_IP>"
    exit 1
fi

ip="$1"

if [[ $ip =~ ^127\. ]]; then
    echo "$ip es una dirección loopback"
elif [[ $ip =~ ^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.) ]]; then
    echo "$ip es una dirección privada"
else
    echo "$ip es una dirección pública"
fi

# --- Respuesta a la pregunta ---
# Pregunta: el rango de 172.16 a 172.31 no se puede escribir con una sola clase. 
# ¿Cómo lo has resuelto?
#
# Respuesta: Como los corchetes solo evalúan un carácter (un dígito) a la vez, 
# no existe la clase [16-31]. Para solucionarlo, he dividido el número en tres 
# rangos lógicos usando el operador OR (|) dentro de un grupo de captura:
# - 1[6-9] : Cubre desde el 16 hasta el 19.
# - 2[0-9] : Cubre desde el 20 hasta el 29.
# - 3[01]  : Cubre el 30 y el 31.
# La combinación completa queda así: (1[6-9]|2[0-9]|3[01])
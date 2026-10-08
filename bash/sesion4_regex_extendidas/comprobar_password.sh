#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Uso: $0 <contraseña>"
    exit 1
fi

pass="$1"
es_segura=true

if [[ $pass =~ ^.{12,}$ ]]; then
    echo " Tiene al menos 12 caracteres: sí"
else
    echo " Tiene al menos 12 caracteres: no"
    es_segura=false
fi

if [[ $pass =~ [0-9] ]]; then
    echo " Contiene algún dígito: sí"
else
    echo " Contiene algún dígito: no"
    es_segura=false
fi

if [[ $pass =~ [A-Z] ]]; then
    echo " Contiene alguna mayúscula: sí"
else
    echo " Contiene alguna mayúscula: no"
    es_segura=false
fi

if [[ $pass =~ [^a-zA-Z0-9] ]]; then
    echo " Contiene algún símbolo: sí"
else
    echo " Contiene algún símbolo: no"
    es_segura=false
fi

if grep -iqx "$pass" /usr/share/dict/spanish 2>/dev/null; then
    echo " No es una palabra del diccionario: no"
    es_segura=false
else
    echo " No es una palabra del diccionario: sí"
fi

if [[ "$es_segura" == true ]]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi

# --- Respuesta a la pregunta final ---
# ¿Caminas2026! cumple todas las condiciones. ¿Te parece realmente una contraseña segura? ¿Por qué?
#
# Respuesta: No, no es una contraseña realmente segura en el mundo real, a pesar de cumplir las reglas.
# Es altamente predecible porque sigue el patrón humano más común al crear contraseñas "complejas":
# 1. Una palabra conocida con la primera letra en mayúscula (seguramente el nombre del instituto, IES Caminàs).
# 2. Un año reciente o actual (2026).
# 3. Un símbolo de exclamación al final (!).
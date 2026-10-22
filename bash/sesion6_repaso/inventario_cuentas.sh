#!/bin/bash

# Asignar el primer parámetro o usar /bin/bash por defecto
shell="${1:-/bin/bash}"

# Validar que sea una ruta absoluta en minúsculas
if [[ ! "$shell" =~ ^(/[a-z]+)+$ ]]; then
    echo "Error: La shell debe ser una ruta absoluta en minúsculas (ej: /bin/bash)."
    exit 1
fi

total=0
uid_alto=0

while IFS=: read -r user password uid gid info home sh; do
    
    if [[ "$sh" == "$shell" ]]; then
        echo "$user:$uid:$home:$sh"
        
        total=$((total + 1))
        
        if [[ "$uid" -ge 1000 ]]; then
            uid_alto=$((uid_alto + 1))
        fi
    fi
    
done < /etc/passwd

echo "---"
echo "Total de cuentas listadas: $total"
echo "Cuentas con UID >= 1000: $uid_alto"
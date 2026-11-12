#!/bin/bash

# Función para escribir en el archivo log
registrar() {
    local estado="$1"
    local carpeta="$2"
    local fecha_log=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$fecha_log - Carpeta: $carpeta - Estado: $estado" >> ~/backups/backup.log
}

# 1. Comprobación del parámetro
if [[ $# -eq 0 ]]; then
    echo "Uso: $0 <carpeta_remota>"
    exit 1
fi

carpeta_remota="$1"

# 2. Comprobación de la conexión al servidor (sin contraseña)
if ! ssh -o BatchMode=yes servidor true 2>/dev/null; then
    echo "Error: El servidor no responde o requiere contraseña interactiva."
    registrar "FALLO_CONEXIÓN" "$carpeta_remota"
    exit 1
fi

# 3. Preparación del nombre de la carpeta de destino
fecha=$(date +%F_%H-%M)
# Extraemos solo el nombre final de la carpeta (ej. "datos" de "/var/datos")
nombre_base=$(basename "$carpeta_remota") 
destino=~/backups/espejo

# 4. Orden de copia con scp
echo "Iniciando copia de $carpeta_remota a $destino..."

# Se evalúa el código de salida de scp
if rsync -av "servidor:$carpeta_remota" "$destino" >/dev/null 2>&1; then
    echo "Copia completada correctamente."
    registrar "ÉXITO" "$carpeta_remota"
else
    echo "Error durante la copia de archivos."
    registrar "FALLO_COPIA" "$carpeta_remota"
    exit 1
fi

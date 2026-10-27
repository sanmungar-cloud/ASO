#!/bin/bash
# informe_procesos.sh - Procesos del usuario actual ordenados por consumo de
CPU
if [ $# -gt 1 ]; then
    echo "Error: demasiados parámetros"
    echo "Uso: $0 [N]"
exit 1
fi
n="$1"

# Si se ha pasado N, se comprueba el formato y el valor
if [ -n "$n" ]; then
    if [[ ! $n =~ ^[0-9]+$ ]]; then
        echo "Error: $n no es un número válido"
    exit 1
    fi

    if [ "$n" -le 0 ]; then
        echo "Error: el número debe ser mayor que 0"
        exit 1
    fi
fi

# Listado completo, de mayor a menor %CPU, guardado en procesos.txt
ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt
if [ -n "$n" ]; then
    # N + 1 líneas: la cabecera y los N primeros procesos
    head -n $((n + 1)) procesos.txt
else
    cat procesos.txt
fi

# El total no cuenta la línea de cabecera
lineas=$(wc -l < procesos.txt)
total=$((lineas - 1))
echo "----"
echo "Procesos de $USER: $total"
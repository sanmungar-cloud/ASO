#!/bin/bash
clear

listar_usuario () {
    echo "Introduce el nombre de usuario: " 
    read usuario
    if id "$usuario" >/dev/null 2>&1;then
        ps -u $usuario
    else
        echo "El usuario no existe."
    fi
}

buscar_procesos () {
    read -p "Indica el nombre del proceso a buscar: " -r nombre
    
    # pgrep busca los PID que coincidan con el nombre
    pids=$(pgrep "$nombre")
    
    if [[ -z "$pids" ]]; then
        echo "No hay ningún proceso que coincida con $nombre"
    else
        ps -p "$pids" -o pid,user,%cpu,comm
    fi
}

top_cpu () {
    local num="${1:-5}"
    local lineas=$((num + 1))
    
    ps aux --sort=-%cpu | head -n "$lineas"
}

cambiar_prioridad () {
    
    read -p "Introduce el número de proceso (PID): " -r pid
    
    if ! validar_pid "$pid"; then
        echo "Error: El PID no es válido o el proceso no existe."
        return 1
    fi
    
    read -p "Nuevo valor nice: " -r valor_nice
    
    if [[ $EUID -eq 0 ]]; then
        if [[ ! "$valor_nice" =~ ^-?[0-9]+$ ]] || [[ "$valor_nice" -lt -20 ]] || [[ "$valor_nice" -gt 19 ]]; then
            echo "Error: el valor debe estar entre -20 y 19"
            return 1
        fi
    else
        if [[ ! "$valor_nice" =~ ^[0-9]+$ ]] || [[ "$valor_nice" -lt 0 ]] || [[ "$valor_nice" -gt 19 ]]; then
            echo "Error: el valor debe estar entre 0 y 19"
            return 1
        fi
    fi
    
    renice "$valor_nice" -p "$pid" >/dev/null 2>&1
    comando=$(ps -p "$pid" -o comm=)
    fecha=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$fecha - renice $valor_nice - $pid - $comando" >> ~/gestion_procesos.log
    echo "Prioridad cambiada con éxito."
}

finalizar_proceso () {
    
    read -p "Introduce el número de proceso (PID): " -r pid
    
    if ! validar_pid "$pid"; then
        echo "Error: El PID no es válido o el proceso no existe."
        return 1
    fi
    
    comando=$(ps -p "$pid" -o comm=)
    
    read -p "¿Finalizar $pid ($comando)? (s/n): " -r confirmacion
    
    if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
        kill -SIGTERM "$pid" 2>/dev/null
        echo "Proceso $pid finalizado con SIGTERM"
        
        fecha=$(date "+%Y-%m-%d %H:%M:%S")
        echo "$fecha - SIGTERM - $pid - $comando" >> ~/gestion_procesos.log        
        sleep 3
        
        if ps -p "$pid" >/dev/null 2>&1; then
            
            kill -SIGKILL "$pid" 2>/dev/null
            echo "El proceso $pid no respondió. Finalizado a la fuerza con SIGKILL."
            
            fecha=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$fecha - SIGTERM - $pid - $comando" >> ~/gestion_procesos.log        fi
    else
        echo "Operación cancelada."
    fi
}


while true; do
    echo "===== GESTIÓN DE PROCESOS ====="
    echo "1) Listar los procesos de un usuario"
    echo "2) Buscar un proceso por nombre"
    echo "3) Mostrar los N procesos que más CPU consumen"
    echo "4) Cambiar la prioridad de un proceso"
    echo "5) Finalizar un proceso"
    echo "6) Salir"
    read -p "Ingrese su opción: " -r opcion

    case $opcion in
        1)
            listar_usuario
            ;;
        2)
            buscar_procesos
            ;;
        3)
            read -p "¿Cuántos procesos quieres ver? (Intro para 5): " -r cantidad
            top_cpu "$cantidad"
            ;;
        4)
            cambiar_prioridad
            ;;
        5)
            finalizar_proceso
            ;;
        6)
            echo "Saliendo del programa."
            exit 
            ;;
        *)
            echo "Opción inválida. Por favor, seleccione una opción válida."
            ;;
    esac
    echo ""
done



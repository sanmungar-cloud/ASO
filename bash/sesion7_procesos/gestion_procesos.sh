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

}

#top_cpu () {

#}

#cambiar_prioridad () {

#}

#finalizar_proceso () {

#}

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

            ;;
        3)

            ;;
        4)
            
            ;;
        5)

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



#!/bin/bash


cont=1

while [[ $cont -eq 1 ]]; do
    read -p "Introduce un usuario válido: " -r usuario
    if [[ $usuario =~ ^[a-z].*$ ]]; then
        existe=$(grep "^$usuario:" /etc/passwd)
        
        if [[ -n "$existe" ]]; then
            echo "El usuario $usuario existe."
            cont=0
        else
            sudo useradd -m -s /bin/bash "$usuario"
            echo "Usuario $usuario creado."
            cont=0
        fi
    else
        echo "No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
    fi
done
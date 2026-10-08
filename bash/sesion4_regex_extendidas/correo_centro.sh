#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Uso: $0 <correo>"
    exit 1
fi

correo="$1"


if [[ $correo =~ ^[a-z0-9._-]+@(alu\.)?edu\.gva\.es$ ]]; then
    
    if [[ $correo == *@alu.edu.gva.es ]]; then
        echo "$correo es una cuenta de alumnado"
    else
        echo "$correo es una cuenta de profesorado"
    fi
else
    echo "$correo no es una cuenta educativa"
fi
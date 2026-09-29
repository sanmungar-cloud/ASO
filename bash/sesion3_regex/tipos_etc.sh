#!/bin/bash

    re1='\.conf$'
    re2='\.bak$'
    c1=0
    c2=0

for fichero in /etc/*; do
    
    if [[ $fichero =~ $re1 ]]; then
        echo $fichero
        c1=$((c1 + 1))
    else [[ $fichero =~ $re2 ]]
        echo $fichero
        c2=$((c2 + 1))
    fi   
done
    echo
    echo "Configuración: $c1"
    echo "Copias de seguridad: $c2"

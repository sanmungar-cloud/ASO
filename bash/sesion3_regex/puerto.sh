puerto="$1"
cont=1
while [[ $cont -eq 1 ]]; do
        if [[ $puerto =~ ^[0-9]+$ ]]; then
            if [[ $puerto -ge 1 ]] && [[ $puerto -le 65535 ]]; then
                echo "Puerto válido recibido: $puerto"
                cont=0
            else
                echo "No está en el rango correcto"
                read -p "Introduce un puerto válido: " -r puerto
            fi
        else
            echo "Puerto incorrecto."
            read -p "Introduce un puerto válido: " -r puerto
        fi
    done
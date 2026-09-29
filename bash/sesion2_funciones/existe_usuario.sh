
existe_usuario () {
       if id "$1" &>/dev/null; then
        echo "El usuario $1 existe en el sistema."
    else
        echo "El usuario $1 no existe."
    fi
}

# Llamadas para probar si funciona
existe_usuario root
existe_usuario noexiste123
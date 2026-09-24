read -p "Ingresa tu código HTTP: " -r codigo_http

if [[ $codigo_http -ge 200 ]] && [[ $codigo_http -le 299 ]]; then
    echo "Éxito"
elif [[ $codigo_http -ge 300 ]] && [[ $codigo_http -le 399 ]]; then
    echo "Redirección"
elif [[ $codigo_http -ge 400 ]] && [[ $codigo_http -le 499 ]]; then
    echo "Error del cliente"
elif [[ $codigo_http -ge 500 ]] && [[ $codigo_http -le 599 ]]
    echo "Error del servidor"
else
    echo "No has introducido una URL adecuada."





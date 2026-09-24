read -p "Ingresa tu código HTTP: " -r codigo_http

if [[ $codigo_http -ge 200 ]] && [[ $codigo_http -le 299 ]]; then
    echo "Éxito"
elif [[ $codigo_http -ge 300 ]] && [[ $codigo_http -le 399 ]]; then
    echo "Redirección"
elif [[ $codigo_http -ge 400 ]] && [[ $codigo_http -le 499 ]]; then
    echo "Error del servidor"
elif [[  ]] && 





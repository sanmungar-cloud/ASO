
clasificar_http () {
if [[ $1 -ge 200 ]] && [[ $1 -le 299 ]]; then
    echo "Éxito"
elif [[ $1 -ge 300 ]] && [[ $1 -le 399 ]]; then
    echo "Redirección"
elif [[ $1 -ge 400 ]] && [[ $1 -le 499 ]]; then
    echo "Error del cliente"
elif [[ $1 -ge 500 ]] && [[ $1 -le 599 ]]; then
    echo "Error del servidor"
else
    echo "No has introducido un código adecuado."
fi
}

echo "Probando código 200:"
clasificar_http 200

echo "Probando código 301:"
clasificar_http 301

echo "Probando código 404:"
clasificar_http 404

echo "Probando código 500:"
clasificar_http 500
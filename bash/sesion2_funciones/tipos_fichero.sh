contar_por_extension () {
    local carpeta="$1"
    local extension="$2"

    find "$carpeta" -maxdepth 1 -type f -name "*.$extension" | wc -l
}

ruta=~/prueba_bash/datos

echo "Resultados:"

# "Anotaciones para mi" Se declara la variable ext. En la primera vuelta valdrá
# log, luego txt y finalmente csv
for ext in log txt csv; do
    cantidad=$(contar_por_extension "$ruta" "$ext")
    
    echo "$ext -> $cantidad"
done
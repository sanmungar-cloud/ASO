for entrada in ~/prueba_bash/*; do
    nombre=$(basename "$entrada")
    echo "-------"
    if [ -d "$entrada" ]; then
        echo "$nombre  es un directorio."
        
    elif [ -f "$entrada" ]; then
        echo "$nombre  es un fichero."
    fi
done
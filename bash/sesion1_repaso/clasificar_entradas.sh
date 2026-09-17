for entrada in ~/prueba_bash/*; do
    nombre=$(basename "$entrada")
    
    if [ -d "$entrada" ]; then
        echo "$nombre  es un directorio"
        echo "n/"
        
    elif [ -f "$entrada" ]; then
        echo "$nombre  es un fichero"
        echo "n/"   
    fi
done
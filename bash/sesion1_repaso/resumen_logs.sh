if [ -d "$1" ]; then
    find ~/prueba_bash -type f -name "*.log"
else
    echo "El argumento proporcionado no es un directorio."
fi 

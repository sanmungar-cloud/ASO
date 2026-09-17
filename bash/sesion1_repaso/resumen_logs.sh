nombre=$(basename "$1")

if [ -d "$nombre" ]; then
    find /home/sanmungar/Documentos/ASO/bash/sesion1_repaso -type f -name "*.log" ls -l | sort -k5 -n | tail -n 10
else
    echo "El argumento proporcionado no es un directorio."
fi 

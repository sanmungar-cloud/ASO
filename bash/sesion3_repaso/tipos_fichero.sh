read -p "¿De que directorio quieres hacer la consulta?  " -r carpeta
read -p "¿De que extension quieres hacer la cuenta?  " -r extension


find "$carpeta" -maxdepth 1 -type f -name "*.log" | wc -l
find ~/prueba_bash/datos -maxdepth 1 -type f -name "*.txt" | wc -l
find ~/prueba_bash/datos -maxdepth 1 -type f -name "*.csv" | wc -l
#!/bin/bash
# gestion_usuarios.sh - Prepara el alta o la baja de un usuario del alumnado
# Muestra el error y la forma de uso, y termina
error() {
    echo "Error: $1"
    echo "Uso: $0 alta | baja identificador"
    exit 1
}

# Recibe nombre, primer apellido y segundo apellido; devuelve aluXXYYZ
generar_id() {
    nn=$(echo "$1" | cut -c1-2)
    a1=$(echo "$2" | cut -c1-2)
    a2=$(echo "$3" | cut -c1)
    echo "alu$nn$a1$a2" | tr 'A-Z' 'a-z'
}

# Devuelve éxito si el usuario aparece al principio de una línea de
/etc/passwd
existe_usuario() {
    grep -q "^$1:" /etc/passwd
}

alta() {
    read -p "Nombre: " nombre
    read -p "Apellidos: " apellidos

    if [[ ! $nombre =~ ^[A-Za-z]+$ ]]; then
        error "el nombre debe ser una sola palabra formada por letras"
    fi

# El espacio dentro de [[ ]] se escapa: dos palabras separadas por un
    espacio

    if [[ ! $apellidos =~ ^[A-Za-z]+\ [A-Za-z]+$ ]]; then
        error "escribe los dos apellidos separados por un espacio"
    fi

    apellido1=$(echo "$apellidos" | cut -d' ' -f1)
    apellido2=$(echo "$apellidos" | cut -d' ' -f2)
    id=$(generar_id "$nombre" "$apellido1" "$apellido2")
    echo "Identificador generado: $id"

    if existe_usuario "$id"; then
        error "el usuario $id ya existe"
    fi

    echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$nombre
    $apellidos\" $id"
}

baja() {
    id="$1"
    if [[ ! $id =~ ^alu[a-z]{5}$ ]]; then
        error "$id no tiene el formato aluXXYYZ"
    fi
    if ! existe_usuario "$id"; then
        error "el usuario $id no existe"
    fi

    echo "Para eliminarlo: sudo userdel -r $id"
}

# Programa principal
if [ $# -eq 0 ]; then
    error "falta la acción"
fi
if [ "$1" = "alta" ]; then
    alta
elif [ "$1" = "baja" ]; then
if [ -z "$2" ]; then
    error "falta el identificador"
fi


baja "$2"
else
error "la acción $1 no es válida"
fi
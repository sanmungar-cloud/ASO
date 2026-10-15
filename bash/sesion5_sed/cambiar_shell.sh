#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 <usuario> <shell>"
    exit 1
fi

usuario="$1"
shell="$2"
fichero="passwd"

if [[ ! -f "$fichero" ]]; then
    echo "Error: no se encuentra el fichero '$fichero' en la carpeta actual."
    exit 1
fi

if ! grep -q "^$usuario:" "$fichero"; then
    echo "Error: el usuario $usuario no existe"
    exit 1
fi

if [[ ! "$shell" =~ ^/bin/(bash|sh|zsh)$ ]]; then
    echo "Error: la shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1
fi


sed -i.bak -E "s#^($usuario:.*:)[^:]*\$#\1$shell#" "$fichero"

# Mostramos cómo ha quedado la línea
grep "^$usuario:" "$fichero"


# Pregunta: en un sistema real, ¿se cambiaría la shell editando /etc/passwd con sed?
# ¿Qué comando se usa normalmente?
#
# Respuesta: No, editar /etc/passwd a mano o mediante scripts de texto no es 
# recomendable debido al riesgo de bloquear o corromper el acceso al sistema. 
# En un entorno real se utilizan los comandos específicos del sistema operativo:
# - 'chsh' (ejemplo: chsh -s /bin/bash usuario) 
# - 'usermod' (ejemplo: usermod -s /bin/bash usuario)
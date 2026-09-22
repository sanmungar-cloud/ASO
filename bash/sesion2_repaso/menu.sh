#!/bin/bash
clear
suma () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    resultado=$((num1 + num2))
    echo "El resultado de la suma es: $resultado"
    
}
resta () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    resultado=$((num1 - num2))
    echo "El resultado de la resta es: $resultado"
    
}
multiplicacion () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    resultado=$((num1 * num2))
    echo "El resultado de la multiplicación es: $resultado"
    
}
division () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    if [ $num2 -eq 0 ]; then
        echo "Error: No se puede dividir entre cero."
    else
        resultado=$((num1 / num2))
        echo "El resultado de la división es: $resultado"
    fi
    
}

while true; do
    echo "Seleccione una opción:"
    echo "1. Suma"
    echo "2. Resta"
    echo "3. Multiplicación"
    echo "4. División"
    echo "5. Salir"
    read -p "Ingrese su opción: " -r opcion

    case $opcion in
        1) suma ;;
        2) resta ;;
        3) multiplicacion ;;
        4) division ;;
        5) echo "Saliendo del programa."; exit ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida.";;
    esac
done


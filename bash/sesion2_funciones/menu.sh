#!/bin/bash
clear

suma () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    resultado_suma=$((num1 + num2))   
    echo $resultado_suma 
}

resta () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    resultado_resta=$((num1 - num2))
    echo $resultado_resta
}

multiplicacion () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    resultado_mult=$((num1 * num2))
    echo $resultado_mult
}

division () {
    echo "Ingrese el primer número:"
    read num1
    echo "Ingrese el segundo número:"
    read num2
    if [ $num2 -eq 0 ]; then
        echo "Error: No se puede dividir entre cero."
    else
        resultado_div=$((num1 / num2))
        echo $resultado_div
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
        1) 
            resultado=$(suma) 
            echo "El resultado de la suma es: $resultado" 
            ;;
        2) 
            resultado=$(resta) 
            echo "El resultado de la resta es: $resultado" 
            ;;
        3) 
            resultado=$(multiplicacion) 
            echo "El resultado de la multiplicación es: $resultado" 
            ;;
        4) 
            resultado=$(division) 
            echo "El resultado de la división es: $resultado" 
            ;;
        5) 
            echo "Saliendo del programa."
            exit 
            ;;
        *) 
            echo "Opción inválida. Por favor, seleccione una opción válida."
            ;;
    esac
    echo ""
done
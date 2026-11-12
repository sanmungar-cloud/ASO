#!/bin/bash

#2. Conversor de temperatura Crea un script llamado conversor_temp.sh que acepte una temperatura en grados Celsius como parámetro y la convierta a grados Fahrenheit, 
#o viceversa, dependiendo de un segundo parámetro ('C' o 'F').
#Requisito: Utiliza una función para realizar el cálculo matemático. Si el segundo parámetro es 'C', la fórmula es (F - 32) * 5/9. 
#Si es 'F', la fórmula es (C * 9/5) + 32. Puedes usar bc para permitir decimales.
#Resultado esperado:

#$ ./conversor_temp.sh 25 F
#25 Celsius son 77 Fahrenheit


if [[ $1 ]]; then
    if [[ $2 -eq "C" ]]; then
        temp= (( $1 - 32 )  * 5 / 9)
        echo $temp
    else

    fi
    if [[ $2 -eq "F" ]]; then

    else

    fi
else
    echo ""
fi
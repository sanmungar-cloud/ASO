por=$(( ($1 * 100) / $2 ))

if [ $por -lt 70 ]; then
    echo "OK"
elif [ $por -ge 70 ] && [ $por -lt 90 ]; then
    echo "AVISO: El disco está entre el 70% y el 89% lleno."
else
    echo "CRÍTICO"
fi
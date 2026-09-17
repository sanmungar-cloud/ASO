$por = $(( ($1 * 100) / $2 ))
case $por in
    0-70)
        echo "OK"
        ;;
    71-89)
        echo "AVISO"
        ;;
    90-100)
        echo "CRITICO"
        ;;
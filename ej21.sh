rm fusion
cat $1 | while read linea
do
    echo "$1;$linea" >> fusion
done
cat $2 | while read linea
do 
    echo "$2;$linea" >> fusion 
done
cat fusion
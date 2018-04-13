tamanio=`echo $1 | wc -c`
tamanio=`expr $tamanio - 1`
peso=1
resultado=0

while [ $tamanio -ne 0 ]
do 
        digito=`echo $1 | cut -c$tamanio`
	resultado=`expr $resultado + \( $digito \* $peso \)`

	tamanio=`expr $tamanio - 1`
	peso=`expr $peso \* 2`
done
echo $resultado

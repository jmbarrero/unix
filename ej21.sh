clear
#fusiona los ficheros
if [ -e fusion ]; then rm fusion; fi
if [ -e incidencias.log ]; then rm incidencias.log; fi
if [ -e temporal ]; then rm temporal; fi

for fichero in $* 
do
    cat $fichero | while read linea
    do 
        echo "$fichero;$linea" >> fusion 
    done    
done


#crea el fichero incidencias.log indicando las lineas repetidas
idanterior=0
lineaanterior=""

sort -n -t";" -k2 fusion | while read linea
do 
    idlinea=`echo $linea | cut -d";" -f2`
    if [ $idlinea = $idanterior ]
    then
        echo -e "El ID_CLIENTE $idlinea esta repetido en las siguientes lineas \n" >> incidencias.log
        echo -e "$lineaanterior \n" >> incidencias.log
        echo -e "$linea \n" >> incidencias.log
    fi
    idanterior=$idlinea
    lineaanterior=$linea
done

#elimina las lineas repetidas y renumera los idcliente
idanterior=0
lineaanterior=""
contador=1
sort -n -t";" -k2 fusion | while read linea
do 
    idlinea=`echo $linea | cut -d";" -f2`
    if [ $idlinea != $idanterior ]
    then
        restolinea=`echo $linea | cut -d";" -f3,4,5,6,7,8,9`        
        echo "$contador;$restolinea" >> temporal
        contador=`expr $contador + 1`
    fi
    idanterior=$idlinea
    lineaanterior=$linea    
done
cat temporal
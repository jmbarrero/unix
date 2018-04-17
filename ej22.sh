#!/bin/bash

idclientes=`cat movimientosclientes | cut -d";" -f1 | sort -u`
for id in $idclientes
do
    suma=0
    #obtengo los movimientos del cliente $id
    grep "^$id" movimientosclientes > movimientos
    
    #sumo los importes de los movimientos del clientes $id
    while read linea
    do
        importe=`echo $linea | cut -d";" -f4`        
        suma=`expr $suma + $importe`        
    done < movimientos
    rm movimientos
    
    #en el fichero clientes actualizo el campo importe del cliente $id con el valor suma obtenido previamente
    linea=`grep "^$id" clientes`
    linea1=`echo $linea | cut -d";" -f1,2,3,4,5`
    linea2=`echo $linea | cut -d";" -f7,8` 
        
    grep -v "^$id" clientes > temporal        
    echo "$linea1;$suma;$linea2" >> temporal
    cat temporal | sort -n > clientes
    rm temporal       
done

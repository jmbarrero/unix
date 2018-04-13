while true
do
	clear
	echo "1)Consulta"
	echo "2)Alta"
	echo "3)Baja"
	echo "4)Modificacion"
	echo "5)Salir"

	read opcion
	case $opcion in
		1) 	clear;
			echo "CONSULTA. Selecciones opcion de consulta:";
			echo "1)id_cliente";
			echo "2)dni";
			echo "3)nombre";
			read opcionconsulta;
			echo "Introduzca valor a buscar:";
			read valor;
			cat $1 | while read linea
			do
				campo=`echo $linea | cut -d';' -f$opcionconsulta`;
				if [ $campo = $valor ]
				then
					echo $linea;
				fi;
			done;		
			echo "Pulse tecla para continuar...";
			read;;

		2)	clear;
			echo "ALTA"
			idcliente=`cat $1 | cut -d";" -f1 | sort -rn | head -1`
			idcliente=`expr $idcliente + 1`
			echo "Introduzca DNI:"
			read dni
			echo "Introduaca Nombre:"
			read nombre
			echo "Introduzca Direccion:"
			read direccion
			echo "Introduzca Telefono:"
			read telefono
			echo "Introduzca Saldo:"
			read saldo
			echo "Introduzca Localidad:"
			read localidad
			echo "Introduzca Provincia:"
			read provincia
			echo "$idcliente;$dni;$nombre;$direccion;$telefono;$saldo;$localidad;$provincia" >> $1
			echo "Cliente insertado. Pulse tecla para continuar..."
			read;;			 

		3) 	clear
			echo "BAJA"
			echo "Introduzca el idcliente a eliminar:"
			read idcliente
			nlineas=`grep -c "^$idcliente" $1`
			if [ $nlineas -eq 0 ]
			then
				echo "No existe el idcliente $idcliente"
			else
				grep "^$idcliente" $1
				echo "¿Realmente desea elimninar s/n?:"
				read respuesta
				case $respuesta in
					s)	grep -v "^$idcliente" clientes > temporal
						rm clientes
						cat temporal > clientes
						rm temporal;;
					*);;					
				esac
			fi
			echo "Pulse tecla para continuar..."	
			read;;

		4) 	echo Modificacion; 
			echo "Introduzca el idcliente a modificar:"
			read idcliente
			nlineas=`grep -c "^$idcliente" $1`
			if [ $nlineas -eq 0 ]
			then
				echo "No existe el idcliente $idcliente"
			else
				linea=`grep "^$idcliente" $1`
				echo $linea
				
				dni=`grep "^$idcliente" $1 | cut -d';' -f2`
				nombre=`grep "^$idcliente" $1 | cut -d';' -f3`
				direccion=`grep "^$idcliente" $1 | cut -d';' -f4`
				telefono=`grep "^$idcliente" $1 | cut -d';' -f5`
				saldo=`grep "^$idcliente" $1 | cut -d';' -f6`
				localidad=`grep "^$idcliente" $1 | cut -d';' -f7`
				provincia=`grep "^$idcliente" $1 | cut -d';' -f8`

				echo "Introduzca dni:"
				read newdni
				echo "Introduzca nombre:"
				read newnombre
				echo "Introduzca direccion:"
				read newdireccion
				echo "Introduzca telefono:"				
				read newtelefono
				echo "Introduzca saldo:"
				read newsaldo
				echo "Introduzca localidad:"
				read newlocalidad
				echo "Introduzca provincia:"
				read newprovincia

				if [ ! -z $newdni ]; then dni=$newdni; fi
				if [ ! -z $newnombre ]; then nombre=$newnombre; fi
				if [ ! -z $newdireccion ]; then direccion=$newdireccion; fi
				if [ ! -z $newtelefono ]; then telefono=$newtelefono; fi
				if [ ! -z $newsaldo ]; then saldo=$newsaldo; fi
				if [ ! -z $newlocalidad ]; then localidad=$newlocalidad; fi
				if [ ! -z $newprovincia ]; then provincia=$newprovincia; fi
				
				echo "$idcliente;$id$dni;$nombre;$direccion;$telefono;$saldo;$localidad;$provincia"			

				echo "¿Desea guardar (s/n)?"
				read respuesta
				if [ $respuesta = 's'  ]
				then
					grep -v "^$idcliente" $1 > temporal
					rm clientes
					cat temporal > clientes
					rm temporal

					echo "$idcliente;$id$dni;$nombre;$direccion;$telefono;$saldo;$localidad;$provincia" >> clientes				
					
					echo "Cliente modificado"
				fi
			fi
			echo "Pulse tecla para continuar...";
			read;;
		5) clear;exit;;
		*) echo Opción erroneaa; echo "Pulse tecla para continuar...";read;;
	esac	   	
done

if [ ! -d $1 ]
then 
	echo  $1 no es un directorio existente
else
	EXISTE=`echo $PATH | grep $1`
	if [ -z $EXISTE ]
	then
		PATH=$PATH:$1
		echo $1 se acaba de añadir al PATH
		echo $PATH
	else
		echo $1 ya existe en el PATH
		echo $PATH
	fi
fi

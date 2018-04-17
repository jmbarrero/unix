if [ ! -d $HOME/bin ]
then
	mkdir $HOME/bin
else
	if [ ` ls -A $HOME/bin` ]
	then
		rm -r $HOME/bin/*
	fi
fi
ncopiados=0
for i in * 
do
	if [ -x $i ]
	then
		cp $i $HOME/bin
		ncopiados=`expr $ncopiados + 1`
		echo "Archivo $i copiado a $HOME/bin"
	fi
done
echo "Se han copiado $ncopiados archivos"

cat $2 | while read linea
do
	provincia=`echo $linea | cut -d';' -f7`
	if [ $provincia = $1 ]
	then
		echo $linea
	fi
done

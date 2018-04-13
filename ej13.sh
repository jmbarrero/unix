lista=`cat accesos.log | cut -f1 -d" "`

for I in $lista
do
	MAQUINA=`cat /etc/hosts | grep -v "#" | grep $I`

	if [ -z "$MAQUINA" ]
	then
		cat accesos.log | grep $I | cut -d" " -f1,4,5,6
	fi
done

case $1 in
'localidad') cat  $2 | cut -d';' -f7 | uniq -c;;
'provincia') cat $2 | cut -d';' -f8 | uniq -c;;
*) echo "Opcion incorrecta";;
esac

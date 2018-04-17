case $1 in
r) permisos="r..";;
w) permisos=".w.";;
x) permisos="..x";;
esac

case $2 in
u) ls -l | grep "^.$permisos" | tr -s " " | cut -d" " -f9;;
g) ls -l | grep "^....$permisos" | tr -s " " | cut -d" " -f9;;
o) ls -l | grep "^.......$permisos" | tr -s " " | cut -d" " -f9;;
esac



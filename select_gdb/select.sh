#!/bin/bash

echo -e "Please choose one mode of GDB?\n1.peda    2.gef    3.pwndbg"
read -r -p "Input your choice:" num
case "${num}" in
1)
    name='1'
    ;;
2)
    name='2'
    ;;
3)
    name='3'
    ;;
*)
    echo -e "Error!!!!\nPleasse input right number!"
    ;;
esac
gdbinitfile=~/.gdbinit

peda="source ~/software/my_dbg/peda/peda.py"
gef="source /home/sung/software/my_dbg/gef/.gdbinit-gef.py"
pwndbg="source /home/sung/software/my_dbg/pwndbg/gdbinit.py"

sign=$(cat $gdbinitfile | grep -n "# this place is controled by user's shell")
number=${sign:0:1}
location=$((number + 1))

if [ $name -eq "1" ]; then
    sed -i "${location}c $peda" $gdbinitfile
    echo -e "Please enjoy the peda!\n"
elif [ $name -eq "2" ]; then
    sed -i "${location}c $gef" $gdbinitfile
    echo -e "Please enjoy the gef!\n"
else
    sed -i "${location}c $pwndbg" $gdbinitfile
    echo -e "Please enjoy the pwndbg!\n"
fi
/usr/bin/gdb

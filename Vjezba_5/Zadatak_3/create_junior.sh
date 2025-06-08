#!/bin/bash
#
if [ $# -ne 4 ]; then
        echo "Pogrešan unos, unesite: $0 <username> <full_name> <password> <date>"
        exit 1
fi

id $1
if [ $? -ne 1 ]; then
        echo " Korisnik $1 već postoji."
        exit 1
fi


sudo useradd -m -s /bin/bash -G devs -e "$4" -c "$2" "$1"

echo "$1:$3" | sudo chpasswd

echo "Korisnik $1 dodan, vrijedi do $4"


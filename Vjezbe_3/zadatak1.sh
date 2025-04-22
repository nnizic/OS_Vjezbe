#!/bin/bash

if [ $# -eq 2 ]; then
    putanja=$1
    nastavak=$2
    datoteke=()
else
    echo "krivi broj argumenata! - Potrebna su točno 2 argumenta (putanja i nastavak)"
    exit 1
fi

for datoteka in "$putanja"/*"$nastavak"; do
    if [ -f "$datoteka" ]; then
        
        datoteke+=("$(basename $datoteka)")
    fi
done

if [ "${#datoteke[@]}" -eq 0 ]; then
    echo "Nema traženih datoteka."
else
    echo "Datoteke su: "${datoteke[@]}""
fi

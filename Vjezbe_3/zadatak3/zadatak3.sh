#!/bin/bash

putanja=screenshots

echo "Datoteke za preimenovanje:"
ls "$putanja"/
broj_zapisa=1
for datoteka in "$putanja"/*; do
    if [ -f "$datoteka" ]; then
        mv "$datoteka" "$putanja"/screenshoot_"$broj_zapisa"_$(basename "$datoteka")
       broj_zapisa=$((broj_zapisa + 1))
    fi
done

echo "Datoteke sa novim imenima:"
ls "$putanja"/

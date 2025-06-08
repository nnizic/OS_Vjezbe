#!/bin/bash

# točni broj argumenata
if [ "$#" -ne 2 ]; then
    echo "Pogrešan broj argumenata. Upotreba: $0  <rwxirane dozvole> <apsolutna putanja>"
    exit 1
fi

if [ "${#1}" -ne 9  ]; then
    echo "Greška rwxirane dozvole trebaju imati 9 znamenki"
    exit 1
fi

# postoji li datoteka
if [ ! -e "$2" ]; then
    echo "Greška: datoteka '$2' ne postoji!"
    exit 1
fi


# Pretvara 3 znaka u oktalni broj


pretvori_tri(){
    local trica=$1
    local vrijednost=0
    
    [[ "${trica:0:1}" == "r" ]] && (( vrijednost += 4 ))
    [[ "${trica:1:1}" == "w" ]] && (( vrijednost += 2 ))
    [[ "${trica:2:1}" == "x" ]] && (( vrijednost += 1 ))

    echo -n "$vrijednost"
    
}

# razbijanje na po tri 
VLASNIK="${1:0:3}"
GRUPA="${1:3:3}"
OSTALI="${1:6:3}"

echo "$VLASNIK, $GRUPA, $OSTALI"

# konverzija
dozvole="$(pretvori_tri "$VLASNIK")$(pretvori_tri "$GRUPA")$(pretvori_tri "$OSTALI")"

# promjena dozvola

chmod "$dozvole" "$2"

# potvrda

echo " Dozvole '$1', odnosno '$dozvole' primjenjene na '$2'"
ls -l "$2"


#!/bin/bash

if [ $# -eq 1 ]; then
    broj=$1
else
    echo "Pogrešan broj argumenata - potreban je samo jedan argument (broj)"
    exit 1
fi

if [[ $broj -lt 1 || $broj -gt 10 ]]; then
    echo "Argument nije u dozvoljenom rasponu (1-10)"
    exit 1
else
    echo "Argument je ok"
    touch brojevi.txt
fi

for (( i=1; i<="$broj"; i++ )); do
    echo $i >> brojevi.txt
done
echo "Brojevi upisani u datoteku brojevi.txt"



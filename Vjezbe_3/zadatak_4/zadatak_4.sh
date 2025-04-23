#!/bin/bash

if [ $# -eq 1 ]; then
    direktorij=$1
else
    echo "pogrešan broj argumenata - potreban je samo jedan argument"
    exit 1
fi

if [[ -e $direktorij && -d $direktorij ]]; then

    cd "$direktorij"

    zip -r ../"svi_zapisi.zip" *.*

else
    echo "Traženi direktoij ne postoji"
fi



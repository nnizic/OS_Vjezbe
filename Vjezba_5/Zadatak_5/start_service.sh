#!/bin/bash 
  2 if [ $# -ne 1 ]; then
  3   echo "Pogrešan unos, unesite: $0 <nazivservisa>"
  4   exit 1
  5 fi
  6  
  7 systemctl status $1
  8 if [ $? -ne 0 ]; then
  9   echo "Servis $1 nije pokrenut."
 10 else
 11   echo "Servis $1 je pokrenut."
 12 fi
 13  


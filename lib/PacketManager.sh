#!/usr/bin/env bash

clear
Menu(){
    echo -e "1. Install\n2. Search\n3. Remove\n4. Update\n0. Exit"
    read choice
}


exit=true

while [ $exit == true ]
do
  Menu;
  case $choice in
    1) echo "Install"; ;;
    0) echo "Bye!"; let exit=false; ;;
    *) echo "Wring choice!"; ;;
  esac
done
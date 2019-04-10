#!/usr/bin/env bash

clear
PTMenu(){
    echo -e "1. Install\n2. Search\n3. Remove\n4. Update\n0. Exit"
    read choice
}

Install(){
  read -p "Enter packet name => " packetName
  yum install $packetName
}

pmexit=true

while [ $pmexit == true ]
do
  PTMenu;
  case $choice in
    1) Install; ;;
    0) echo "Back to main menu!"; let pmexit=false; ;;
    *) echo "Wring choice!"; ;;
  esac
done
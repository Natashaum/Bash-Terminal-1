#!/usr/bin/env bash

UMMenu(){
  echo -e "1. Create User\n2. Delete user\n0. Exit"
  read choice
}

UMCreateUser(){
  clear
   echo -e "1. Create user by name\n2. Create user by name + uid + gid";
   read userChoice
   if (( $userChoice == 1 ))
   then 
     echo "Enter username: "
     read newUserName
     cat /etc/passwd | grep $newUserName
     if (( $? == 0  ))
     then 
      echo "User exist!"
     else
       useradd $newUserName 
       passwd $newUserName
     fi
   elif (( $userChoice == 2 ))
   then 
     echo "Enter username: "
     read newUserName
     cat /etc/passwd | grep $newUserName
     if (( $? == 0 ))
     then
       echo "User exist"
     else
       echo "Enter UID: "
       read uid
     fi
     cat /etc/passwd | grep $uid
     if (( $? == 0 ))
     then 
       echo "User exist!"
     else
     	echo "Enter GID: "
    	read gid
        cat /etc/group | grep $gid
        if (( $? != 0  )) 
        then 
          echo "Group does no exist!"
        else 
     	 useradd $newUserName -u $uid -g $gid
     	 passwd $newUserName
        fi

     fi
    else echo "Wrong choice!"
   fi 
}

umexit=true

while [ $umexit == true ]
do
  UMMenu;
  case $choice in
    1) UMCreateUser; ;;
    0) echo "Back to main menu!"; let umexit=false; ;;
    *) echo "Wrong choice!"; ;;
  esac
done
#!/bin/bash
source password.sh

echo -n "Enter Username :- "
read user
echo -n "Enter Password :- "
read pass

if [[ "$user" == "$username" && "$pass" == "$password" ]]
then  
    echo "Login Successful";
    echo -n "Want to Change Password (y/n) :- "
    read input 
    if [ "$input" == "y" ]
    then
        echo -n "Enter new Password :- "
        read newpass

        sed -i "s/$password/$newpass/" "password.sh"
        echo $'\e[1;33m'Password Changed Successfully$'\e[0m'
    
    else
        echo $'\e[1;33m'Okay!!! BYE$'\e[0m'
    fi
else
    echo $'\e[1;33m'Incorrect Username or Password$'\e[0m'
    
fi

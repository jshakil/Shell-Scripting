!/bin/bash
#Jabran Shakil
#Menu Program
#This program displays a menu and lets the user select a specific item in the menu

while true
do

echo -e  "\n     Menu Program\n"
echo 
echo " 1. Display the IP address and name of the machine"
echo " 2. Display all users currently on the system (ID and Full Name only)"
echo " 3. Display the server IP address, the netmask, and the broadcast addresses"
echo " 4. Enter user's login ID and display all processes belonging to the entered ID"
echo " 5. Count how many login IDs on the server are taking classes in 2017FA"
echo " 6. Exit the program"
echo

read -p "Enter 1, 2, 3, 4, 5, or 6:" answer
echo
#

    case "$answer" in

       1)
          hostname -i
          hostname
          echo
          ;;
       2)
          id -u
          id -ng
          echo
          ;;
       3)
          ifconfig | grep inet | grep netmask | grep broadcast | cut -f 1
          echo
          ;;
       4)
          echo -e "Please enter the user ID: \c"
          read userID
          ps -u $userID
          ;;
       5)
          cat /etc/passwd | grep 2017FA | wc -l
          echo
          ;;
       6)
          break
          ;;
       *)
          echo "Please enter a number 1-6"
          ;;
    esac
  sleep 2

done

exit 0
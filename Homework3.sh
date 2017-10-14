#!/bin/bash
#Jabran Shakil
#Function Script 
#This menu is created by functions and relies on the user input to display a certain task


while true
do

echo -e  "\n     Menu Program 2\n"
echo 
echo " 1. Display files by a certain extension"
echo " 2. Calls the shell script from Homework 1"
printf " 3. Removes filenames in a directory with .mp3, .jpg, .gif, \n    and .o extensions and a file called core\n"
echo " 4. Creates a new directory with permission 777 with stickybit on"
echo " 5. Calls the shell script from Homework 2"
echo " 6. Emails the OS-Release file to my IIT email address"
echo " 7. Exit the program "
echo

read -p "Enter 1, 2, 3, 4, 5, 6, or 7:" answer
echo
#

case "$answer" in

   1)
      function userFiles {
      echo -e "Please enter the file extension you'd like to look for: \c"
      read fileType
      find $directory -type f -name $fileType
     }
      userFiles
      echo
      ;;
   2)
      function callHomeworkOne {
      /bin/bash /home/jshakil/submit/reception
    }
      callHomeworkOne
      echo
      ;;

   3)
      echo "Deleting files..."
      function removeFiles {
      find . \( -name "*.mp3" -o -name "*.jpg" -o -name "*.gif" -o -name "*.o" \) -type f -delete
      echo "Files successfully deleted!"
      rm core
    }
      removeFiles
      echo
      ;;

   4)
      echo "Creating new directory with stickybit..."   
      function makeDirectory {
      mkdir newDirectory
      chmod 1777 newDirectory
      echo "New directory created successfully"
    }
      makeDirectory
      echo
      ;;
   5)
      function callHomeworkTwo {
      /bin/bash /home/jshakil/submit/menu
     }
      callHomeworkTwo
      echo
      ;;

   6)
      echo "Sending a copy of OS Release..."   
      function emailOSRelease {
      mailx -s  "HW3 email testing" jshakil@hawk.iit.edu < /etc/os-release
     }
      emailOSRelease
      echo "Copy sent."
      echo
      ;;

   7)
      break
      ;;

    *)
      echo "Please enter a vaild choice :)"
      ;;
esac
sleep 2

done

exit 0
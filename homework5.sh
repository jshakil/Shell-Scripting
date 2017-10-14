echo

read -p  "Please choose an option" answer
echo
#

   case "$answer" in

     1)

      #While loop to check if the Linux Login ID exists.
      while true
      do
        echo "Please enter a new Linux Login ID:"
        read newID
        echo 

        #Checks for ID and suppress the output so the user doesn't see it on the screen 
        egrep -i "$newID" /home/jshakil/home/passwd > /dev/null;

        if [ $? -eq 0 ]; then
          echo "Username is already taken!"
          echo       
        else
          echo "Creating new user ID..."
          sleep 1
          echo
          echo "...done."
          echo
          break
        fi
      done

       #Pauses after the ID has been created.
          sleep 2

          #Asks for the users information if the UserID is a new one.
          echo  "Please enter the users first name:"
          read first
          echo
          echo "Please enter the users last name:"
          read last
          echo
          echo "Please enter the users contact number:"
          read number


          #Takes the last line of the passwd file and extracts field 3 which is the UserID.
          userID=$(cut -d: -f3 /home/jshakil/home/passwd | tail -1) > /dev/null

          #Takes the User ID from field 3 and adds 1 to it.
          updateID=$((userID +1))

          #Takes the userID, the UID, GID, first name, last name, and inputs it in the passwd file for the new user
          echo "$newID:x:$updateID:$updateID:$first $last, 2017FA:/home/jshakil/home/$newID:/bin/bash" >> /home/jshakil/home/passwd

          #Takes the userID, and the GID and places it inside the group file for the new user
          echo "$newID:x:$updateID:" >> /home/jshakil/home/group

          #Takes the userID and creates a new line for the new user in the shadow file
          echo "$newID:6$55ZDcbsB$R6m4.CZzSUuWG6FdkuuZRQnT8jfjMeXwtsfciWAKLf2PQ0XcNJlxJmDEGInuXeugBLDoqVC1NdzTriyxwdEQ11:17435:0:99999:7:::" >> /home/jshakil/home/shadow

          #Creates a new directory for the user in the home directory with permission set to 755
          mkdir /home/jshakil/home/$newID -m755

          #Copies the bash profile to the users home directory   
          cp /etc/skel/.bash_profile /home/jshakil/home/$newID

          #Creates bin directory with permission set to 755 in the users home directory
          mkdir /home/jshakil/home/$newID/bin -m755

          echo
          echo "User successfully added to system"      

          sleep 2
          ;;


      2) break
         ;;
  esac

done

exit 0
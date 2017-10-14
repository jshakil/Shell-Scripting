!/bin/bash
#Jabran Shakil
#Reception Script
#This script aims to greet the user and display certain tasks such as OS release, sever memory etc.

echo -e "What is your first and last name?\c"
read first last
echo "Hello $first"
echo

echo "This is the OS release and Linux flavor: "
cat /proc/version
echo

echo "This is the record log of past login times for jshakil:"
last jshakil
echo

echo "This is the available memory on the server: "
free|head -2|tail -1|tr " " ":"|cut -d: -f38
echo

echo "These are the current running processes excluding root: "
ps -U root -u root -N
echo

echo "This is the IP address of the server"
hostname -i
echo

echo "This is the server current file system"
df -T
echo

echo "List of all User IDs and the owner"
cut -d: -f 1,5 /etc/passwd
echo

echo "Good bye $first"
echo

date +%c

exit 0
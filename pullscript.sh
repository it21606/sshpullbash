#! /bin/bash
clear
RED=`tput setaf 1`
NC=`tput sgr0`
echo "Please provide your it username${RED}(ex.it21606)${NC}:"
read it

ssh -tt $it@10.100.51.113 << ENDSSH
cp /home/tsadimas/it_users.txt ~/Desktop && exit
ENDSSH


echo "${RED}Copy from instructor's directory successful${NC}"
echo "Please re-enter your password to download file to local machine"
scp $it@10.100.51.113:~/Desktop/it_users.txt ~/Desktop
echo "Copy to local machine successful"
echo "Do you to delete remote file;(y/${RED}n${NC})"
read ans
if [ "$ans" == "y" ] 
then
echo "Please re-enter your password to delete file from remote machine"
ssh -tt $it@10.100.51.113 << ENDSSH2
rm ~/Desktop/it_users.txt && exit
ENDSSH2
echo "Delete successful"
fi
exit

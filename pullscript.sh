#! /bin/bash

echo "Please provide your it username(ex.it21606)"
read it

ssh $it@10.100.51.113 << HERE
cp ~/tsadimas/it_users.txt ~/Desktop
~.
HERE
echo "Copy from instructor's directory successful"
echo "Please re-enter your password to download file to local machine"
scp $it@10.100.51.113:~/Desktop/it_users.txt ~/Desktop.
echo "Copy to local machine successful"
echo "Do you to delete remote file;(y/n)"
read ans
if [ "$ans" == "y" ] 
then
echo "Please re-enter your password to delete file from remote machine"
ssh $it@10.100.51.113 'rm ~/Desktop/it_users.txt'
~.
fi

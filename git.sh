#!/bin/bash

# Created by VK (v0.5)

echo "Step 1. Removing old ssh key if present..."
rm -f ~/.ssh/id_rsa # delete id_rsa file
rm -f ~/.ssh/id_rsa.pub # delete id_rsa.pub file
sleep 2
echo "Step 2. Generating new ssh key..."
sleep 1
echo | ssh-keygen # standard ssh command to generate key pair. 'echo' execute passpharase dialog
echo "Step 3. Launching ssh-agent..."
sleep 2
eval $(ssh-agent -s) # start ssh-agent. 'eval' remains agent running. 's' define socket to find ssh agent
sleep 1
echo "Step 4. Adding identity..."
sleep 2
echo | ssh-add ~/.ssh/id_rsa # add ssh key to ssh agent. 'echo' execute passphrase dialog
sleep 1
echo "Step 5. Loading instruction..."
sleep 2
echo -e "Go to https://github.com/settings/keys -> 'New SSH key', paste text from\nid_rsa.pub file, that locates in C:\Users\username\.ssh, specify Title\nand click 'Add SSH key'." # 'e' support escape sequences like \n
echo -e "When you done please close text editor with opened key file." # only for win
open -a TextEdit ~/.ssh/id_rsa.pub 2>/dev/null # open id_rsa.pub file in TextEdit app on MacOS. '2>/dev/null' disables the error message on win
/c/Program\ Files/Notepad++/notepad++.exe ~/.ssh/id_rsa.pub 2>/dev/null # open id_rsa.pub file in Notepad++ app on Windows. '2>/dev/null' disables the error message on mac
read -p "Press ENTER to proceed next step." # wait for user action 
sleep 1
echo "Step 6. Connecting..."
sleep 1
ssh -T git@github.com # opens a pseudo-terminal with in the current session, with the output there in the same screen
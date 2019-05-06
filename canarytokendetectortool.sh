/#!/bin/sh
# Canary Token Detector
# Version 1.0
# This script will detect canary token in word documents
# Author - Abhishek Yadav
# www.abhishekyadavindia.blogspot.com/
# www.github.com/abhishekyadavindia/
clear
/bin/cat <<'AbhishekYadav'
          _     _     _     _          _  __     __       _             
    /\   | |   | |   (_)   | |        | | \ \   / /      | |            
   /  \  | |__ | |__  _ ___| |__   ___| | _\ \_/ /_ _  __| | __ ___   __
  / /\ \ | '_ \| '_ \| / __| '_ \ / _ \ |/ /\   / _` |/ _` |/ _` \ \ / /
 / ____ \| |_) | | | | \__ \ | | |  __/   <  | | (_| | (_| | (_| |\ V / 
/_/    \_\_.__/|_| |_|_|___/_| |_|\___|_|\_\ |_|\__,_|\__,_|\__,_| \_/  
                                                                        
www.abhishekyadavindia.blogspot.com/ | https://github.com/abhishekyadavindia/
AbhishekYadav
tput setaf 3
echo ""
echo "Canary Token Detector for Microsoft Word Document"
echo "Version 1.0 | Author:Abhishek Yadav"
echo ""
tput sgr0
read -p "Please Enter Word Document File name : " file
if [ ! -f $file ]
then
echo "File not exists"
exit 1
fi
if [[ $file == *.docx ]] || [[ $file == *.doc ]]
then
unzip -o $file
if [ ! -f word/footer1.xml ]
then
echo ":::::::::::::::::::::::::::"
echo "This file should be normal"
echo ":::::::::::::::::::::::::::"
exit 1
fi
if grep -q canarytoken word/footer2.xml word/footer1.xml word/footer3.xml word/header1.xml word/header2.xml word/header3.xml;
then
echo ":::::::::::::::::::::::::::"
tput setaf 1
tput bel
echo "[x] canary token detected"
tput sgr0
echo ":::::::::::::::::::::::::::"
else
echo ":::::::::::::::::::::::::::"
tput setaf 2
echo "This file is seem normal"
tput sgr0
echo ":::::::::::::::::::::::::::"
fi
rm -rf word docProps _rels
else
echo "This is not a word document file, select correct file"
fi

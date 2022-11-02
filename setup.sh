#!/bin/bash                                                                   
                                                                             
red='\033[1;31m'                  
rset='\033[0m'         
grn='\033[1;32m'
ylo='\033[1;33m'                                                                
blue='\033[1;34m'                                                               
cyan='\033[1;36m'
pink='\033[1;35m'
     
# Setup script in /usr/local/bin
# To access from any directory
# || \\      

export PATH=/usr/local/bin:$PATH
cp ./scankick.sh /usr/local/bin/scankick
chmod +x /usr/local/bin/scankick

# Message about success install

echo -e "$grn---------------------$grn"
echo -e "$ylo[*]$ylo$grn Success setup$grn"
echo -e "$grn---------------------$grn"


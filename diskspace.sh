#!/bin/sh
  red= tput setaf 1
  green= tput setaf 2
  yellow= tput setaf 3
  reset= tput sqr0
  space () {
#here we will give code to get space usage for the server
echo " "
echo "${green}Disc space usage in server is ${reset}
echo "$x"
ssh -q $x "df -kh /opt/dap"
echo " "
echo -n "${green}The Maximun disc space occupying by server is ${reset}
ssh -q $x "df -kh /opt/dap | tail -n +2" | awk '{print($5)}'
ssh -q $x "cd /opt/dap/domains/;du -sh * 2>/dev/null | grep G" >/home/dapeng/vancsai/script/space.txt
sort -n space.txt | head -1
./home/dapeng/vancsai/script/space.txt | paste -sd ";">x
ssh -q %x "cd /tmp; touch y ;chmod 777 y"
  }
  cpu() {
#here we will give the code to get cpu load of the server

  }
  mem(){
#here we will give code to get mem of the server

  }
#here we will ask for servername
read -p "Please let me know the servername" x
#here script should ask for what do we have to do with server
echo "${yellow}******If you want to check Space give${reset}${red}space${reset}${yellow}**********${reset}"
echo "${yellow}******If you want to check Memory give${reset}${red}mem${reset}${yellow}**********${reset}"
echo "${yellow}******If you want to check CPU give${reset}${red}cpu${reset}${yellow}**********${reset}"
read -p "What do you want to check in server" y
#here we will call the above mentioned funciones for if loop
if [ $y == space ]
then
space
elif [ $y == mem ]
then
mem
elif [ $y == cpu ]
then
cpu
fi

  

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
sort -nr space.txt | head -1
p=$(sort -nr space.txt | head -1 | awk '{print(2)}')
echo -n "${green}This Application is taking more space${reset}"
sort -n space.txt | tail -1 | awk '{print($2)}'
./home/dapeng/vancsai/script/test.sh | paste -sd ";">x
ssh -q %x "cd /tmp; touch y ;chmod 777 y"
scp -q x @$x:/tmp/y
ssh -q $x "cd /tmp;./y | sort -nr head -1"
echo -n "${green}This Instance is taking more space${reset}"
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'
g=$(aah -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}')
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'> /home/dapeng/vancsai/script/y
ssh -q $x "cd /tmp;rm y "
./home/dapeng/vancsai/script/work.sh | paste -sd ";">x
ssh -q %x "cd /tmp; touch y ;chmod 777 y"
scp -q x @$x:/tmp/y
ssh -q $x "cd /tmp;./y | sort -nr head -1"
echo -n "${green}This part is taking more space${reset}"
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'> /home/dapeng/vancsai/script/z
ssh -q $x "cd /tmp;rm y "
./home/dapeng/vancsai/script/lyt.sh | paste -sd ";">x
ssh -q %x "cd /tmp; touch y ;chmod 777 y"
scp -q x @$x:/tmp/y
ssh -q $x "cd /tmp;./y | sort -nr head -1"
echo -n "${green}This folder is taking more space${reset}"
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'> /home/dapeng/vancsai/script/a
ssh -q $x "cd /tmp;rm y "
./home/dapeng/vancsai/script/run.sh | paste -sd ";">x
ssh -q %x "cd /tmp; touch y ;chmod 777 y"
scp -q x @$x:/tmp/y
ssh -q $x "cd /tmp;./y | sort -nr head -1"
echo -n "${green}This files are taking more space${reset}"
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'
ssh -q $x "cd /tmp;./y | sort -nr | head -1" | awk '{print($2)}'> /home/dapeng/vancsai/script/b
ssh -q $x "cd /tmp;rm y "
  }
  cpu() {
#here we will give the code to get cpu load of the server
echo "${green}The uptime of the server is: ${reset}"
echo "$x:$(ssh -q $x "uptime")"
echo " "
echo "${green}The free -g  of the server is: ${reset}"
ssh -q $x "free -g"
echo " "
echo "${green}The top of the server is: ${reset}"
ssh -q $x "top -bn 1 -o %CPU | head -15"
ssh -q $x "top -bn 1 -o %CPU | head -8" > /home/dapeng/vancsai/script/script.txt
echo " "
echo -n " ${green}The server utilizing more CPU is :${reset}"
cat  /home/dapeng/vancsai/script/script.txt | tail -1 | awk '{print($2)}'
truncate -s 0 /home/dapeng/vancsai/script/script.txt
  }
  mem(){
#here we will give code to get mem of the server
echo "${green}The uptime of the server is: ${reset}"
echo "$x:$(ssh -q $x "uptime")"
echo " "
echo "${green}The free -g  of the server is: ${reset}"
ssh -q $x "free -g"
echo " "
echo "${green}The top of the server is: ${reset}"
ssh -q $x "top -bn 1 -o %MEM | head -15"
ssh -q $x "top -bn 1 -o %MEM | head -8" > /home/dapeng/vancsai/script/script.txt
echo " "
echo -n " ${green}The server utilizing more MEM is :${reset}"
cat  /home/dapeng/vancsai/script/script.txt | tail -1 | awk '{print($2)}'
truncate -s 0 /home/dapeng/vancsai/script/script.txt
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

  

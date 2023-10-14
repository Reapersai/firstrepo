#! /bin/sh
echo "Hi Please enter you Username to access script"
echo -n "Usename: "
read a
if  [ $a = Sai ]
then
	#here it should ask for username
	echo "Do you want to clear containers"
	read b
	if [ $b = yes ]
	then
		for x in `sudo docker ps -a | awk '{print($1)}' | tail -n +2`
		do
			sudo docker rm $x
		done
	else
		echo "Thanks for using scipt"
	fi
else
	echo "Please enter correct username"
fi

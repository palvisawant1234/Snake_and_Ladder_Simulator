#!/bin/bash -x

POSITION=0
option(){
	CHOICE=$((RANDOM % 3))
	if [ $CHOICE -eq 2 ]
	then
		echo "Ladder"
		POSITION=$(($POSITION + $dieRoll))
	elif [ $CHOICE -eq 1 ]
	then
		echo "Snake"
		POSITION=$(($POSITION - $dieRoll))
	else
		echo "No play"
	fi
}
dice()
{
        dieRoll=$((RANDOM % 6 + 1))
        echo "You got : $dieRoll"
	option
}
while [ $POSITION -le 100 ]
do
	dice
	if [ $POSITION -lt 0 ]
	then
		POSITION=0
	fi
	if [ $POSITION -eq 100 ]
	then
		echo "Your position is 100"
		echo "You won!!!"
		exit
	fi
	if [ $POSITION -gt 100 ]
	then
		POSITION=$(($POSITION - $dieRoll))
	fi
	echo Your position is:$POSITION
done


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
	echo Your position is:$POSITION
done
echo "You won the game"

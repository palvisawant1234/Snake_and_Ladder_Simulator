#!/bin/bash -x

POSITION=0
option(){
	CHOICE=$((RANDOM % 3))
	echo $CHOICE
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
        echo "You got $dieRoll"
	option
}
dice
echo Your position is:$POSITION

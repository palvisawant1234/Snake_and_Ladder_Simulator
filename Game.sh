#!/bin/bash -x

POSITION=0
player1position=0
player2position=0
die(){
	dieRoll=$((RANDOM % 6 + 1))
        echo "You got : $dieRoll"
	CHOICE=$((RANDOM % 3))
	if [ $CHOICE -eq 2 ]
	then
		echo "Ladder"
		POSITION=$(($POSITION + $dieRoll))
		checkCondition
		die
	elif [ $CHOICE -eq 1 ]
	then
		echo "Snake"
		POSITION=$(($POSITION - $dieRoll))
	else
		echo "No play"
	fi
}
checkCondition(){
	if [ $POSITION -lt 0 ]
	then
		POSITION=0
	fi
	if [ $POSITION -eq 100 ]
	then
		echo "Your position is 100"
		echo "Player $player won!!!"
		exit
	fi
	if [ $POSITION -gt 100 ]
	then
		POSITION=$(($POSITION - $dieRoll))
	fi
	echo Your position is:$POSITION
}
playGame(){
	while [ $POSITION -ne 100 ]
	do
		echo "-----Player:$player-----"
		if [ $player -eq 1 ]
		then
			POSITION=$player1position
			die
			checkCondition
			player1position=$POSITION
			player=2
		else
			POSITION=$player2position
			die
			checkCondition
			player2position=$POSITION
			player=1
		fi
	done
}
playGame

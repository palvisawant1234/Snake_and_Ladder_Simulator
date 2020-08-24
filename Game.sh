#!/bin/bash

#variables
POSITION=0
player1position=0
player2position=0
count=1
counter=1

declare -a playerOne
declare -a playerTwo

playerOne[0]=0
playerTwo[0]=0

#roll a die and check the option snake,ladder or no play
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

#check condition for above ,below and equal 100
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

#start the game
playGame(){
	while [ $POSITION -ne 100 ]
	do
		echo "-----Player:$player-----"
		if [ $player -eq 1 ]
		then
			POSITION=$player1position
			die
			checkCondition
			playerOne[count]=$POSITION
			player1position=$POSITION
			player=2
			count=$(($count+1))
		else
			POSITION=$player2position
			die
			checkCondition
			playerTwo[counter]=$POSITION
			player2position=$POSITION
			player=1
			counter=$(($counter+1))
		fi
	done
}
playGame

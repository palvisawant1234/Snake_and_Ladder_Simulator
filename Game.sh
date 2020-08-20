#!/bin/bash -x

POSITION=0
dice()
{
	dieRoll=$((RANDOM % 6 + 1))
	echo "You got $dieRoll"
}
dice

#!/bin/bash


<< disclaimer
This is just for infortaiment purpose

disclaimer

function is_loyal() {
read -p "Enter the bandi: " bandi
read -p "$1 ka pyarr %: " pyarr
if [[ $bandi == "daya bhabhi" ]];
then
	echo "$1 is loyal"

elif [[ $pyarr -ge 100 ]];
then
	echo "$1 is loyal"

else
	echo "$1 is not loyal"
fi
}

is_loyal "user"

#!/bin/bash
#Function to simulate Heads or Tails and store the result of toss in the dictionary 
declare -A myDictionary
flip_coin(){
	for ((i=0; i<10; i++)); do 
	    checkHeadsorTails=$((RANDOM%2)) 
	    if [ $checkHeadsorTails -eq 1 ]; then
		result="Heads"
	    else 
		result="Tails"
            fi
	    myDictionary["$i"]=$result
        done
}
flip_coin

#Displaying the Dictionary Elements
echo "Dictionary Elements:"
for key in "${!myDictionary[@]}"; do
    echo "$key: ${myDictionary[$key]}"
done

#Finding the percentage of the Singlet Combination
h=0
t=0
for key in "${!myDictionary[@]}"; do 
	if [ "${myDictionary[$key]}" == "Heads" ]; then 
	    ((h++)) 
	else 
	    ((t++)) 
	fi 
done
length=${#myDictionary[@]}
percentage=$(echo "scale=2; ($h / $length) * 100" | bc )
percentage2=$(echo "scale=2; ($t / $length) * 100" | bc)

# Print the result
echo "The percentage of Singlet Heads is: $percentage%"
echo "The percentage of Singlet Tails is: $percentage2%"

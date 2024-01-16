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
percentage=$(( (h * 100) / $length ))
percentage2=$(( (t * 100) / $length ))

# Print the result
echo "The percentage of Singlet Heads is: $percentage%"
echo "The percentage of Singlet Tails is: $percentage2%"

#Function to simulate doublet combination
declare -A Doublet
flip_coin2(){
	for ((i=0; i<=10; i++)); do
		firsttoss=$((RANDOM%2))
		secondtoss=$((RANDOM%2))
		if [[ $firsttoss -eq 1 && secondtoss -eq 1 ]]; then
			result="HH"
		elif [[ $firsttoss -eq 1 && secondtoss -eq 0 ]]; then
			result="HT"
		elif [[ $firsttoss -eq 0 && secondtoss -eq 1 ]]; then
                        result="TH"
		else
                        result="TT"
		fi
		Doublet["$i"]=$result
	done
}
flip_coin2

#Displaying the Dictionary Elements
echo "Dictionary Elements:"
for key in "${!Doublet[@]}"; do
    echo "$key: ${Doublet[$key]}"
done

#Finding the percentage for Doublet Combination
hh=0
ht=0
th=0
tt=0
for key in "${!Doublet[@]}"; do
        if [ "${Doublet[$key]}" == "HH" ]; then
            ((hh++))
        elif [ "${Doublet[$key]}" == "HT" ]; then
            ((ht++))
	elif [ "${Doublet[$key]}" == "TH" ]; then
            ((th++))
	else
	    ((tt++))
        fi
done
length1=${#Doublet[@]}
percentage_hh=$(( (hh * 100) / $length1 ))
percentage_ht=$(( (ht * 100) / $length1 ))
percentage_th=$(( (th * 100) / $length1 ))
percentage_tt=$(( (tt * 100) / $length1 ))

#Print the result
echo "The percentage of Doublet HH is: $percentage_hh%"
echo "The percentage of Doublet HT is: $percentage_ht%"
echo "The percentage of Doublet TH is: $percentage_th%"
echo "The percentage of Doublet TT is: $percentage_tt%"


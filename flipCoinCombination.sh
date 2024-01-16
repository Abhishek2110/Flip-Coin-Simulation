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
flip_coin1(){
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
flip_coin1

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

#Function to simulate Triplet Combination
declare -A Triplet
flip_coin2(){
	for ((i=0; i<10; i++)); do
		firsttoss1=$((RANDOM%2))
		secondtoss1=$((RANDOM%2))
		thirdtoss=$((RANDOM%2))
		if [[ $firsttoss1 -eq 1 && $secondtoss1 -eq 1 && $thirdtoss -eq 1 ]]; then
			result="HHH"
		elif [[ $firsttoss1 -eq 1 && $secondtoss1 -eq 1 && $thirdtoss -eq 0 ]]; then
			result="HHT"
		elif [[ $firsttoss1 -eq 1 && $secondtoss1 -eq 0 && $thirdtoss -eq 1 ]]; then
                        result="HTH"
                elif [[ $firsttoss1 -eq 1 && $secondtoss1 -eq 0 && $thirdtoss -eq 0 ]]; then
                        result="HTT"
                elif [[ $firsttoss1 -eq 0 && $secondtoss1 -eq 1 && $thirdtoss -eq 1 ]]; then
                        result="THH"
                elif [[ $firsttoss1 -eq 0 && $secondtoss1 -eq 1 && $thirdtoss -eq 0 ]]; then
                        result="THT"
                elif [[ $firsttoss1 -eq 0 && $secondtoss1 -eq 0 && $thirdtoss -eq 1 ]]; then
                        result="TTH"
		else
                        result="TTT"
		fi
		Triplet["$i"]=$result
	done
}
flip_coin2

#Displaying the Dictionary Elements
for key in "${!Triplet[@]}"; do
    echo "$key: ${Triplet[$key]}"
done

#Finding the percentage for Doublet Combination
hhh=0
hht=0          
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0
for key in "${!Triplet[@]}"; do
        if [ "${Triplet[$key]}" == "HHH" ]; then
            ((hhh++))
        elif [ "${Triplet[$key]}" == "HHT" ]; then
            ((hht++))
        elif [ "${Triplet[$key]}" == "HTH" ]; then
            ((hth++))
        elif [ "${Triplet[$key]}" == "HTT" ]; then
            ((htt++))
        elif [ "${Triplet[$key]}" == "THH" ]; then
            ((thh++))
        elif [ "${Triplet[$key]}" == "THT" ]; then
            ((tht++))
        elif [ "${Triplet[$key]}" == "TTH" ]; then
            ((tth++))
        else
            ((ttt++))
        fi
done
length2=${#Triplet[@]}
percentage_hhh=$(( (hhh * 100) / $length2 ))
percentage_hht=$(( (hht * 100) / $length2 ))
percentage_hth=$(( (hth * 100) / $length2 ))
percentage_htt=$(( (htt * 100) / $length2 ))
percentage_thh=$(( (thh * 100) / $length2 ))
percentage_tht=$(( (tht * 100) / $length2 ))
percentage_tth=$(( (tth * 100) / $length2 ))
percentage_ttt=$(( (ttt * 100) / $length2 ))

#Print the result
echo "The percentage of Triplet HHH is: $percentage_hhh%"
echo "The percentage of Triplet HHT is: $percentage_hht%"
echo "The percentage of Triplet HTH is: $percentage_hth%"
echo "The percentage of Triplet HTT is: $percentage_htt%"
echo "The percentage of Triplet THH is: $percentage_thh%"
echo "The percentage of Triplet THT is: $percentage_tht%"
echo "The percentage of Triplet TTH is: $percentage_tth%"
echo "The percentage of Triplet TTT is: $percentage_ttt%"

#!/bin/bash

#Function to simulate Singlet Combination and store the result of toss in the dictionary
declare -A Singlet
flip_coin(){    
        for ((i=0; i<10; i++)); do
            checkHeadsorTails=$((RANDOM%2))
            if [ $checkHeadsorTails -eq 1 ]; then
                result="Heads"     
            else
                result="Tails"
            fi
            Singlet["$i"]=$result
        done
}
flip_coin
            
# Displaying the Dictionary Elements
echo "Singlet Combination:"
for ((i=0; i<${#Singlet[@]}; i++)); do
    echo "$i: ${Singlet[$i]}"
done


#Sorting the Singlet Combinations
SortedSinglet=($(for element in "${Singlet[@]}"; do echo "$element"; done | sort))

# Displaying the Sorted Singlet Combinations
echo "Sorted Singlet Elements:"
for ((i=0; i<${#SortedSinglet[@]}; i++)); do
    echo "$i: ${SortedSinglet[$i]}"
done

# Finding the winning Singlet Combination
winning_combination=$(printf "%s\n" "${Singlet[@]}" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
                
# Display the winning combination
echo "The winning Singlet Combination is: $winning_combination"
                
# Count occurrences of each Singlet Combination
declare -A counts
for key in "${Singlet[@]}"; do
    ((counts["$key"]++))
done

# Calculate and print the percentages
length=${#Singlet[@]}
for key in "${!counts[@]}"; do
    percentage=$(( (counts["$key"] * 100) / length ))
    echo "The percentage of Singlet $key is: $percentage%"
done

#Function to simulate Doublet Combination and store the result of toss in the dictionary
declare -A Doublet
flip_coin1(){
         for ((i=0; i<10; i++)); do
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
          
# Displaying the Dictionary Elements
echo "Doublet Combination:"
for ((i=0; i<${#Doublet[@]}; i++)); do
    echo "$i: ${Doublet[$i]}"
done


#Sorting the Doublet Combinations
SortedDoublet=($(for element in "${Doublet[@]}"; do echo "$element"; done | sort))

# Displaying the Sorted Doublet Combinations
echo "Sorted Doublet Elements:"
for ((i=0; i<${#SortedDoublet[@]}; i++)); do
    echo "$i: ${SortedDoublet[$i]}"
done
                
# Finding the winning Doublet Combination
winning_combination1=$(printf "%s\n" "${SortedDoublet[@]}" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
                
# Display the winning combination  
echo "The winning Doublet Combination is: $winning_combination1"
                        
# Count occurrences of each doublet combination
declare -A counts1
for key in "${Doublet[@]}"; do
    ((counts1["$key"]++))
done

# Calculate and print the percentages
length1=${#Doublet[@]}
for key in "${!counts1[@]}"; do
    percentage=$(( (counts1["$key"] * 100) / length1 ))
    echo "The percentage of Doublet $key is: $percentage%"
done

#Function to simulate Triplet Combination and store the result of toss in the dictionary
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

# Displaying the Dictionary Elements
echo "Triplet Combination:"
for ((i=0; i<${#Triplet[@]}; i++)); do
    echo "$i: ${Triplet[$i]}"
done


#Sorting the Triplet Combinations
SortedTriplet=($(for element in "${Triplet[@]}"; do echo "$element"; done | sort))

# Displaying the Sorted Doublet Combinations
echo "Sorted Triplet Elements:"
for ((i=0; i<${#SortedTriplet[@]}; i++)); do
    echo "$i: ${SortedTriplet[$i]}"
done
                
# Finding the winning Triplet Combination
winning_combination2=$(printf "%s\n" "${SortedTriplet[@]}" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
                
# Display the winning combination  
echo "The winning Triplet Combination is: $winning_combination2"

# Count occurrences of each Triplet Combination
declare -A counts2
for key in "${Triplet[@]}"; do
    ((counts2["$key"]++))
done

# Calculate and print the percentages
length2=${#Triplet[@]}
for key in "${!counts2[@]}"; do
    percentage=$(( (counts2["$key"] * 100) / length2 ))
    echo "The percentage of Triplet $key is: $percentage%"
done

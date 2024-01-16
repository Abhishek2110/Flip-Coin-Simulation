isHead=1
checkHeadsorTails=$((RANDOM%2))
if [ $isHead -eq $checkHeadsorTails ]
then 
echo "Heads"
else
echo "Tails"
fi

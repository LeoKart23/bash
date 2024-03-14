#!/bin/bash

FILE=test.csv


LIST=$(cat ${FILE} | grep 'Engineer' | awk -F "," '{ print $1, $2, $4}')
#echo "${LIST}"

AGES=$(cat $FILE | grep 'Engineer' | awk -F "," '{ print $2}' | paste -sd+ - | bc )
#echo "$AGES"

LINES=$(cat $FILE | grep 'Engineer' | awk -F "," '{ print $2}' | wc -l)
#echo "$LINES"

SUM=$(( $AGES / $LINES ))
#echo "средний возраст: $SUM"

SUMMAGE=0
SUMMSALARY=0
counter=0
 
while IFS= read -r line; do
        PERSONAL_DATA=$( echo "$line" | grep 'Engineer' )
        if [[ -z "$PERSONAL_DATA" ]];then
                continue
         fi
        counter=$(( counter + 1 ))
        echo "${counter} $line" | grep 'Engineer' | awk -F "," '{ print $1 "," $2 "," $4}'
        AGE=$( echo "$line" | grep 'Engineer' | awk -F "," '{ print $2}')
        SALARY=$( echo "$line" | grep 'Engineer' | awk -F "," '{ print $4}')
#       FIO=$( echo "$line" | grep 'Engineer' | awk -F "," '{ print $1}')
#               echo "+$line" | awk '{ print $1 }' 
        SUMMAGE=$(( SUMMAGE + $AGE ))
#               echo "$AGE" #"$SUMMAGE"
#               echo "$SALARY"
#               echo "$SUMMAGE"
        SUMMSALARY=$(( SUMMSALARY + $SALARY ))
#               echo "$SUMMSALARY"      


done < $FILE


AVERAGE_AGE=$(( $SUMMAGE / $counter ))
echo "Средний возраст: $AVERAGE_AGE"
AVERAGE_SALARY=$(( $SUMMSALARY / $counter ))
echo "Средний возраст: $AVERAGE_SALARY"
echo "Сумма возрастов: $SUMMAGE"
echo "Сумма зарплаты: $SUMMSALARY"
#echo "$counter"
#for (( i = 0; i < "${#ZP[@]}"; i++)); do
#       echo "Index value: "${i}". Array value: ${ZP[i]}"
#done

#if [[ "${#ZP}" != 0 ]]; then
#       wc -l "$@"
#fi

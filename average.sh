#!/bin/bash

echo -n "Enter Marks in Python :- "
read python
echo -n "Enter Marks in CC     :- "
read cc 
echo -n "Enter Marks in LOS    :- "
read los

sum=`expr $python + $cc + $los`
avg=`expr $sum / 3`
tmp=$(( $sum * 100 ))
percent=`expr $tmp / 300`
echo "Sum is $sum"
echo "Average is $avg"
echo "Percentage is $percent"

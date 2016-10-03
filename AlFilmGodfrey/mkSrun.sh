1;95;0c#!/bin/bash

# configs  change to your desired configurations:
#N ; number of node
#n ; number of rank
#p ; number of thread


name="AlFilmGodfrey"

configs=(
"1"
"2"
"3"
"4"
"5"
"6"
"7"
"8"
"9"
"10"
)

rm mc.*.sh

for conf in "${configs[@]}" ; do
    num=`echo $conf | awk '{print $1}'`

    rm /gpfs/u/home/ACME/ACMEtany/scratch/MSMSEpaper/$name/$num/*  
    mkdir /gpfs/u/home/ACME/ACMEtany/scratch/MSMSEpaper/$name/$num

    sed -e "s/NAME/$name/g" \
        -e "s/NUM/$num/g" \
        srun_MC.tmp > mc.$num.sh

done
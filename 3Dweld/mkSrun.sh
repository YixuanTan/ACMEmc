#!/bin/bash

# configs  change to your desired configurations:
#N ; number of node
#n ; number of rank
#p ; number of thread

#configs=(
#"32     32     64 "
#"32     64     32 "
#"32     128    16 "
#"32     256     8 "
#"32     512     4 "
#"32     2048    1 "
#"64     64     64 "
#"64     128    32 "
#"64     256    16 "
#"64     512     8 "
#"64     1024    4 "
#"64     4096    1 "
#"128    128    64 "
#"128    256    32 "
#"128    512    16 "
#"128    1024    8 "
#"128    2048    4 "
#"128    8192    1 "
#"256    256    64 "
#"256    512    32 "
#"256    1024   16 "
#"256    2048    8 "
#"256    4096    4 "
#"256    16384   1 "
#)

configs=(
"1"
"2"
"3"
"4"
"5"
)

rm mc.*.*.sh

for conf in "${configs[@]}" ; do
    test1=`echo $conf | awk '{print $1}'`


    sed -e "s/TEST/$test1/g" \
        srun_MC.tmp > mc.$test1.sh 
    
done

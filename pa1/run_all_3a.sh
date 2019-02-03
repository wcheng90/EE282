#!/bin/bash

CORES=( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)
APPS=( blackscholes )
L2SIZE=( 1024 2048 4096 8192 )
PIPELINE=( wide narrow )

for app in "${APPS[@]}"
do
    for pipe in "${PIPELINE[@]}"
    do
        for core in "${CORES[@]}"
        do
            for size in "${L2SIZE[@]}"
            do
                echo " " >> output.txt
                echo "Now running application: $app and type: $pipe and num of cores: $core and L2 size: $size" >> output.txt
                ./zsim.sh -a $app -b $pipe -c $core --l2size $size -S >> output.txt
            done
        done
    done
done


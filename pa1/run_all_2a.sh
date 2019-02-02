#!/bin/bash

CORES=( 1 2 3 4 5 6 7 8 )
APPS=( art streamcluster mix)
L3SIZE=( 1024 2048 3072 4096 5120 6144 7168 8192 )
L3STRAT=( LRU Rand NRU )

for app in "${APPS[@]}"
do
    for l3size in "${L3SIZE[@]}"
    do
        for policy in "${L3STRAT[@]}"
        do
            echo "Now running application: $app; L3 Size: $l3size; L3 Policy: $policy"
            ./zsim.sh -a $app -b wide -c 8 --l3size $l3size --l3repl $policy
        done
    done
done


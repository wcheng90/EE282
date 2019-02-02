#!/bin/bash

CORES=( 1 2 3 4 5 6 7 8 )
APPS=( blackscholes streamcluster )

for app in "${APPS[@]}"
do
    for core in "${CORES[@]}"
    do
        echo "Now running application: $app and num of cores: $core"
        ./zsim.sh -a $app -c $core
    done
done


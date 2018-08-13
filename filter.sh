#!/usr/bin/env sh

cd src/

EXCLUDE='
'

INCLUDE='
'

for exclude_file in $EXCLUDE
do
    for include_file in $INCLUDE
    do
        if [ "$include_file" == "$exclude_file" ]; then
            continue 2
        fi;
    done

    rm -rf "$exclude_file"
done
#!/bin/bash

touch image.log

process() { 
    mkdir -p textfile
    mv *.txt textfile/

    for j in textfile/*.txt; do
        decode=$(echo -n 'http' | base64 | cut -c 1-4)
        if grep -q "$decode" "$j"; then
            echo "$(date +"%d/%m/%y %H:%M:%S") [FOUND] $1" >> image.log
            link=$(echo -n $(cat "$j") | base64 -d)
            wget "$link"
            mv "$j" "./"
            rm -r textfile
            exit 1
        else
            echo "$(date +"%d/%m/%y %H:%M:%S") [NOT FOUND] $1" >> image.log
            rm -r textfile
        fi
    done
sleep 1
}

for i in genshin_character/Mondstat/*.jpg; do
    steghide extract -sf "$i" -p ""
   process $i
done

for i in genshin_character/Liyue/*.jpg; do
    steghide extract -sf "$i" -p ""
    process $i
done

for i in genshin_character/Fontaine/*.jpg; do
    steghide extract -sf "$i" -p ""
   process $i
done

for i in genshin_character/Inazuma/*.jpg; do
    steghide extract -sf "$i" -p ""
    process $i
done

for i in genshin_character/Sumeru/*.jpg; do
    steghide extract -sf "$i" -p ""
   process $i
done



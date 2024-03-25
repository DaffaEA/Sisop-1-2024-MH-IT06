#!/bin/bash

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN' -O genshin.zip

unzip genshin.zip

unzip genshin_character.zip


for i in genshin_character/*.jpg;
do
x=`basename $i`
nama=$(echo "$x" | xxd -r -p)
region=$(awk -F',' -v name="$nama" '$1 == name {print $2}' list_character.csv)
elemen=$(awk -F',' -v name="$nama" '$1 == name {print $3}' list_character.csv)
weapon=$(awk -F',' -v name="$nama" '$1 == name {print $4}' list_character.csv)
mkdir -p "genshin_character/$region"
mv "$i" "genshin_character/$region"-"$nama"-"$elemen"-"$weapon.jpg"
mv "genshin_character/$region"-"$nama"-"$elemen"-"$weapon.jpg" "genshin_character/$region/"
done

awk '
BEGIN {print "Catalyst :"}
/Catalyst/ { ++n }
END {print n}' list_character.csv

awk '
BEGIN {print "Bow :"}
/Bow/ { ++n }
END {print n}' list_character.csv

awk '
BEGIN {print "Polearm :"}
/Polearm/ { ++n }
END {print n}' list_character.csv

awk '
BEGIN {print "Sword :"}
/Sword/ { ++n }
END {print n}' list_character.csv

awk '
BEGIN {print "Claymore :"}
/Claymore/  { ++n }
END {print n}' list_character.csv


rm -r  genshin.zip genshin_character.zip list_character.csv

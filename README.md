# Sisop-1-2024-MH-IT06
### Soal 1

### Soal 2

### Soal 3
```bash
#!/bin/bash

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN' -O genshin.zip
unzip genshin.zip
unzip genshin_character.zip
```
- wget mendownload file dari https://docs.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9 dengan nama "genshin.zip"
- unzip genshin.zip dan unzip genshin_character.zip

```bash
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
```



### Soal 4

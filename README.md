# Sisop-1-2024-MH-IT06
### Soal 1

### Soal 2

# Register.sh


Fungsi untuk meminta input dari user

```bash
!/bin/bash

read -p "Masukkan email: " email
read -p "Masukkan username: " username
read -p "Masukkan pertanyaan keamanan: " security_question
read -p "Masukkan jawaban pertanyaan keamanan: " security_answer
read -s -p "Masukkan password: " password
echo
```


Fungsi untuk memvalidasi password

```bash

validate_password() {
    password="$1"
    if [[ ${#password} -lt 8 || ! "$password" =~ [A-Z] || ! "$password" =~ [a-z] || ! "$password" =~ [0-9] ]]; then
        return 1
    else
        return 0
    fi
}
```

Fungsi untuk memvalidasi email sudah terdaftar atau belum

```bash
if grep -q "^$email:" users.txt; then
    echo "Email sudah terdaftar."
    exit 1

```
Fungsi lanjutan untuk memvalidasi password
```bash
if ! validate_password "$password"; then
    echo "Password harus memiliki minimal 8 karakter, terdiri dari huruf besar, huruf kecil, dan angka."
    exit 1
fi
```

Fungsi untuk menulis informasi pengguna baru ke dalam file users.txt

```bash
echo "$email:$username:$security_question:$security_answer:$password" >> users.txt

echo "Registrasi berhasil. Pengguna telah ditambahkan ke dalam users.txt."
```


# Login.sh


Dibawah ini adalah fungsi "login" dan rangkaian yang dibutuhkan

```bash
!/bin/bash
login() {
    read -p "Masukkan email: " email
    read -p "Masukkan password: " password
```
Ini adalah fungsi untuk meminta input dari user

```bash
user_data=$(grep "^$email:" users.txt)
```
Ini adalah fungsi untuk melihat dan mencari data yang berada dalam file "users.txt"

```bash
if [[ -n $user_data ]]; then
user_password=$(echo "$user_data" | cut -d ':' -f5)
if [[ $password == $user_password ]]; then
echo "Login berhasil."

else
echo "Password salah."
fi
else
echo "Email tidak ditemukan."
fi
}
```
ini adalah fungsi untuk memproses data yang telah diambil dari file "user.txt". 
- Jika email dan password sesuai dengan yang berada di "users.txt", maka akan memunculkan pesan "Login berhasil."
- Jika password salah, maka akan memunculkan pesan "Password salah."
- Jika email tidak ditemukan, maka akan memunculkan pesan "Email tidak ditemukan."

```bash
login
```
Ini untuk memanggil fungsi "login"

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

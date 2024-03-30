# Sisop-1-2024-MH-IT06
# Laporan Resmi Praktikum Sistem Operasi Modul 1

Kelompok IT-06:

-Daffa Rajendra Priyatama 5027231009

-Nicholas Arya Krisnugroho Rerangin 5027231058

-Johanes Edward Nathanael 5027231067

# Pengantar 
Laporan resmi ini dibuat terkait dengan praktikum modul 1 sistem operasi yang telah dilaksanakan pada tanggal 20 Maret 2024 hingga tanggal 30 Maret 2024. Praktikum modul 1 terdiri dari 4 soal yang dikerjakan oleh kelompok praktikan yang terdiri dari 3 orang selama waktu tertentu.

Kelompok IT06 juga telah menyelesaikan tugas praktikum modul 1 yang telah diberikan dan telah melakukan demonstrasi dan revisi kepada Asisten Penguji (Mochamad Zidan Hadipratama). Dari hasil praktikum yang telah dilakukan sebelumnya, maka diperoleh hasil sebagaimana yang dituliskan pada setiap bab di bawah ini.

# Soal 1

## Isi Soal 
Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.

Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “Sandbox.csv” untuk diberikan ke cipung dan abe 

a. Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi

b. Karena karena Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki  profit paling kecil

c. Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi 

d. Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens

## Penyelesaian 

### sandbox.sh
### Mengunduh file 

```bash

wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0" -O Sandbox.csv
```
- wget mendownload file dari https://docs.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0 dengan nama "Sandbox.csv"

### Pembeli dengan Penjualan tertinggi
```bash

awk -F',' '{sales[$6]+=$17} END {for (customer in sales) print sales[customer], customer}' Sandbox.csv | sort -nr | head -n1
```
- Fungsi ini untuk meng-sort data, mencari, dan menampilkan nama pembeli dengan total sales paling tinggi.
- Command awk -F',' '{sales[$6]+=$17} END {for (customer in sales) print sales[customer], customer}' , digunakan untuk membaca file teks yang dipisahkan oleh koma, menghitung total sales untuk setiap customer, dan mencetak total penjualan diikuti oleh data nama customer.
- Command sort -nr digunakan untuk meng-sort nilai data secara numerik
- Command head -n1 untuk mengambil data paling atas hasil tabel data yang telah disort dan -n1 untuk mengambil 1 baris

### Segment Customer dengan Profit terendah 
```bash

  awk -F',' '{profit[$7]+=$20} END {for (segment in profit) print profit[segment], segment}' Sandbox.csv | sort -n | awk 'NR==2'
```
- Fungsi ini untuk meng-sort data, mencari, dan menampilkan data segment dengan profit terendah.
- Command awk -F',' '{sales[$6]+=$17} END {for (customer in sales) print sales[customer], customer}' , menghitung total keuntungan untuk setiap segmen, dan menampilkan total keuntungan diikuti oleh nama segmen.
- Command sort -n digunakan untuk meng-sort nilai data secara numerik
- Command awk 'NR==2' untuk mengambil data secara spesifik, spesifiknya disini merupakan baris ke 2 hasil sort (agar tidak menampilkan baris 0 Segment) 

### Kategori Penjualan dengan Total Profit Tertinggi
```bash

awk -F',' '{profit[$14]+=$20} END {for (category in profit) print profit[category], category}' Sandbox.csv | sort -nr | head -n3
```
- Fungsi ini untuk meng-sort data, mencari, dan menampilkan data category dengan total profit tertinggi.
- Command awk -F',' '{profit[$14]+=$20} END {for (category in profit) print profit[category], category}' , perintah ini menghitung total keuntungan untuk setiap kategori dalam input yang diberikan dan mencetak total keuntungan diikuti oleh nama kategori.
- Command sort -n digunakan untuk meng-sort nilai data secara numerik
- Command head -n3 untuk mengambil data paling atas hasil tabel data yang telah disort dan diolah, dan -n3 untuk mengambil 3 baris

### Kategori Penjualan dengan Total Profit Tertinggi
```bash

awk -F',' '$6 ~ /Adriaens/ {print $2,"-",  $18}' Sandbox.csv
```
- Command ini berguna untuk mencetak kolom kedua dan kedelapan belas dari suatu baris dalam yang menemukan keyword "Adriaens" file CSV Sandbox.csv.

### Hasil Output  
![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/ad845928-518c-4822-85ba-ddcac63ebb02)

### Revisi 
Dalam menjalankan command ke 2 terdapat kesalahan maka ada perubahan pada commandnya 

![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/61445b76-d660-46d2-98eb-e30e068b23e0)

Perubahan Command berupa 
```bash

  awk -F',' '{profit[$7]+=$20} END {for (segment in profit) print profit[segment], segment}' Sandbox.csv | sort -nr | head -n2 
```
Menjadi 
```bash

  awk -F',' '{profit[$7]+=$20} END {for (segment in profit) print profit[segment], segment}' Sandbox.csv | sort -n | awk 'NR==2'
```

# Soal 2

## Isi Soal 
Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti,  bantulah oppie untuk membuat program yang akan memudahkan tugasnya 
- Buatlah 2 program yaitu login.sh dan register.sh
- Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password

- Username yang dibuat bebas, namun email bersifat unique. setiap email yang mengandung kata admin akan dikategorikan menjadi admin 
- Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi
- Password tersebut harus di encrypt menggunakan base64
- Password yang dibuat harus lebih dari 8 karakter
- Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
- Harus terdapat paling sedikit 1 angka 
- Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.
- Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.
- Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password
- Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin. 
- Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit
- Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.
- Format: [date] [type] [message]
- Type: REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
- Ex:
- [23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully
- [23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]

## Penyelesaian 
### Register.sh


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


### Login.sh


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

# Soal 3

## Isi Soal  
    Alyss adalah seorang gamer yang sangat menyukai bermain game Genshin Impact. Karena hobinya, dia ingin mengoleksi foto-foto karakter Genshin Impact. Suatu saat Yanuar memberikannya sebuah Link yang berisi koleksi kumpulan foto karakter dan sebuah clue yang mengarah ke penemuan gambar rahasia. Ternyata setiap nama file telah dienkripsi dengan menggunakan hexadecimal. Karena penasaran dengan apa yang dikatakan Yanuar, Alyss tidak menyerah dan mencoba untuk mengembalikan nama file tersebut kembali seperti semula.
    
- Alyss membuat script bernama awal.sh, untuk download file yang diberikan oleh Yanuar dan unzip terhadap file yang telah diunduh dan decode setiap nama file yang terenkripsi dengan hex . Karena pada file list_character.csv terdapat data lengkap karakter, Alyss ingin merename setiap file berdasarkan file tersebut. Agar semakin rapi, Alyss mengumpulkan setiap file ke dalam folder berdasarkan region tiap karakter
- Format: Region - Nama - Elemen - Senjata.jpg
- Karena tidak mengetahui jumlah pengguna dari tiap senjata yang ada di folder "genshin_character".Alyss berniat untuk menghitung serta menampilkan jumlah pengguna untuk setiap senjata yang ada
- Format: [Nama Senjata] : [jumlah]
- Untuk menghemat penyimpanan. Alyss menghapus file - file yang tidak ia gunakan, yaitu genshin_character.zip, list_character.csv, dan genshin.zip
- Namun sampai titik ini Alyss masih belum menemukan clue dari the secret picture yang disinggung oleh Yanuar. Dia berpikir keras untuk menemukan pesan tersembunyi tersebut. Alyss membuat script baru bernama search.sh untuk melakukan pengecekan terhadap setiap file tiap 1 detik. Pengecekan dilakukan dengan cara meng-ekstrak sebuah value dari setiap gambar dengan menggunakan command steghide. Dalam setiap gambar tersebut, terdapat sebuah file txt yang berisi string. Alyss kemudian mulai melakukan dekripsi dengan hex pada tiap file txt dan mendapatkan sebuah url. Setelah mendapatkan url yang ia cari, Alyss akan langsung menghentikan program search.sh serta mendownload file berdasarkan url yang didapatkan.
- Dalam prosesnya, setiap kali Alyss melakukan ekstraksi dan ternyata hasil ekstraksi bukan yang ia inginkan, maka ia akan langsung menghapus file txt tersebut. Namun, jika itu merupakan file txt yang dicari, maka ia akan menyimpan hasil dekripsi-nya bukan hasil ekstraksi. Selain itu juga, Alyss melakukan pencatatan log pada file image.log untuk setiap pengecekan gambar
- Format: [date] [type] [image_path]
- Ex: 
- [24/03/20 17:18:19] [NOT FOUND] [image_path]
- [24/03/20 17:18:20] [FOUND] [image_path]
- Hasil akhir:
- genshin_character
- search.sh
- awal.sh
- image.log
- [filename].txt
- [image].jpg

## Penyelesaian 
### awal.sh 
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
- Looping melalui setiap file JPG di dalam direktori genshin_character dengan menggunakan pola genshin_character/*.jpg.
- Mengambil nama file tanpa ekstensi menggunakan perintah basename.
- Mengonversi nama file dari format heksadesimal ke format teks biasa menggunakan perintah xxd.
- Mencari informasi tentang karakter (wilayah, elemen, dan senjata) dari file list_character.csv menggunakan perintah awk, dengan mengacu pada nama karakter yang diperoleh sebelumnya.
- Membuat direktori baru berdasarkan wilayah karakter menggunakan mkdir -p.
- Memindahkan file JPG ke dalam direktori baru yang sesuai dengan wilayah, dan memberikan nama baru yang mencakup nama karakter, elemen, dan senjata.
- Menggabungkan file yang telah dipindahkan menjadi satu direktori.

```bash
awk '
BEGIN {print "Catalyst :"}
/Catalyst/ { ++n }
END {print n}' list_character.csv
```
Command ini  menghitung jumlah karakter yang menggunakan senjata tipe Catalyst dari file list_character.csv, dan terakhir mencetak jumlahnnya.

```bash
awk '
BEGIN {print "Bow :"}
/Bow/ { ++n }
END {print n}' list_character.csv
```
Command ini  menghitung jumlah karakter yang menggunakan senjata tipe Bow dari file list_character.csv, dan terakhir mencetak jumlahnnya.
```bash
awk '
BEGIN {print "Polearm :"}
/Polearm/ { ++n }
END {print n}' list_character.csv
```
Command ini  menghitung jumlah karakter yang menggunakan senjata tipe Polearm dari file list_character.csv, dan terakhir mencetak jumlahnnya.

```bash
awk '
BEGIN {print "Sword :"}
/Sword/ { ++n }
END {print n}' list_character.csv
```
Command ini  menghitung jumlah karakter yang menggunakan senjata tipe Sword dari file list_character.csv, dan terakhir mencetak jumlahnnya.

```bash
awk '
BEGIN {print "Claymore :"}
/Claymore/  { ++n }
END {print n}' list_character.csv
```
Command ini  menghitung jumlah karakter yang menggunakan senjata tipe Claymore dari file list_character.csv, dan terakhir mencetak jumlahnnya.

```bash
rm -r  genshin.zip genshin_character.zip list_character.csv
```
Command ini menghapus file dan direktori

### search.sh
```bash
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
```
1. Fungsi ini  melakukan operasi pada file-file teks yang diekstrak dari gambar.
2. Membuat direktori textfile jika belum ada.
3. Memindahkan semua file teks (dengan ekstensi .txt) ke dalam direktori textfile.
4. Melakukan iterasi melalui setiap file teks dalam direktori textfile.
5. Mengecek apakah file teks tersebut mengandung string yang telah dienkripsi dengan base64 (dalam hal ini, 'http').
6. Jika string tersebut ditemukan, maka mencetak pesan [FOUND] ke dalam file image.log, mendekripsi tautan yang terenkripsi, mengunduh file yang ditautkan, dan menghapus direktori textfile sebelum keluar dari skrip dengan kode keluar 1.
7. Jika string tidak ditemukan, maka mencetak pesan [NOT FOUND] ke dalam file image.log dan menghapus direktori textfile.

```bash 
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
```
### Ini adalah loop untuk setiap file gambar JPG yang di dalam direktori genshin_character 
- Monstadt
- Liyue
- Fontaine
- Inazuma
- Sumeru 

Setiap gambar akan diekstrak dengan menggunakan steghide dan hasilnya akan diproses menggunakan fungsi process.

### Hasil 
### awal.sh
![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/90821f8f-55c7-4923-a9a5-d79619d96229)

![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/ae12b67b-d497-4d5e-8502-9bbe3fefd94f)

![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/4942d305-f1b9-470d-ba57-18c9002fea21)

![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/e16f70de-2e3d-4739-9d1a-91bfd671893c)

### search.sh 
![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/5d87fe42-9fd7-49ee-a790-0a05a08e946d)
![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/978519b7-2599-4c81-8535-cc3e2fe60e3e)
![image](https://github.com/DaffaEA/Sisop-1-2024-MH-IT06/assets/142997842/4ad02c59-f78c-403b-a7c2-19bb8e19a734)


# Soal 4
## Isi Soal
Stitch sangat senang dengan PC di rumahnya. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Tentu saja, Stitch adalah seorang streamer yang harus setiap hari harus bermain game dan streaming.  Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Setelah selesai diperbaiki, ternyata biaya perbaikan sangat mahal sehingga dia harus menggunakan uang hasil tabungan nya untuk membayarnya. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer.
Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua - metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/. 

- Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-20 15:00:00, maka file log yang akan tergenerate adalah metrics_20240320150000.log. 
- Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit. 
- Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi metrics_agg_2024032015.log dengan format metrics_agg_{YmdH}.log 
- Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file. 

## Penyelesaian 

### aggregate_minutes_to_hourly_log.sh
```bash
time=$(date +"%Y%m%d%H%M%S")
touch /home/shittim/metrics_agg_$time.log
echo -n "minimum" >> /home/shittim/metrics_agg_$time.log

for i in {1..7}
do
     echo -n ",$(awk -F ',' -v col="$i" 'NR==1 {min=$col} NR>1 && $col<min {min=$col} NR==60 {exit} END {print min}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
done

echo -n ",$(awk -F ',' 'NR==1 {print $8}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
echo -n ",$(awk -F ',' 'NR==1 {min=$9} NR>1 && $col<min {min=$9} NR==60 {exit} END {print min}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log

echo -e -n "\nmaximum" >> /home/shittim/metrics_agg_$time.log

for i in {1..7}
do
    echo -n ",$(awk -F ',' -v col="$i" 'NR==1 {max=$col} NR>1 && $col>max {max=$col} NR==60 {exit} END {print max}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
done

echo -n ",$(awk -F ',' 'NR == 1 {print $8}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
echo -n ",$(awk -F ',' 'NR==1 {max=$9} NR>1 && $col>max {max=$9} NR==60 {exit} END {print max}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log

echo -e -n "\naverage" >> /home/shittim/metrics_agg_$time.log

for i in {1..7}
do
avg_val=$(awk -F ',' -v col="$i" '{sum += $col} END {if (NR > 0) print sum / NR}' /home/shittim/log/*.log)
    echo -n ",$avg_val" >> /home/shittim/metrics_agg_$time.log
done

echo -n ",$(awk -F ',' 'NR == 1 {print $8}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
echo -n ",$(awk -F ',' '{sum += $9} END {if (NR > 0) print sum / NR}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log

mv /home/shittim/metrics_agg_$time.log /home/shittim/log/

chmod 600 /home/shittim/log/metrics_agg_$time.log

#0 * * * * /home/shittim/Sisop-1-2024-MH-IT06/soal_4/aggregate_minutes_to_hourly_log.sh
```
- Fungsi memperoleh waktu saat ini dalam format "YYYYMMDDHHMMSS" menggunakan perintah date dan menyimpannya dalam variabel time.
- Membuat file log dengan nama yang mengandung informasi waktu saat itu menggunakan perintah touch.
- Menambahkan string "minimum" ke file log tanpa karakter newline menggunakan perintah echo.
- Mencari nilai minimum dari setiap kolom dalam file log dan menambahkannya ke file log.
- Nilai minimum dari kolom ke-8 juga diambil dan ditambahkan ke file log.
- Menambahkan string "maximum" ke file log dengan karakter newline menggunakan perintah echo.
- Mencari nilai maksimum dari setiap kolom dalam file log dan menambahkannya ke file log.
- Nilai maksimum dari kolom ke-8 juga diambil dan ditambahkan ke file log.
- Menambahkan string "average" ke file log dengan karakter newline menggunakan perintah echo.
- Menghitung nilai rata-rata dari setiap kolom dalam file log dan menambahkannya ke file log.
- Nilai rata-rata dari kolom ke-8 juga diambil dan ditambahkan ke file log.
- Memindahkan file log yang telah dibuat dan diisi ke dalam direktori tertentu menggunakan perintah mv.
- Mengatur izin file log menjadi 600 (hanya pemilik yang memiliki akses tulis dan baca) menggunakan perintah chmod.
- Memakai komentar untuk crontab agar menjalankan secara otomatis pada jadwal tertentu 

### minute_log.sh

```bash 
#!/bin/bash

time=$(date +"%Y%m%d%H%M%S")

data=$(free -m)
size=$(du -sh /home/shittim)

mem=$(echo "$data" | awk 'NR==2{print $2","$3","$4","$7}')
swap=$(echo "$data" | awk 'NR==3{print $2","$3","$4}')
sizee=$(echo "$size" | cut -f1)

mkdir -p /home/shittim/log
echo "$mem,$swap,/home/shittim,$sizee" > /home/shittim/log/metrics_$time.log

chmod 600 /home/shittim/log/metrics_$time.log

#* * * * * sleep 60 && /home/shittim/Sisop-1-2024-MH-IT06/soal_4/minute_log.sh
```

- Fungsi memperoleh waktu saat ini dalam format "YYYYMMDDHHMMSS" menggunakan perintah date dan menyimpannya dalam variabel time.
- Menjalankan perintah du -sh /home/shittim untuk memantau ukuran direktori /home/shittim dan menyimpan outputnya dalam variabel size.
- Mengekstrak nilai yang relevan dari output free -m dan menyimpannya dalam variabel mem dan swap.
- Mengekstrak ukuran dari output du -sh /home/shittim dan menyimpannya dalam variabel sizee.
- Membuat file log dengan nama yang mengandung informasi waktu saat itu di dalam direktori /home/shittim/log.
- Menyimpan data memori, swap, lokasi direktori, dan ukuran direktori dalam file log yang baru dibuat.
- Mengatur izin file log menjadi 600 (hanya pemilik yang memiliki akses tulis dan baca) menggunakan perintah chmod.
- Memakai komentar untuk crontab agar menjalankan secara otomatis pada jadwal tertentu. Pada kasus ini dijalankan setiap menit dan menunda eksekusi skrip selama 60 detik.










#!/bin/bash

# Meminta input dari pengguna
read -p "Masukkan email: " email
read -p "Masukkan username: " username
read -p "Masukkan pertanyaan keamanan: " security_question
read -p "Masukkan jawaban pertanyaan keamanan: " security_answer
read -s -p "Masukkan password: " password
echo

# Fungsi untuk memvalidasi password
validate_password() {
    password="$1"
    if [[ ${#password} -lt 8 || ! "$password" =~ [A-Z] || ! "$password" =~ [a-z] || ! "$password" =~ [0-9] ]]; then
        return 1
    else
        return 0
    fi
}

# Validasi email
if grep -q "^$email:" users.txt; then
    echo "Email sudah terdaftar."
    exit 1
fi

# Validasi password
if ! validate_password "$password"; then
    echo "Password harus memiliki minimal 8 karakter, terdiri dari huruf besar, huruf kecil, dan angka."
    exit 1
fi

# Menulis informasi pengguna baru ke dalam file users.txt
echo "$email:$username:$security_question:$security_answer" >> users.txt

echo "Registrasi berhasil. Pengguna telah ditambahkan ke dalam users.txt."

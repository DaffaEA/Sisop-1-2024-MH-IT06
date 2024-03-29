#!/bin/bash
login() {
    read -p "Masukkan email: " email
    read -p "Masukkan password: " password

    
    user_data=$(grep "^$email:" users.txt)

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


login

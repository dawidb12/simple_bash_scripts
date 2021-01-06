#!/bin/bash

function load_info() {
    read -p "Password length: " characters_amount
    read -p "Number of passwords: " passwords_number
}

function show_menu() {
    echo "What type of password should I generate?"
    options="\"Lower case only\" \"Upper and lower case only\" \"Upper, lower case and numbers\" \"Upper, lower case, numbers and special characters\" \"Quit\""
    PS3='Choose an option: '

    eval set $options

    select option in "$@"
    do
        case "$option" in
            "Lower case only")
                load_info
                echo ""
                echo "Passwords:"
                cat /dev/urandom | tr -dc 'a-z' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Upper and lower case only")
                load_info
                echo ""
                echo "Passwords:"
                cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Upper, lower case and numbers")
                load_info
                echo ""
                echo "Passwords:"
                cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Upper, lower case, numbers and special characters")
                load_info
                echo ""
                echo "Passwords:"
                cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*()_+' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Quit")
                echo "Thank you for using the script!"
                exit 0
                ;;
            *)
                echo "Wrong option! You can choose:"
                show_menu
                ;;
        esac
    done
}

show_menu
#!/bin/bash

function load_info() {
    read -p "Ile znaków ma zawierać hasło: " characters_amount
    read -p "Ile propozycji haseł mam wyświetlić: " passwords_number
}

function show_menu() {
    echo "Jaki typ hasła mam wygenerować?"
    options="\"Hasło z małymi literami\" \"Hasło z wielkimi literami\" \"Hasło z wielkimi, małymi literami oraz cyframi\" \"Hasło z wielkimi i małymi literami, cyframi oraz znakami specjalnymi\" \"Wyjście\""
    PS3='Wybierz opcję: '

    eval set $options

    select option in "$@"
    do
        case "$option" in
            "Hasło z małymi literami")
                load_info
                echo ""
                echo "Oto propozycje haseł:"
                cat /dev/urandom | tr -dc 'a-z' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Hasło z wielkimi literami")
                load_info
                echo ""
                echo "Oto propozycje haseł:"
                cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Hasło z wielkimi, małymi literami oraz cyframi")
                load_info
                echo ""
                echo "Oto propozycje haseł:"
                cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Hasło z wielkimi i małymi literami, cyframi oraz znakami specjalnymi")
                load_info
                echo ""
                echo "Oto propozycje haseł:"
                cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*()_+' | fold -w $characters_amount | head -n $passwords_number
                echo ""
                show_menu
                ;;
            "Wyjście")
                echo "Dzięki za skorzystanie ze skryptu!"
                exit 0
                ;;
            *)
                echo "Wybrano złą opcję. Wybierz spośród poniższych:"
                show_menu
                ;;
        esac
    done
}

show_menu
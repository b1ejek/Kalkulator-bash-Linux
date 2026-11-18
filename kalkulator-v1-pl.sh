#!/bin/bash\
while true; do

    while true; do
        #
        #Menu wyboru 
        #
        clear
        echo "####################"
        echo "#                  #"
        echo "#  + | Dodawanie   #"
        echo "#  - | odejmowanie #"
        echo "#  * | mnożenie    #"
        echo "#  / | dzielenie   #"
        echo "#                  #"
        echo "####################"
        read -p "Wybierz działanie: " dz

        if [[ "$dz" =~ ^[+*/-]$ ]]; then
            break
        else
            clear
            echo "Błąd: Nie ma takiego wyboru! Spróbuj ponownie."
        fi
    done

    while true; do
        #
        #Podanie a i sprawdzenie czy jest liczba
        #
        read -p "Wybierz lczbę a: " a
        if [[ "$a" =~ ^-?[0-9]+([,.][0-9]+)?$ ]]; then

            a=${a//,/.}

            #
            #Podanie b i sprawdzenie czy jest liczba
            #
            read -p "Wybierz lczbę b: " b
            if [[ "$b" =~ ^-?[0-9]+([,.][0-9]+)?$ ]]; then

                b=${b//,/.}
                #
                #jesli liczba a dzielona przez 0 to komunikat \/
                #
                if [[ "$dz" == "/" ]] && [[ $(echo "$b == 0" | bc -l) -eq 1 ]]; then 
                    echo "Nie dziel przez 0"
                    echo "Liczba $b = 0 a działanie to $dz"
                    exit
                fi
            else
                echo "Za liczbę b nie została podana liczba tylko $b"
                continue
            fi
            break
        else
            echo "Za liczbę a nie została podana liczba tylko $a"
        fi
    done

    case "$dz" in
        "+")
            wynik=$(echo "$a+$b" | bc -l)
            echo "wynik dodawania to ${wynik//./,}" #liczba zapisana z przecinkiem np. 2,500
            read -p "Naciśnij Enter, aby kontynuować lub wpisz q, aby wyjść: " wybor
            [[ "$wybor" == "q" ]] && exit

            ;;

        "-")
            wynik=$(echo "$a-$b" | bc -l)
            echo "wynik odejmowania to ${wynik//./,}" #liczba zapisana z przecinkiem np. 2,500
            read -p "Naciśnij Enter, aby kontynuować lub wpisz q, aby wyjść: " wybor
            [[ "$wybor" == "q" ]] && exit
            ;;

        "*")
            wynik=$(echo "$a*$b" | bc -l)
            echo "wynik mnożenia to ${wynik//./,}" #liczba zapisana z przecinkiem np. 2,500
            read -p "Naciśnij Enter, aby kontynuować lub wpisz q, aby wyjść: " wybor
            [[ "$wybor" == "q" ]] && exit
            ;;

        "/")
            wynik=$(echo "$a/$b" | bc -l)
            echo "wynik dzielenia to ${wynik//./,}" #liczba zapisana z przecinkiem np. 2,500
            read -p "Naciśnij Enter, aby kontynuować lub wpisz q, aby wyjść: " wybor
            [[ "$wybor" == "q" ]] && exit
            ;;

        *)
            echo "Nie ma takiego wyboru"
            read -p "Naciśnij Enter, aby kontynuować lub wpisz q, aby wyjść: " wybor
            [[ "$wybor" == "q" ]] && exit
            ;;
    esac
done
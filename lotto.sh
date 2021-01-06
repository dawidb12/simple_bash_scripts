#!/bin/bash

# Gra w totolotka. System losuje pięć losowych liczb z przedziału 1-60. Zadaniem gracza jest trafienie jak najwięcej liczb.

echo "Witamy w kolejnym losowaniu totolotka. Za moment maszyna wylosuje pięć kul."
echo "Twoim zadaniem jest trafienie jak najwięcej liczb."
echo ""

echo "Losuję kule"
echo -ne '##            \r'
sleep 1
echo -ne '## ##         \r'
sleep 1
echo -ne '## ## ##      \r'
sleep 1
echo -ne '## ## ## ##   \r'
sleep 1
echo -ne '## ## ## ## ##\r'
echo -ne '\n'

# Losuje liczb z przedziału 1-60 bez powtarzania (pętla), a z wylosowanych liczb tworzy tablicę
numbers=5    

array=$(for i in {1..60}; do
    echo $i
done | shuf | head -$numbers)

# Tablice konwertuje do jednej linii
lotto_array=($(echo -e $array))

read -p "Podaj pierwszą liczbę: " number_1
read -p "Podaj drugą liczbę: " number_2
read -p "Podaj trzecią liczbę: " number_3
read -p "Podaj czwartą liczbę: " number_4
read -p "Podaj piątą liczbę: " number_5

# Tworzy tablicę z typami gracza
my_array=($(echo -e $number_1 $number_2 $number_3 $number_4 $number_5))

# Jeśli typy użytkownika pokrywają się z komputerem, wpisze je w poniższą zmienną. Jeśli nie, string będzie pusty
results=`echo ${lotto_array[@]} ${my_array[@]} | tr ' ' '\n' | sort -n | uniq -d | tr '\n' ' '`

if [ -z "$results" ]; then
    echo "Przykro mi. Nie trafiłeś żadnej liczby."
    echo "Oto wylosowane liczby: ${lotto_array[@]}"
else
    echo "Udało Ci się! Oto trafione liczby: $results"
    echo "Oto wylosowane liczby: ${lotto_array[@]}"
fi
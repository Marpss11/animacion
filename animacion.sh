#!/bin/bash

# Definir los colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
MAGENTA='\033[0;35m'
CIAN='\033[0;36m'
REINICIAR='\033[0m'

# Número de columnas en la pantalla
columnas=$(tput cols)

# Número de filas en la pantalla
filas=$(tput lines)

# Crear un array para almacenar las posiciones de las cascadas
declare -a columna
for ((i=0; i<columnas; i++)); do
    columna[$i]=$((RANDOM % filas)) # Posición inicial aleatoria para cada columna
done

# Función para generar un carácter aleatorio
caracter_aleatorio() {
    local caracteres=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")")
    echo "${caracteres[$RANDOM % ${#caracteres[@]}]}"
}

# Iniciar la animación
while true; do
    for ((i=0; i<columnas; i++)); do
        color=$((RANDOM % 6))
        case $color in
            0) codigo_color=$ROJO ;;
            1) codigo_color=$VERDE ;;
            2) codigo_color=$AMARILLO ;;
            3) codigo_color=$AZUL ;;
            4) codigo_color=$MAGENTA ;;
            5) codigo_color=$CIAN ;;
        esac

        tput cup ${columna[$i]} $i
        echo -ne "${codigo_color}$(caracter_aleatorio)${REINICIAR}"

        ((columna[$i]++))
        if ((columna[$i] >= filas)); then
            columna[$i]=0
        fi
    done

    sleep 0.05
done

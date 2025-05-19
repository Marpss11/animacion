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
filas=$(tput líneas)

# Crear un array para almacenar las posiciones de las cascadas
declarar -a columna
para ((i=0; i<columnas; i++)); hacer
    columna[$i]=$((RANDOM % filas)) # Posición inicial aleatoria para cada columna
hecho

# Función para generar un carácter aleatorio
carácter aleatorio() {
    caracteres locales=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")")
    echo "${caracteres[$RANDOM % ${#caracteres[@]}]}"
}

# Iniciar la animación
mientras sea cierto; hacer
    # Para cada columna
    para ((i=0; i<columnas; i++)); hacer
        # Elegir un color aleatorio para cada carácter
        color=$((ALEATORIO % 6))
        caso $color en
            0) código_color=$ROJO ;;
            1) código_color=$VERDE ;;
            2) color_code=$AMARILLO ;;
            3) código_color=$AZUL ;;
            4) código_color=$MAGENTA ;;
            5) código_color=$CYAN ;;
        esac

        # Mueva el cursor a la posición correspondiente
        tput taza ${columna[$i]} $i

        # Imprimir carácter aleatorio en la fila correspondiente con un color aleatorio
        echo -ne "${código_de_color}$(carácter_aleatorio)${RESET}"

        # Actualizar la posición de la cascada
        ((columna[$i]++))
        if ((columna[$i] >= filas )); entonces
            columna[$i]=0 # Reiniciar la cascada cuando llega al final
        fi
    hecho

    # Pausar para hacer la animación fluida
    dormir 0.05
hecho

    # Pausar para hacer la animación fluida
    dormir 0.1
hecho
    # Pausar para hacer la animación fluida
    dormir 0.1
hecho

    # Pausar para hacer la animación fluida
    dormir 0.1
hecho
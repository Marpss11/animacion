#!/bin/bash

# Definir los colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Número de columnas en la pantalla
columnas=$(tput cols)

# Número de filas en la pantalla
filas=$(tput lines)

# Crear un array para almacenar las posiciones de las cascadas
declare -a columna
for ((i=0; i<columnas; i++)); do
    columna[$i]=$((RANDOM % filas))  # Posición inicial aleatoria para cada columna
done

# Función para generar un carácter aleatorio
random_char() {
    local caracteres=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")")
    echo "${caracteres[$RANDOM % ${#caracteres[@]}]}"
}

# Iniciar la animación
while true; do
    # Para cada columna
    for ((i=0; i<columnas; i++)); do
        # Elegir un color aleatorio para cada carácter
        color=$((RANDOM % 6))
        case $color in
            0) color_code=$ROJO ;;
            1) color_code=$VERDE ;;
            2) color_code=$AMARILLO ;;
            3) color_code=$AZUL ;;
            4) color_code=$MAGENTA ;;
            5) color_code=$CYAN ;;
        esac

        # Mover el cursor a la posición correspondiente
        tput cup ${columna[$i]} $i

        # Imprimir carácter aleatorio en la fila correspondiente con un color aleatorio
        echo -ne "${color_code}$(random_char)${RESET}"

        # Actualizar la posición de la cascada
        ((columna[$i]++))
        if (( columna[$i] >= filas )); then
            columna[$i]=0  # Reiniciar la cascada cuando llega al final
        fi
    done

    # Pausar para hacer la animación fluida
    sleep 0.05
done

    # Pausar para hacer la animación fluida
    sleep 0.1
done
    # Pausar para hacer la animación fluida
    sleep 0.1
done

    # Pausar para hacer la animación fluida
    sleep 0.1
done

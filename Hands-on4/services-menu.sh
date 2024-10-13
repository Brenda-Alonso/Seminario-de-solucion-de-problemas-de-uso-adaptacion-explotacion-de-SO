#!/bin/bash

mostrar_menu() {
    echo "-----------------------------------"
    echo "    Menú de Servicios"
    echo "-----------------------------------"
    echo "1) Listar el contenido de un fichero (carpeta)"
    echo "2) Crear un archivo de texto con una línea de texto"
    echo "3) Comparar dos archivos de texto"
    echo "4) Mostrar ejemplo del uso del comando 'awk'"
    echo "5) Mostrar ejemplo del uso del comando 'grep'"
    echo "6) Salir"
}


listar_contenido() {
    echo -n "Introduce la ruta absoluta de la carpeta o archivo: "
    read ruta
    if [ -d "$ruta" ]; then
        echo "El contenido de la carpeta es:"
        ls -l "$ruta"
    elif [ -f "$ruta" ]; then
        echo "El contenido del archivo es:"
        cat "$ruta"
    else
        echo "La ruta introducida no existe o no es válida."
    fi
}


crear_archivo() {
    echo -n "Introduce el nombre del archivo a crear (con ruta completa): "
    read archivo
    echo -n "Introduce el texto que quieres guardar en el archivo: "
    read texto
    echo "$texto" > "$archivo"
    echo "Archivo '$archivo' creado con éxito."
}


comparar_archivos() {
    echo -n "Introduce la ruta del primer archivo: "
    read archivo1
    echo -n "Introduce la ruta del segundo archivo: "
    read archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
        if [ $? -eq 0 ]; then
            echo "Los archivos son iguales."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no existen."
    fi
}


ejemplo_awk() {
    echo "Ejemplo de uso de 'awk':"
    echo "Formato: awk '{print \$n}' archivo.txt"
    echo "Esto muestra la columna n del archivo."
    echo "Introduce el nombre del archivo para mostrar la primera columna:"
    read archivo
    if [ -f "$archivo" ]; then
        awk '{print $1}' "$archivo"
    else
        echo "El archivo no existe."
    fi
}


ejemplo_grep() {
    echo "Ejemplo de uso de 'grep':"
    echo "Formato: grep 'patrón' archivo.txt"
    echo "Esto busca una cadena en el archivo."
    echo -n "Introduce el patrón a buscar: "
    read patron
    echo -n "Introduce el nombre del archivo donde buscar el patrón: "
    read archivo
    if [ -f "$archivo" ]; then
        grep "$patron" "$archivo"
    else
        echo "El archivo no existe."
    fi
}


while true; do
    mostrar_menu
    echo -n "Selecciona una opción: "
    read opcion
    case $opcion in
        1)
            listar_contenido
            ;;
        2)
            crear_archivo
            ;;
        3)
            comparar_archivos
            ;;
        4)
            ejemplo_awk
            ;;
        5)
            ejemplo_grep
            ;;
        6)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
done

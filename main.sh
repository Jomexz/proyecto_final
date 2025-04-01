#!/bin/bash
# Menú interactivo principal del proyecto

# Archivo de log para registrar actividad 
ACTIVITY_LOG="./logs/actividad.log"

log_activity() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$ACTIVITY_LOG"
}

while true; do
    clear
    echo "======================================"
    echo "       Proyecto Final - Menú          "
    echo "======================================"
    echo "1. Crear estructura de usuarios y permisos"
    echo "2. Generar y analizar logs"
    echo "3. Crear backup de directorios críticos (simulado)"
    echo "4. Mostrar espacio disponible en disco"
    echo "5. Limpiar archivos temporales viejos"
    echo "6. Salir"
    echo "======================================"
    read -p "Seleccione una opción [1-6]: " option

    case $option in
        1)
            log_activity "Iniciando creación de usuarios y permisos."
            bash scripts/usuarios.sh
            read -p "Presione [Enter] para continuar..."
            ;;
        2)
            log_activity "Generando y analizando logs."
            bash scripts/logs.sh
            read -p "Presione [Enter] para continuar..."
            ;;
        3)
            log_activity "Iniciando backup simulado."
            if [ ! -d /tmp/empresa ]; then
                echo "El directorio /tmp/empresa no existe. Por favor, ejecute la opción 1 para crear la estructura."
            else
                TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
                DEST="respaldo/backup_$TIMESTAMP"
                mkdir -p "$DEST"
                cp -r /tmp/empresa "$DEST/"
                echo "Backup realizado en $DEST"
            fi
            read -p "Presione [Enter] para continuar..."
            ;;
        4)
            log_activity "Mostrando espacio en disco."
            df -h
            read -p "Presione [Enter] para continuar..."
            ;;
        5)
            log_activity "Limpieza de archivos temporales viejos."
            echo "Archivos temporales eliminados (archivos en /tmp con más de 7 días):"
            find /tmp -type f -mtime +7 -exec rm -f {} \; -print 2>/dev/null
            read -p "Presione [Enter] para continuar..."
            ;;
        6)
            log_activity "Finalizando ejecución del menú."
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, intente de nuevo."
            sleep 2
            ;;
    esac
done

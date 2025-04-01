#!/bin/bash

# Archivo de log
LOG_FILE="../logs/eventos.log"

# Generar 30 entradas de log aleatorias
generar_logs() {
    echo "Generando logs en $LOG_FILE..."
    > "$LOG_FILE" # Limpiar archivo antes de escribir
    for i in {1..30}; do
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
        EVENTOS=("INFO Sistema operativo actualizado" \
                 "WARNING Memoria RAM al 90%" \
                 "ERROR Falla en el servicio Apache" \
                 "LOGIN Usuario admin1 inició sesión" \
                 "LOGIN Usuario tecnico1 inició sesión" \
                 "LOGIN Usuario auditor1 inició sesión" \
                 "BACKUP Respaldo completado exitosamente")
        EVENTO=${EVENTOS[$RANDOM % ${#EVENTOS[@]}]}
        echo "$TIMESTAMP $EVENTO" >> "$LOG_FILE"
    done
    echo "Logs generados."
}

# Analizar logs
analizar_logs() {
    echo "\n[Análisis de Logs]"
    echo "Total de errores: $(grep -c 'ERROR' "$LOG_FILE")"
    echo "\nÚltimos 5 errores:"
    grep 'ERROR' "$LOG_FILE" | tail -5
    echo "\nMensajes más frecuentes:"
    cut -d' ' -f3- "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
    echo "\nUsuarios con más actividad:"  
    grep 'LOGIN' "$LOG_FILE" | awk '{print $4}' | sort | uniq -c | sort -nr
}

# Menú
case "$1" in
    generar)
        generar_logs
        ;;
    analizar)
        analizar_logs
        ;;
    *)
        echo "Uso: $0 {generar|analizar}"
        exit 1
        ;;
esac
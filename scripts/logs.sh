#!/bin/bash

# Variables globales
LOG_DIR="../logs"
LOG_FILE="$LOG_DIR/eventos.log"
ACTIVITY_LOG="$LOG_DIR/actividad.log"
USERS=("admin1" "tecnico1" "auditor1")
EVENTOS=("INFO Sistema operativo actualizado" "WARNING Memoria RAM al 90%" \
        "ERROR Falla en el servicio Apache" "LOGIN Usuario admin1 inicio sesion" \
        "LOGIN Usuario tecnico1 inicio sesion" "LOGIN Usuario auditor1 inicio sesion" \
        "BACKUP Respaldocompletado exitosamente")

# Crear directorios si no existen
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
    chmod 755 "$LOG_DIR"
fi

# Funcion para generar logs
generar_logs () {
        echo "Generando los en $LOG_FILE..." | tee -a "$ACTIVITY_LOG"
        > "$LOG_FILE" #Limpiar archivo antes de escribir
        for i in {1..30}; do
            TIMESTAMP=$(date"+%Y-%m-%d %H:%M:%S")
            EVENTO=${EVENTOS[RANDOM % &{#EVENTOS[@]}]}
            echo "%TIMESTAMP $EVENO" >> "LOG_FILE"
        done
        chmod 644 "$LOG_FILE"
        echo "Logs generados correctamente." | tee -a "ACTIVITY_LOG"
}

# Funcion para analizar logs
analizar_logs() {
    echo "\n[Analisis de Logs]" | tee -a "$ACTIVITY_LOG"
    echo "Total de errores: $(grep -c 'ERROR' "$LOG_FILE")" | tee -a "$ACTIVITY_LOG"
    echo "\nÚltimos 5 errores:" | tee -a "$ACTIVITY_LOG"
    grep 'ERROR' "$LOG_FILE" | tail -5 | tee -a "$ACTIVITY_LOG"
    echo "\nMensajes más frecuentes:" | tee -a "$ACTIVITY_LOG"
    cut -d' ' -f3- "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | tee -a "$ACTIVITY_LOG"
    echo "\nUsuarios con más actividad:" | tee -a "$ACTIVITY_LOG"
    grep 'LOGIN' "$LOG_FILE" | awk '{print $4}' | sort | uniq -c | sort -nr | tee -a "$ACTIVITY_LOG"
}

# Configurar permisos especiales
    configurar_permisos() {
        chmod 640 "$LOG_FILE"
        chmod 640 "$ACTIVITY_LOG"
        chown root:root "$LOG_FILE" "$ACTIVITY_LOG"
        setfacl -m u:auditor1:r "$LOG_FILE"
        echo "Permisos configurados correctamente en los archivos del log." | tee -a "$ACTIVITY_LOG"
    }

# Menu de opciones
case "$1" in
    generar)
        generar_logs
        ;;
    analizar)
        analizar_logs
        ;;
    permisos)
        configurar_permisos
        ;;
    *)
        echo "Usi: $0 {generar|analizaar|permisos}" | tee -a "$ACTIVITY_LOG"
        exit 1
        ;;
    esac
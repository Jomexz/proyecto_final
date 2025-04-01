# Proyecto Final: Automatización y Administración de Sistemas en Bash (WSL2)

## Descripción del Proyecto
Este proyecto tiene como objetivo automatizar tareas de mantenimiento en una empresa ficticia llamada **CEFEM**. Se desarrollaron scripts en Bash para:
- Gestionar usuarios, grupos y permisos.
- Simular y analizar logs del sistema.
- Automatizar tareas de backup, monitoreo y limpieza.
- Utilizar un menú interactivo para acceder a todas las funcionalidades.

## Estructura del proyecto
proyecto_final/
├── main.sh
├── scripts/
│   ├── usuarios.sh
│   └── logs.sh
├── logs/
│   ├── eventos.log
│   ├── informe_eventos.txt
│   └── actividad.log
├── respaldo/
├── usuarios/
│   └── estructura.txt
└── README.md

## Consideraciones antes de ejecutar el proyecto
Primero de todo tenemos que arrancar con permisos elevados "administrador:root"
sudo su 
A continuación escribimos la contraseña de nuestro usuario administrador:root y seguimos con los pasos siguientes

Este proyecto contiene scripts que utilizan funcionalidades que requieren permisos elevados. Deberemos ejecutar los siguientes comandos antes de empezar (desde la raiz del proyecto mismo):

chown -R $(whoami):$(whoami) .

O si lo queremos ejecutar con rutas absolutas:

chown -R $(whoami):$(whoami) /ruta/al/proyecto_final

Además, el proyecto fue configurado desde un entorno Windows, por lo que puede ser necesario pasar a formato UNIX los scripts:
apt install dos2unix -y
dos2unix main.sh && dos2unix scripts/usuarios.sh && dos2unix scripts/logs.sh

Para probar el proyecto deberemos ejecutar, desde la raiz del proyecto el siguiente comando:

./main.sh

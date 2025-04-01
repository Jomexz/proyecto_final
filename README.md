# Proyecto Final: Automatización y Administración de Sistemas en Bash (WSL2)

## Descripción del Proyecto
Este proyecto tiene como objetivo automatizar tareas de mantenimiento en una empresa ficticia llamada **CEFEM**. Se desarrollaron scripts en Bash para:
- Gestionar usuarios, grupos y permisos.
- Simular y analizar logs del sistema.
- Automatizar tareas de backup, monitoreo y limpieza.
- Utilizar un menú interactivo para acceder a todas las funcionalidades.

## Consideraciones antes de ejecutar el proyecto
Este proyecto contiene scripts que utilizan funcionalidades que requieren permisos elevados. Deberemos ejecutar los siguientes comandos antes de empezar (desde la raiz del proyecto mismo):

sudo chown -R $(whoami):$(whoami) .

O si lo queremos ejecutar con rutas absolutas:

sudo chown -R $(whoami):$(whoami) /ruta/al/proyecto_final

Además, el proyecto fue configurado desde un entorno Windows, por lo que puede ser necesario pasar a formato UNIX los scripts:

dos2unix main.sh && dos2unix scripts/usuarios.sh && dos2unix scripts/logs.sh
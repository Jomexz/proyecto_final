#Script para añadir los usuarios
#!/bin/bash

# Crear grupos, de esta manera si tienen fallos no devuelve errores si estan ya creados
sudo groupadd administracion 2>/dev/null
sudo groupadd tecnicos 2>/dev/null

echo "Grupos creados: administracion, tecnicos"

# Crear usuarios y asignarlos a grupos y oculta posibles errores 
sudo useradd -m -G administracion admin1 2>/dev/null
sudo useradd -m -G tecnicos tecnico1 2>/dev/null
sudo useradd -m auditor1 2>/dev/null

echo "Usuarios creados: admin1, tecnico1, auditor1"

# Crear directorios -p no saca errores si ya estan creados los directorios
sudo mkdir -p /tmp/empresa/admin/
sudo mkdir -p /tmp/empresa/tecnicos/
sudo mkdir -p /tmp/empresa/compartido/

echo "Directorios creados en /tmp/empresa/"

# Aplicar permisos especiales
sudo chmod 4755 /tmp/empresa/admin/   # SetUID
sudo chmod 2775 /tmp/empresa/tecnicos/  # SetGID
sudo chmod 1777 /tmp/empresa/compartido/ # Sticky Bit

echo "Permisos especiales aplicados a los directorios"

# Asignar permisos específicos a auditor1 para que lea de la carpeta admin solo el fichero datosempresa.txt
sudo touch /tmp/empresa/admin/datosempresa.txt
sudo setfacl -m u:auditor1:r /tmp/empresa/admin/datosempresa.txt

echo "Permisos ACL asignados a auditor1 para acceso a datosempresa.txt"

# Guardar información en usuarios.txt
echo "Usuarios creados:" > usuarios/usuarios.txt
echo "- admin1 (Grupo: administracion)" >> usuarios/usuarios.txt
echo "- tecnico1 (Grupo: tecnicos)" >> usuarios/usuarios.txt
echo "- auditor1 (Grupo: Ninguno, acceso específico con ACLs)" >> usuarios/usuarios.txt

echo "\nGrupos creados:" >> usuarios/usuarios.txt
echo "- administracion" >> usuarios/usuarios.txt
echo "- tecnicos" >> usuarios/usuarios.txt

echo "\nEstructura de directorios:" >> usuarios/usuarios.txt
echo "- /tmp/empresa/admin/ (SetUID aplicado)" >> usuarios/usuarios.txt
echo "- /tmp/empresa/tecnicos/ (SetGID aplicado)" >> usuarios/usuarios.txt
echo "- /tmp/empresa/compartido/ (Sticky Bit aplicado)" >> usuarios/usuarios.txt

echo "\nPermisos adicionales:" >> usuarios/usuarios.txt
echo "- auditor1 tiene acceso específico a datosempresa.txt mediante setfacl." >> usuarios/usuarios.txt

echo "Información guardada en usuarios/usuarios.txt"
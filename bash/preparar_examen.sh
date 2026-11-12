#!/bin/bash
# Prepara la carpeta ~/examen con los ficheros de trabajo del examen de ASO (UT1 y UT2)
dir=~/examen
mkdir -p "$dir"

# Ficheros del modelo A
cat > "$dir/solicitudes.txt" <<'FIN'
jperez:/bin/bash
mgarcia:/bin/sh
Ana23:/bin/bash
root:/bin/bash
lu:/bin/bash
tcortes:/bin/zsh
rmartinez99:/bin/bash
sruiz2:/bin/sh
FIN

cat > "$dir/sshd_config" <<'FIN'
# Fichero de configuración del servidor SSH (copia de trabajo)

Include /etc/ssh/sshd_config.d/*.conf

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0

# Autenticación:
#LoginGraceTime 2m
#PermitRootLogin prohibit-password
#MaxAuthTries 6
#MaxSessions 10

#PubkeyAuthentication yes

# Para desactivar las contraseñas en texto claro, cambia a no
#PasswordAuthentication yes
#PermitEmptyPasswords no

KbdInteractiveAuthentication no
UsePAM yes

X11Forwarding yes
PrintMotd no

AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
FIN

# Ficheros del modelo B
cat > "$dir/accesos.txt" <<'FIN'
backup:192.168.1.10
www-data:10.0.0.5
games:10.0.0.7
nobody:172.16.0
jperez:192.168.1.20
Mail:192.168.1.30
daemon:192.168.1.40a
man:10.1.1.1
FIN

cat > "$dir/journald.conf" <<'FIN'
# Configuración del registro del sistema (copia de trabajo)
# Las líneas comentadas muestran el valor por defecto.

[Journal]
#Storage=auto
#Compress=yes
#Seal=yes
#SplitMode=uid
#SyncIntervalSec=5m
#RateLimitIntervalSec=30s
#RateLimitBurst=10000
#SystemMaxUse=
#SystemKeepFree=
#SystemMaxFileSize=
#MaxRetentionSec=
#MaxFileSec=1month
#ForwardToSyslog=no
FIN

echo "Ficheros preparados en $dir:"
ls -l "$dir"

#!/bin/bash

# AutoCloudPC OS - Script de inicialización de PRoot
# Este script configura el entorno aislado para ejecutar Wine y Box64

ROOTFS_DIR="/data/data/com.autocloudpc.os/files/usr"
WINE_PREFIX="/data/data/com.autocloudpc.os/files/wine"

echo "Iniciando entorno AutoCloudPC OS..."

# 1. Configurar variables de entorno para Box64
export BOX64_DYNAREC_CACHEPATH="/data/data/com.autocloudpc.os/files/cache/box64"
export BOX64_DYNAREC_STRONGMEM=1
export BOX64_LOG=1

# 2. Configurar servidor gráfico (Termux-X11)
export DISPLAY=:0
export PULSE_SERVER=127.0.0.1

# 3. Lanzar PRoot con el sistema Debian minimalista
proot -0 -r $ROOTFS_DIR \
    -b /dev -b /proc -b /sys \
    -b /sdcard -b /storage \
    -w /root \
    /usr/bin/env -i \
    HOME=/root \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    DISPLAY=$DISPLAY \
    /bin/bash -c "source /etc/profile && openbox --replace & tint2 & pcmanfm --desktop &"

echo "Entorno listo. Disfruta de AutoCloudPC OS."

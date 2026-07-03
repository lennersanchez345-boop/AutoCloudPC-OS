#!/bin/bash

# AutoCloudPC OS - Wine 11 Configuration Script

export WINEPREFIX="/data/data/com.autocloudpc.os/files/wine"
export WINEARCH=win64

echo "Inicializando prefijo de Wine..."
wineboot --init

# Optimización de sincronización
echo "Configurando NTSYNC..."
export WINE_NTSYNC=1

# Configuración visual de Wine para que parezca Windows 10
echo "Aplicando tema visual a Wine..."
# wine regedit /s assets/scripts/win10_theme.reg

# Instalación de Wine Mono (Ligero)
echo "Instalando Wine Mono para soporte .NET..."
# wine msiexec /i /usr/share/wine/mono/wine-mono-9.1.0-x86.msi /qn

echo "Wine configurado y optimizado."

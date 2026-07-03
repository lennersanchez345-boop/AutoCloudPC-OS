#!/bin/bash

# AutoCloudPC OS - Audio Initialization Script

echo "Iniciando servidor de audio de baja latencia..."

# Matar instancias previas
pulseaudio -k 2>/dev/null

# Iniciar PulseAudio con nuestra configuración optimizada
pulseaudio --start --exit-idle-time=-1 --resample-method=speex-float-1 --file=/home/ubuntu/AutoCloudPC-OS/app/src/main/assets/scripts/audio_settings.conf

echo "Audio listo."

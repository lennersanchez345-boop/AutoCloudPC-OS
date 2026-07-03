#!/bin/bash

# AutoCloudPC OS - GPU Optimization & Driver Selection
# Este script detecta el hardware y aplica el mejor driver disponible

GPU_TYPE=$(getprop ro.hardware.egl)

echo "Detectando GPU: $GPU_TYPE"

if [[ "$GPU_TYPE" == *"adreno"* ]]; then
    echo "Optimizando para Adreno (Snapdragon)..."
    export MESA_LOADER_DRIVER_OVERRIDE=zink
    export TU_DEBUG=sysmem
    export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/freedreno_icd.aarch64.json
elif [[ "$GPU_TYPE" == *"mali"* ]]; then
    echo "Optimizando para Mali (MediaTek/Exynos)..."
    export MESA_LOADER_DRIVER_OVERRIDE=virgl
    export GALLIUM_DRIVER=virpipe
else
    echo "GPU genérica detectada. Usando VirGL por defecto."
    export MESA_LOADER_DRIVER_OVERRIDE=virgl
fi

# Configuración de DXVK (DirectX a Vulkan)
export DXVK_HUD=fps
export DXVK_ASYNC=1
export DXVK_STATE_CACHE=1
export DXVK_STATE_CACHE_PATH=/data/data/com.autocloudpc.os/files/cache/dxvk

echo "Aceleración gráfica configurada."

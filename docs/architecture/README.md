# Arquitectura Técnica de la APK AutoCloudPC OS

Este directorio contiene los detalles de implementación de la capa Android para el proyecto.

## Componentes de la Etapa 1
1. **AndroidManifest.xml**: Configurado con permisos de alto nivel para permitir la emulación de archivos en `/sdcard` y mantener el proceso vivo.
2. **Scripts de Assets**: `init_proot.sh` es el punto de entrada que configura las variables de optimización de Box64 y lanza el entorno gráfico.
3. **Estructura Java**: Preparada para recibir la lógica de `MainActivity` y `EmulationService`.

## Flujo de Inicio
1. El usuario abre la APK.
2. `MainActivity` verifica si el `rootfs` está instalado.
3. Si no, lo extrae de los assets.
4. Lanza el `EmulationService` que ejecuta el script de PRoot.
5. Se inicia el servidor X11 y se muestra la interfaz de Windows 10.

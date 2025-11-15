# SDDM Personal - Temas Personalizados

Repositorio que contiene temas personalizados para SDDM (Simple Display Desktop Manager), desarrollados y mantenidos por Migbertweb.

## 📋 Descripción

Este repositorio incluye dos temas personalizados de SDDM:

### 🎨 sddm-canaima
Tema basado en [SilentSDDM](https://github.com/uiriansan/SilentSDDM), altamente personalizable con soporte para:
- Fondos animados (videos)
- Pantalla de bloqueo y pantalla de inicio de sesión separadas
- Múltiples presets de configuración (Canaima, Catppuccin, etc.)
- Teclado virtual integrado
- Efectos de desenfoque y ajustes de brillo/saturación
- Más de 200 opciones de personalización

### 🌿 sddm-inspiration
Tema basado en [Eucalyptus Drop](https://github.com/MarianArlt/sddm-eucalyptus-drop), enfocado en:
- Experiencia de usuario sencilla y funcional
- Alto grado de personalización
- Soporte para múltiples orientaciones de pantalla
- Efectos de desenfoque configurables
- Interfaz limpia y moderna

## 📦 Requisitos

### Para sddm-canaima:
- SDDM ≥ 0.21.0
- Qt ≥ 6.5
- qt6-svg
- qt6-virtualkeyboard
- qt6-multimedia

### Para sddm-inspiration:
- SDDM ≥ 0.21.0
- Qt6 (incluyendo Qt5 Compatibility Module)
- Qt SVG

## 🚀 Instalación

### Instalación Manual

1. Clona este repositorio:
```bash
git clone https://github.com/migbertweb/sddm-personal.git
cd sddm-personal
```

2. Para instalar **sddm-canaima**:
```bash
cd sddm-canaima
sudo mkdir -p /usr/share/sddm/themes/silent
sudo cp -rf . /usr/share/sddm/themes/silent/
```

3. Para instalar **sddm-inspiration**:
```bash
cd sddm-inspiration
sudo mkdir -p /usr/share/sddm/themes/eucalyptus-drop
sudo cp -rf . /usr/share/sddm/themes/eucalyptus-drop/
```

4. Configura SDDM editando `/etc/sddm.conf`:

Para **sddm-canaima**:
```ini
[General]
InputMethod=qtvirtualkeyboard
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard

[Theme]
Current=silent
```

Para **sddm-inspiration**:
```ini
[Theme]
Current=eucalyptus-drop
```

5. Prueba el tema antes de reiniciar:
```bash
# Para sddm-canaima
cd /usr/share/sddm/themes/silent
./test.sh

# Para sddm-inspiration
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/eucalyptus-drop
```

## ⚙️ Personalización

### sddm-canaima

Los archivos de configuración se encuentran en `sddm-canaima/configs/`. Para cambiar el preset activo, edita `sddm-canaima/metadata.desktop` y modifica la línea `ConfigFile=`:

```ini
ConfigFile=configs/canaima.conf
```

Puedes crear tu propio archivo de configuración. Consulta la [guía de personalización](https://github.com/uiriansan/SilentSDDM/wiki/Customizing) para ver todas las opciones disponibles.

### sddm-inspiration

Edita el archivo `sddm-inspiration/theme.conf` para personalizar colores, imágenes, formatos de fecha/hora y apariencia general.

## 📁 Estructura del Repositorio

```
sddm-personal/
├── README.md                 # Este archivo
├── LICENSE                   # Licencia MIT
├── sddm-canaima/            # Tema Canaima
│   ├── Main.qml             # Archivo principal QML
│   ├── components/          # Componentes QML
│   ├── configs/             # Archivos de configuración
│   ├── backgrounds/         # Fondos e imágenes
│   ├── icons/               # Iconos del tema
│   ├── docs/                # Documentación
│   └── scripts/             # Scripts de utilidad
└── sddm-inspiration/        # Tema Inspiration
    ├── Main.qml             # Archivo principal QML
    ├── Components/          # Componentes QML
    ├── Backgrounds/         # Fondos
    ├── Assets/              # Recursos
    └── theme.conf           # Archivo de configuración
```

## 🛠️ Scripts de Utilidad

### sddm-canaima

- `test.sh`: Prueba el tema sin reiniciar el sistema
- `change_avatar.sh`: Cambia el avatar de un usuario
- `backgrounds/extract_first_frame.sh`: Extrae el primer frame de un video para usar como placeholder

## 📝 Licencia

Este proyecto está licenciado bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

**Nota especial**: Se recomienda encarecidamente (aunque no es obligatorio) que las obras derivadas mantengan este mismo espíritu de código libre y abierto, especialmente cuando se utilicen con fines educativos o de investigación.

## 👤 Autor

**Migbertweb**

- Repositorio: https://github.com/migbertweb/sddm-personal

## 🙏 Agradecimientos

### sddm-canaima
- [SilentSDDM](https://github.com/uiriansan/SilentSDDM) - Tema base
- [Keyitdev/sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme) - Inspiración y referencia de código
- [Match-Yang/sddm-deepin](https://github.com/Match-Yang/sddm-deepin) - Inspiración y referencia de código

### sddm-inspiration
- [Eucalyptus Drop](https://github.com/MarianArlt/sddm-eucalyptus-drop) - Tema base
- [SDDM Sugar Candy](https://github.com/MarianArlt/sddm-sugar-candy) - Tema original

## ⚠️ Advertencias

- **Siempre prueba el tema antes de reiniciar** usando los scripts de prueba proporcionados
- Asegúrate de tener una versión compatible de SDDM (≥ 0.21.0)
- Mantén una copia de seguridad de tu configuración actual de SDDM antes de instalar nuevos temas

## 📞 Soporte

Si encuentras algún problema o tienes sugerencias, por favor abre un issue en el repositorio.

---

**Nota**: Este proyecto usa Licencia MIT. Se recomienda (no obliga) mantener derivados como código libre, especialmente para fines educativos.

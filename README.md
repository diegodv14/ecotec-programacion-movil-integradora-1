# 📱 Catálogo de Productos — Mi Primera Aplicación en Flutter

Actividad Integradora 1 — Programación de Aplicaciones Móviles — Ecotec

## 1. Objetivo

Desarrollar una aplicación básica en Flutter que demuestre la creación de un proyecto, el uso de widgets iniciales, la ejecución en un emulador Android, la instalación de un paquete externo y la publicación del proyecto en GitHub.

## 2. Tema elegido

**Catálogo de Productos**: una app que muestra una lista de productos de una tienda ficticia, cada uno con ícono, nombre, descripción y precio, con la posibilidad de marcarlos como favoritos y de mostrar/ocultar un bloque de ofertas especiales.

## 3. Tecnologías utilizadas

- Flutter SDK
- Dart
- Visual Studio Code (extensiones Flutter y Dart)
- Android Studio (para el emulador Android / AVD Manager)
- Paquete externo: **google_fonts** (`^6.2.1`)
- Git y GitHub

## 4. Estructura del proyecto

```
catalogo_productos/
├── lib/
│   └── main.dart          # Código principal de la app
├── android/                # Generado por Flutter (flutter create .)
├── capturas/                # Evidencias (screenshots) pedidas en la rúbrica
├── pubspec.yaml             # Dependencias del proyecto (incluye google_fonts)
├── analysis_options.yaml
├── .gitignore
└── README.md                 # Este archivo
```

## 5. Pasos seguidos para crear el proyecto

### 5.1 Instalación del entorno

1. Descargar e instalar el **Flutter SDK** desde https://docs.flutter.dev/get-started/install/windows y agregarlo al PATH del sistema.
2. Instalar **Android Studio** (incluye Android SDK) y, desde el *Device Manager* / *AVD Manager*, crear un emulador Android (por ejemplo, Pixel 6, API 33+).
3. Instalar **Visual Studio Code** y agregar las extensiones **Flutter** y **Dart** desde el marketplace.
4. Verificar que todo esté correctamente instalado ejecutando en la terminal:

   ```bash
   flutter doctor
   ```

   > 📸 Captura pendiente: `capturas/01_flutter_doctor.png`

### 5.2 Creación del proyecto

Este repositorio ya incluye el código fuente (`lib/main.dart`) y `pubspec.yaml`. Para generar los archivos nativos de cada plataforma (Android, iOS, etc.) que Flutter necesita para compilar, dentro de la carpeta `catalogo_productos` se ejecutó:

```bash
flutter create .
```

Esto genera automáticamente las carpetas `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/` **sin sobrescribir** el `lib/main.dart` ni el `pubspec.yaml` ya existentes.

> 📸 Captura pendiente: `capturas/02_proyecto_en_vscode.png` (proyecto abierto en VS Code)

### 5.3 Instalación del paquete externo

Se instaló el paquete [`google_fonts`](https://pub.dev/packages/google_fonts), que permite aplicar tipografías personalizadas de Google Fonts (en este caso, **Poppins**) a los textos de la aplicación:

```bash
flutter pub add google_fonts
flutter pub get
```

Esto agrega la línea `google_fonts: ^6.2.1` a `pubspec.yaml` (ya incluida en este repositorio).

> 📸 Capturas pendientes:
> - `capturas/03_instalacion_paquete.png` (terminal ejecutando `flutter pub add google_fonts`)
> - `capturas/04_pubspec_yaml.png` (pubspec.yaml con el paquete agregado)

### 5.4 Ejecución en el emulador

1. Abrir el emulador Android desde Android Studio (AVD Manager) o con `flutter emulators --launch <id>`.
2. Ejecutar la app:

   ```bash
   flutter run
   ```

> 📸 Capturas pendientes:
> - `capturas/05_emulador_funcionando.png` (emulador abierto)
> - `capturas/06_app_en_emulador.png` (app corriendo en el emulador)

## 6. Descripción de la pantalla principal

La pantalla principal (`CatalogoHomePage`, en `lib/main.dart`) incluye:

- `MaterialApp` y `Scaffold` como estructura base.
- `AppBar` con título personalizado y color propio (`#6C63FF`).
- Un encabezado (`Container`) con texto de bienvenida y un texto informativo.
- Un `ElevatedButton` ("Ver ofertas" / "Ocultar ofertas") que **muestra u oculta** un bloque de ofertas especiales.
- Una lista de productos construida con `ListView.builder`, donde cada producto se muestra en una `Card` que combina `Row` y `Column`, con un ícono dentro de un `Container` de color personalizado.
- Un botón de favorito (`IconButton` con ícono de corazón) en cada producto que:
  - Cambia de color/ícono al presionarlo (favorito / no favorito).
  - Actualiza un contador de favoritos en la parte superior.
  - Muestra un mensaje (`SnackBar`) confirmando la acción.
- Colores personalizados en toda la interfaz (`#6C63FF`, `#00BFA6`, `#FF6584`, `#FFA726`, `#42A5F5`, `#8D6E63`).
- Tipografía personalizada mediante el paquete **google_fonts** (familia *Poppins*).

## 7. Interacción básica

Existen dos interacciones principales, ambas cumpliendo el requisito de "acción sencilla":

1. **Botón "Ver ofertas / Ocultar ofertas"**: muestra u oculta un bloque de texto con una promoción.
2. **Botón de favorito (❤) en cada producto**: alterna el estado de favorito, actualiza el contador de favoritos y muestra un mensaje emergente (`SnackBar`).

> 📸 Captura pendiente: `capturas/07_boton_funcionando.png` (antes/después de presionar el botón)
> 📸 Captura pendiente: `capturas/08_uso_paquete_google_fonts.png` (evidencia visual de la tipografía aplicada)

## 8. Publicación en GitHub

Repositorio: https://github.com/diegodv14/ecotec-programacion-movil-integradora-1

Pasos ejecutados (dentro de la carpeta `catalogo_productos`):

```bash
git init
git add README.md
git commit -m "docs: agregar README con la documentación del proyecto"

git add pubspec.yaml
git commit -m "chore: configurar pubspec.yaml y agregar dependencia google_fonts"

git add lib/main.dart
git commit -m "feat: crear pantalla principal con catálogo de productos e interacción"

git add .
git commit -m "chore: agregar archivos generados por flutter create y assets del proyecto"

git branch -M main
git remote add origin https://github.com/diegodv14/ecotec-programacion-movil-integradora-1.git
git push -u origin main
```

> ✅ El historial cuenta con un mínimo de 4 commits, tal como pide la rúbrica.

> 📸 Captura pendiente: `capturas/09_repositorio_github.png` (repositorio publicado en GitHub)

## 9. Evidencias (capturas)

Todas las capturas solicitadas por la rúbrica deben colocarse dentro de la carpeta `capturas/` con estos nombres sugeridos (ver `capturas/LEEME.txt` para el detalle):

- [ ] `01_flutter_doctor.png`
- [ ] `02_proyecto_en_vscode.png`
- [ ] `03_instalacion_paquete.png`
- [ ] `04_pubspec_yaml.png`
- [ ] `05_emulador_funcionando.png`
- [ ] `06_app_en_emulador.png`
- [ ] `07_boton_funcionando.png`
- [ ] `08_uso_paquete_google_fonts.png`
- [ ] `09_repositorio_github.png`

## 10. Autor

**Nombre completo:** Juan Diego Benavides Luna
Estudiante — Programación de Aplicaciones Móviles — Ecotec

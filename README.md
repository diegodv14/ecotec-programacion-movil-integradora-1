# Catálogo de Productos

Actividad Integradora 1 de Programación de Aplicaciones Móviles (Ecotec). Es una app hecha en Flutter que simula el catálogo de una tienda: se puede ver una lista de productos con foto, precio y descripción, marcarlos como favoritos, entrar al detalle de cada uno y mostrar/ocultar un banner de ofertas.

Autor: Juan Diego Benavides Luna

## Qué hace la app

- Lista de productos con foto real (traída de Picsum Photos), nombre, descripción corta y precio.
- Tocar un producto abre su pantalla de detalle, con la foto en grande y la descripción completa.
- Botón de favorito (❤) tanto en la lista como en el detalle; el contador de favoritos del encabezado se actualiza en tiempo real y se mantiene sincronizado entre las dos pantallas.
- Botón "Ver ofertas" que muestra/oculta un banner con una promoción.
- Tipografía Poppins en toda la app usando el paquete `google_fonts`.

## Tecnologías

Flutter + Dart, Android Studio (para el emulador), VS Code, y `google_fonts` (`^6.2.1`) como paquete externo. El repositorio se maneja con Git/GitHub.

## Estructura del proyecto

No dejé todo en un solo `main.dart`; lo separé un poco para que se entienda mejor qué hace cada parte:

```
lib/
├── main.dart                     # solo llama a runApp()
├── app/
│   └── catalogo_productos_app.dart   # MaterialApp + tema
├── theme/
│   └── app_colors.dart               # paleta de colores de la app
├── models/
│   └── producto.dart                 # clase Producto
├── data/
│   └── productos_data.dart           # lista de productos de ejemplo
├── screens/
│   ├── catalogo_home_page.dart       # pantalla principal (la lista)
│   └── producto_detail_page.dart     # pantalla de detalle
└── widgets/
    ├── catalogo_header.dart
    ├── oferta_banner.dart
    └── producto_card.dart
```

## Cómo se hizo (resumen)

1. Instalé el Flutter SDK y lo agregué al PATH, con Android Studio para el SDK de Android y el emulador.
2. Corrí `flutter create .` dentro de esta misma carpeta para que generara `android/`, `ios/`, `web/`, etc. sin tocar el `lib/main.dart` ni el `pubspec.yaml` que ya tenía.
3. Agregué el paquete `google_fonts` con `flutter pub add google_fonts`.
4. Probé la app en un emulador Android (Pixel, API 36) con `flutter run`.
5. Inicialicé el repo con `git init` y subí el proyecto a GitHub.

Un detalle que me costó resolver: la carpeta del proyecto está dentro de "Programación de Aplicaciones Moviles", y esa tilde en la "ó" hace que el compilador de shaders de Flutter (`impellerc`) falle en Windows al intentar escribir los assets — es un bug conocido con rutas no-ASCII. Lo resolví mapeando la carpeta a una unidad virtual sin acentos con `subst F: "ruta\del\proyecto"` y corriendo `flutter run` desde ahí.

## Interacciones principales

1. **Favorito**: tocar el corazón (en la lista o en el detalle) lo marca/desmarca, actualiza el contador de arriba y muestra un `SnackBar` de confirmación.
2. **Ver/ocultar ofertas**: el botón del encabezado alterna un bloque con una promoción.
3. **Ver detalle**: tocar cualquier parte de la tarjeta de un producto (menos el corazón) navega a su pantalla de detalle con `Navigator.push` y una transición `Hero` en la imagen.

## Repositorio

https://github.com/diegodv14/ecotec-programacion-movil-integradora-1

El historial de commits separa el proyecto en partes lógicas (README, dependencias, código fuente, archivos generados por Flutter, rediseño visual y la pantalla de detalle) en lugar de subir todo junto.

## Capturas

Van en la carpeta `capturas/` (ver `capturas/LEEME.txt` para los nombres exactos que pide la rúbrica): instalación de Flutter, el proyecto en VS Code, el emulador corriendo, la app funcionando, el uso del paquete externo y el repositorio ya en GitHub.

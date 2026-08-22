# Catálogo de Productos

**Actividad Integradora 1 - Programación de Aplicaciones Móviles - Ecotec**
**Juan Diego Benavides Luna**

Aplicación móvil desarrollada con Flutter para mostrar el catálogo de una tienda ficticia. La aplicación permite visualizar productos, consultar su información, marcarlos como favoritos y acceder a una sección de ofertas.

## Características

* Catálogo con 6 productos.
* Imagen, nombre, precio y descripción de cada producto.
* Sistema de favoritos.
* Contador de productos favoritos.
* Pantalla de detalle para cada producto.
* Transición animada entre el catálogo y el detalle mediante `Hero`.
* Banner de ofertas.
* Imágenes reales almacenadas dentro de `assets/images/`.
* Diseño personalizado con una paleta de tonos azul marino.
* Tipografía Poppins mediante el paquete `google_fonts`.

## Estructura del proyecto

```text
lib/
├── main.dart
├── app/
│   └── catalogo_productos_app.dart
├── theme/
│   └── app_colors.dart
├── models/
│   └── producto.dart
├── data/
│   └── productos_data.dart
├── screens/
│   ├── catalogo_home_page.dart
│   └── producto_detail_page.dart
└── widgets/
    ├── catalogo_header.dart
    ├── oferta_banner.dart
    └── producto_card.dart
```

### Descripción de las carpetas

* `app/`: configuración principal de la aplicación y del tema.
* `theme/`: colores utilizados en la interfaz.
* `models/`: modelo de datos para los productos.
* `data/`: información de los productos mostrados en el catálogo.
* `screens/`: pantallas principales de la aplicación.
* `widgets/`: componentes reutilizables de la interfaz.

## Tecnologías utilizadas

* **Flutter**
* **Dart**
* **Android Studio**
* **VS Code**
* **Google Fonts**
* **Git / GitHub**

El único paquete externo utilizado en la aplicación es [`google_fonts`](https://pub.dev/packages/google_fonts), empleado para aplicar la fuente **Poppins** en la interfaz.

## Instalación y ejecución

Para ejecutar el proyecto es necesario tener instalado Flutter y un dispositivo Android o un emulador configurado.

Primero se debe clonar el repositorio:

```bash
git clone https://github.com/diegodv14/ecotec-programacion-movil-integradora-1.git
cd ecotec-programacion-movil-integradora-1
```

Luego instalar las dependencias:

```bash
flutter pub get
```

Finalmente, ejecutar la aplicación:

```bash
flutter run
```

También se puede ejecutar desde VS Code seleccionando un dispositivo o emulador disponible.

## Desarrollo del proyecto

Para preparar el proyecto utilicé el SDK de Flutter, Android Studio para el SDK de Android y la creación del emulador, y VS Code como editor.

Para confirmar que el entorno quedó bien instalado corrí `flutter doctor` (ver `capturas/Ejecucion de Flutter Doctor.png`). Lo único que marca es un `[!]` en Visual Studio, porque le faltan componentes para compilar apps de escritorio Windows; eso no afecta este proyecto ya que solo se compila para Android, así que ese aviso se puede ignorar.

La estructura nativa de Flutter se generó utilizando:

```bash
flutter create .
```

Después agregué la dependencia de Google Fonts:

```bash
flutter pub add google_fonts
```

## Funcionamiento

La pantalla principal contiene la lista de productos y el estado de los favoritos.

Cuando se selecciona el corazón de un producto, se actualiza su estado como favorito. Esta misma lógica se utiliza tanto desde la pantalla principal como desde la pantalla de detalle, por lo que el contador de favoritos y los iconos permanecen sincronizados.

El botón de ofertas permite mostrar u ocultar un banner promocional dentro de la pantalla principal.

## Capturas

Las capturas de pantalla utilizadas para la entrega se encuentran dentro de:

```text
capturas/
```
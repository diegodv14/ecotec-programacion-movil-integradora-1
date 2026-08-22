# Catálogo de Productos

Actividad Integradora 1 - Programación de Aplicaciones Móviles - Ecotec
Juan Diego Benavides Luna

App en Flutter de un catálogo de tienda ficticia. Muestra productos con foto, precio y descripción, se pueden marcar como favoritos, tiene una pantalla de detalle para cada producto y un botón de "ofertas" que muestra un banner promocional.

## De qué se trata

La idea era simple: cumplir con lo que pide la rúbrica (proyecto Flutter, un paquete externo, correr en emulador, subir a GitHub) pero sin dejarlo tan plano. Además de la lista de productos con favoritos, le agregué:

- Una pantalla de detalle: al tocar un producto se abre su info completa con la foto más grande (con animación Hero).
- Fotos reales de cada producto en vez de solo íconos (están en `assets/images/`).
- Una paleta de colores propia, tonos azul marino en vez del morado que traía el ejemplo inicial.

El paquete externo que usé es `google_fonts`, para la tipografía Poppins en toda la app.

## Estructura de `lib/`

Al principio todo estaba en un solo `main.dart` (así lo dejé la primera vez para cumplir con el mínimo), pero después lo separé en carpetas porque se estaba volviendo difícil de leer:

```
lib/
  main.dart                   -> solo el runApp()
  app/catalogo_productos_app.dart   -> MaterialApp y tema
  theme/app_colors.dart             -> colores de la app
  models/producto.dart              -> clase Producto
  data/productos_data.dart          -> los 6 productos de ejemplo
  screens/
    catalogo_home_page.dart   -> pantalla principal
    producto_detail_page.dart -> pantalla de detalle
  widgets/
    catalogo_header.dart
    oferta_banner.dart
    producto_card.dart
```

## Pasos que seguí

Instalé el Flutter SDK (lo agregué al PATH manualmente porque no venía en un instalador), Android Studio para tener el SDK de Android y crear un emulador, y usé VS Code como editor.

Dentro de la carpeta del proyecto corrí `flutter create .` para que generara las carpetas nativas (`android/`, `ios/`, etc.) sin tocar el código que ya tenía. Después `flutter pub add google_fonts` y a probar en el emulador con `flutter run`.

Cosa random que me pasó y me tomó rato entender: como la carpeta de la materia tiene tilde ("Programación"), el compilador de shaders de Flutter (`impellerc`) tronaba en Windows al compilar - por lo visto es un problema conocido con rutas que no son puro ASCII. Lo arreglé mapeando la carpeta del proyecto a una unidad virtual con `subst F: "ruta"` y corriendo todo desde `F:\` en vez de la ruta con acentos. Si a alguien más le pasa lo mismo, es básicamente eso.

## Cómo funciona por dentro

El estado de favoritos y si se muestra el banner de ofertas vive en `CatalogoHomePage` (es un `StatefulWidget`). Cuando tocas el corazón de un producto, ya sea desde la lista o desde el detalle, se llama al mismo callback que actualiza ese estado, por eso el contador de arriba y el ícono del corazón siempre quedan sincronizados entre las dos pantallas.

Al tocar un producto (cualquier parte de la tarjeta menos el corazón) se abre `ProductoDetailPage` con `Navigator.push`, y la imagen usa un `Hero` para que la transición se vea más fluida en vez de un corte seco.

## Repositorio

https://github.com/diegodv14/ecotec-programacion-movil-integradora-1

Subí el proyecto en varios commits en vez de uno solo (README, pubspec con la dependencia, el código, los archivos que genera Flutter, y después el rediseño y la pantalla de detalle como cambios aparte).

## Capturas

Están en `capturas/`, los nombres que pide la rúbrica están detallados en `capturas/LEEME.txt`.

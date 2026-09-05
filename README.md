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

## Funcionamiento

La pantalla principal contiene la lista de productos y el estado de los favoritos.

Cuando se selecciona el corazón de un producto, se actualiza su estado como favorito. Esta misma lógica se utiliza tanto desde la pantalla principal como desde la pantalla de detalle, por lo que el contador de favoritos y los iconos permanecen sincronizados.

El botón de ofertas permite mostrar u ocultar un banner promocional dentro de la pantalla principal.

## Capturas

Las capturas de pantalla utilizadas para la entrega se encuentran dentro de:

```text
capturas/
```

---

# Actividad Integradora 2 - Mejoras y Nuevas Funcionalidades

**Continuación del proyecto de la Actividad Integradora 1**

En esta segunda actividad se ha mejorado significativamente la aplicación, agregando nuevas pantallas, nuevos widgets y funcionalidades de navegación avanzada.

## Mejoras Implementadas

### 1. Nuevas Pantallas

Se han implementado cuatro pantallas principales con navegación mediante `BottomNavigationBar`:

1. **Catálogo** - Pantalla principal con lista de productos
2. **Mi Carrito** - Gestor de compras con GridView
3. **Ofertas Especiales** - Listado de promociones especiales
4. **Mi Perfil** - Información del usuario y historial de compras

### 2. Descripción de Pantallas

#### Pantalla 1: Catálogo
- Visualización de productos con imagen, nombre, precio y descripción
- Botón de favoritos para marcar productos destacados
- Botón de carrito para agregar productos
- Banner de ofertas mostrable/ocultable
- Navegación a pantalla de detalle mediante transición `Hero`

#### Pantalla 2: Mi Carrito
- Implementación con `GridView` para mostrar productos añadidos
- Contador de cantidad por producto (aumentar/disminuir)
- Cálculo de subtotal por producto
- Botón para eliminar items
- Total de compra con botón "Comprar"
- Pantalla vacía con mensaje cuando no hay productos

#### Pantalla 3: Ofertas Especiales
- Lista de ofertas actuales con `ListView`
- Diseño visual atractivo con Card y gradientes
- Íconos representativos de cada promoción
- Descripción y valor de cada oferta
- Botones interactivos para ver detalles

#### Pantalla 4: Mi Perfil
- Avatar circular (CircleAvatar) con ícono de perfil
- Información de contacto con `ListTile`
- Botones interactivos para abrir WhatsApp y correo (usando `url_launcher`)
- Historial de compras con `Divider` entre elementos
- Botón de cerrar sesión

### 3. Nuevos Widgets Utilizados

Se han implementado los siguientes widgets de acuerdo a los requisitos:

- ✅ **GridView** - En pantalla de Carrito para mostrar productos
- ✅ **ListView** - En pantalla de Ofertas para lista de promociones
- ✅ **ListTile** - En pantalla de Perfil para contactos e historial
- ✅ **Card** - En múltiples pantallas para contenedores visuales
- ✅ **CircleAvatar** - En pantalla de Perfil para foto de usuario
- ✅ **Divider** - En pantalla de Perfil entre secciones
- ✅ **Image** - Imágenes de productos con manejo de errores
- ✅ **Icon** - Íconos en AppBar, botones y listas
- ✅ **ElevatedButton** - Botones de acción en carrito y detalle
- ✅ **IconButton** - Botones compactos para favorito y carrito
- ✅ **FloatingActionButton** - Disponible en navegación
- ✅ **Padding** - Espaciado en múltiples widgets
- ✅ **SizedBox** - Espacios verticales y horizontales
- ✅ **Expanded** - En pantalla de Carrito y detalle
- ✅ **Container** - Contenedores personalizados en varias pantallas
- ✅ **BottomNavigationBar** - Navegación principal entre pantallas

### 4. Interacciones Implementadas

Se han desarrollado las siguientes interacciones:

1. **Navegación entre pantallas** - Uso de `BottomNavigationBar` para cambiar entre las 4 pantallas
2. **Agregar/eliminar del carrito** - Funcionalidad completa de carrito de compras
3. **Sistema de favoritos** - Marcar/desmarcar productos favoritos con sincronización
4. **SnackBar** - Mensajes de retroalimentación en acciones (agregar carrito, favoritos, comprar)
5. **Mostrar/ocultar información** - Banner de ofertas togglable
6. **Incrementar contador** - Cantidad de productos en el carrito
7. **Links externos** - Abrir WhatsApp y correo electrónico desde el perfil

### 5. Estado Básico (setState)

Se implementó manejo de estado con `setState()` en:

- **AppMain** (pantalla principal) - Gestión central del estado
- **CarritoPage** - Aumentar/disminuir cantidad de productos
- **PerfilPage** - Interacciones con botones de contacto
- **Favoritos** - Sistema sincronizado entre pantallas
- **Ofertas visibility** - Mostrar/ocultar banner de promociones

### 6. Paquetes Externos

#### Google Fonts (Actividad Integradora 1)
- Tipografía personalizada: **Poppins**
- Aplicada en AppBar, títulos y textos principales

#### URL Launcher (Nuevo - Actividad Integradora 2)
- `url_launcher: ^6.3.0`
- Permite abrir enlaces de WhatsApp y correo electrónico
- Implementado en pantalla de Perfil con botones interactivos
- Abre WhatsApp, correo y navegador web (no funciona en emulador, funciona en dispositivo físico)

### 7. Personalización de la Aplicación

- **Nombre**: "Tuti App" ✅
- **Ícono Launcher**: Logo de Tuti (azul y amarillo) - Instalado en `android/app/src/main/res/mipmap-*` (48-192px)
- **Logo**: Imágenes de productos con estilo + Logo de Tuti en icono launcher
- **Colores Personalizados**:
  - Azul marino primario: `#1E3A4D`
  - Fondo claro: `#F5F5F5`
  - Colores por categoría: Rojo, Naranja, Amarillo, Verde, Azul, Púrpura
  - Tipografía unificada con Google Fonts (Poppins)


## Instalación y Ejecución

### Requisitos
- Flutter 3.0+
- Android SDK 21+
- Emulador o dispositivo Android configurado

### Pasos

```bash
# Clonar el repositorio
git clone https://github.com/diegodv14/ecotec-programacion-movil-integradora-1.git
cd ecotec-programacion-movil-integradora-1

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

## Prueba de Funcionalidades

1. **Catálogo**: Explorar productos, ver detalles, marcar favoritos
2. **Carrito**: Agregar productos desde catálogo o detalle, ajustar cantidades
3. **Ofertas**: Ver promociones especiales disponibles
4. **Perfil**: Ver información, contactar por WhatsApp o correo

## Notas de Desarrollo

- La aplicación utiliza `IndexedStack` para mantener el estado de cada pantalla al cambiar de pestaña
- Los favoritos se sincronizan en tiempo real entre todas las pantallas
- El carrito persiste mientras la aplicación está en memoria
- Los botones de contacto en el perfil requieren que el dispositivo tenga configurados WhatsApp y correo
- El ícono launcher muestra el logo de Tuti en la pantalla de inicio del dispositivo

---

# Actividad Integradora 3 — Manejo de Estado con Provider

## Descripción

Se implementó el paquete **Provider** para centralizar y gestionar el estado de la aplicación de manera reactiva. El estado que anteriormente se pasaba entre componentes mediante callbacks ahora se gestiona a través de un `ChangeNotifier` que notifica a todos los consumidores de cambios automáticamente.

## Instalación de Provider

Se agregó la dependencia `provider: ^6.1.2` al archivo `pubspec.yaml`:

```yaml
dependencies:
  provider: ^6.1.2
```

## Arquitectura del Provider

### Clase `AppProvider`

La clase `AppProvider` extiende `ChangeNotifier` y centraliza todo el estado de la aplicación:

**Estado gestionado:**
- `Set<int> _favoritos` — almacena los índices de productos marcados como favoritos
- `List<CarritoItem> _carrito` — almacena los items del carrito con cantidad
- `bool _mostrarOfertas` — controla la visibilidad del banner de ofertas

**Métodos principales:**
- `alternarFavorito(int index)` — marca o desactiva un producto como favorito
- `agregarAlCarrito(int index)` — agrega un producto al carrito o incrementa su cantidad
- `eliminarDelCarrito(CarritoItem item)` — elimina un item del carrito
- `aumentarCantidad(CarritoItem item)` / `disminuirCantidad(CarritoItem item)` — modifica cantidades
- `alternarOfertas()` — muestra u oculta el banner de ofertas

Cada método termina con `notifyListeners()` para notificar a todos los widgets que escuchan cambios.

### Registro del Provider

En `CatalogoProductosApp` se envuelve la aplicación con `ChangeNotifierProvider`:

```dart
ChangeNotifierProvider(
  create: (_) => AppProvider(),
  child: MaterialApp(...),
)
```

## Consumo del Provider en Pantallas

Las pantallas consumen el provider de dos formas:

### 1. `context.watch<AppProvider>()` — para leer estado reactivo

Se utiliza en constructores de widgets que necesitan reconstruirse cuando el estado cambia:

```dart
final provider = context.watch<AppProvider>();
```

Ejemplo en `CarritoPage`:

```dart
Consumer<AppProvider>(
  builder: (context, provider, _) {
    return provider.carrito.isEmpty ? ... : ...
  },
)
```

### 2. `context.read<AppProvider>()` — para leer estado sin reactividad

Se utiliza en callbacks de eventos (taps, presses) cuando solo necesitamos acceder al provider sin reconstrucción:

```dart
onPressed: () {
  context.read<AppProvider>().alternarFavorito(index);
}
```

## Sincronización Automática Entre Pantallas

Un ejemplo concreto de cómo Provider sincroniza el estado:

1. **Marcar favorito en pantalla de detalle** → `ProductoDetailPage` llama `context.read<AppProvider>().alternarFavorito(index)`
2. **El provider notifica listeners** → `notifyListeners()` es ejecutado
3. **Las demás pantallas se actualizan** → `CatalogoHomePage` con `context.watch()` se reconstruye, mostrando el contador de favoritos actualizado
4. **El badge del carrito también se actualiza** → el `Consumer` en el `BottomNavigationBar` de `AppMain` se reconstruye, mostrando la cantidad correcta de items

## Cambios en la Estructura

```text
lib/
├── main.dart
├── app/
│   └── catalogo_productos_app.dart    (actualizado con ChangeNotifierProvider)
├── providers/
│   └── app_provider.dart              (NUEVO - ChangeNotifier)
├── models/
│   ├── producto.dart
│   └── carrito_item.dart
├── data/
│   └── productos_data.dart
├── screens/
│   ├── app_main.dart                  (refactorizado)
│   ├── catalogo_home_page.dart        (refactorizado)
│   ├── carrito_page.dart              (refactorizado)
│   ├── ofertas_page.dart
│   ├── perfil_page.dart
│   └── producto_detail_page.dart      (refactorizado)
├── theme/
│   └── app_colors.dart
└── widgets/
    ├── catalogo_header.dart
    ├── oferta_banner.dart
    └── producto_card.dart
```

## Beneficios de la Implementación

- **Eliminación del prop drilling** — no se pasan callbacks entre múltiples niveles
- **Estado centralizado** — un único punto de verdad para favoritos, carrito y ofertas
- **Reactividad automática** — cambios en un lugar se reflejan en toda la app sin lógica manual
- **Código más limpio** — las pantallas no necesitan gestionar su propio estado local
- **Escalabilidad** — es fácil agregar nuevas funcionalidades que compartan el estado

## Capturas de Pantalla

### Pantalla Principal - Catálogo de Productos

![Pantalla Individual de la App](capturas/Pantalla%20Individual%20de%20la%20App.png)

### Sistema de Favoritos en Acción

![Uso del boton de favoritos](capturas/Uso%20del%20boton%20de%20favoritos.png)

### Pantalla de Carrito de Compras

![Pantalla de Carrito](capturas/Pantalla%20de%20Carrito.png)

### Pantalla de Ofertas Especiales

![Pantalla de Ofertas Especiales](capturas/Pantalla%20de%20Ofertas%20Especiales.png)

### Pantalla de Perfil del Usuario

![Pantalla de Perfil del Usuario](capturas/Pantalla%20de%20Perfil%20del%20Usuario.png)

### Menú de Navegación Inferior

![Nuevo Menu de Navegacion](capturas/Nuevo%20Menu%20de%20Navegacion.png)

### Aplicación Ejecutándose en el Emulador

![Aplicación ejecutándose en el emulador](capturas/Aplicaci%C3%B3n%20ejecut%C3%A1ndose%20en%20el%20emulador.png)

## Autor

**Juan Diego Benavides Luna**  
Estudiante de Programación de Aplicaciones Móviles  
Ecotec - 2026
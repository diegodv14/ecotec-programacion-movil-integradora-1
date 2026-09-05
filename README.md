# Tuti App - Catálogo de Productos

**Programación de Aplicaciones Móviles - Ecotec**  
**Autor: Juan Diego Benavides Luna**

Aplicación móvil desarrollada con Flutter para gestionar un catálogo de productos con carrito de compras, sistema de favoritos y navegación multi-pantalla. La app demuestra evolución progresiva en estructura, uso de Provider para manejo de estado, widgets reutilizables y control de versiones.

---

<details>
<summary><h2>Actividad Integradora 1 - Mi Primera Aplicación en Flutter</h2></summary>

### Características

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

### Estructura del proyecto

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

### Tecnologías utilizadas

* **Flutter**
* **Dart**
* **Android Studio**
* **VS Code**
* **Google Fonts** - Tipografía Poppins
* **Git / GitHub**

### Funcionamiento

La pantalla principal contiene la lista de productos y el estado de los favoritos. Cuando se selecciona el corazón de un producto, se actualiza su estado como favorito. El botón de ofertas permite mostrar u ocultar un banner promocional dentro de la pantalla principal.

</details>

---

<details>
<summary><h2>Actividad Integradora 2 - Mejoras y Nuevas Funcionalidades</h2></summary>

### Resumen

En esta actividad se mejoró significativamente la aplicación, agregando nuevas pantallas, nuevos widgets y funcionalidades de navegación avanzada con `BottomNavigationBar` y gestión de estado mediante `setState()`.

### Nuevas Pantallas Implementadas

| Pantalla | Descripción |
|----------|-------------|
| **Catálogo** | Lista de productos con imagen, nombre, precio y descripción |
| **Mi Carrito** | Gestor de compras con GridView, cantidades y total |
| **Ofertas Especiales** | Listado de promociones especiales con ListView |
| **Mi Perfil** | Información del usuario e historial de compras |

### Pantalla 1: Catálogo
- Visualización de productos con imagen, nombre, precio y descripción
- Botón de favoritos para marcar productos destacados
- Botón de carrito para agregar productos
- Banner de ofertas mostrable/ocultable
- Navegación a pantalla de detalle mediante transición `Hero`

### Pantalla 2: Mi Carrito
- Implementación con `GridView` para mostrar productos añadidos
- Contador de cantidad por producto (aumentar/disminuir)
- Cálculo de subtotal por producto
- Botón para eliminar items
- Total de compra con botón "Comprar"
- Pantalla vacía con mensaje cuando no hay productos

### Pantalla 3: Ofertas Especiales
- Lista de ofertas actuales con `ListView`
- Diseño visual atractivo con Card y gradientes
- Íconos representativos de cada promoción
- Descripción y valor de cada oferta
- Botones interactivos para ver detalles

### Pantalla 4: Mi Perfil
- Avatar circular (CircleAvatar) con ícono de perfil
- Información de contacto con `ListTile`
- Botones interactivos para abrir WhatsApp y correo (usando `url_launcher`)
- Historial de compras con `Divider` entre elementos
- Botón de cerrar sesión

### Widgets Utilizados

✅ GridView • ✅ ListView • ✅ ListTile • ✅ Card • ✅ CircleAvatar • ✅ Divider • ✅ Image • ✅ Icon • ✅ ElevatedButton • ✅ IconButton • ✅ Padding • ✅ SizedBox • ✅ Expanded • ✅ Container • ✅ BottomNavigationBar

### Interacciones Implementadas

1. **Navegación entre pantallas** - BottomNavigationBar con 4 tabs
2. **Agregar/eliminar del carrito** - Funcionalidad completa
3. **Sistema de favoritos** - Marcar/desmarcar sincronizado
4. **SnackBar** - Mensajes de retroalimentación
5. **Mostrar/ocultar información** - Banner de ofertas togglable
6. **Incrementar contador** - Cantidad de productos dinámico
7. **Links externos** - WhatsApp y correo desde el perfil

### Paquetes Externos

- **google_fonts** (Actividad 1) - Tipografía Poppins
- **url_launcher** (Nuevo) - Abrir WhatsApp y correo desde el perfil

### Personalización

- **Nombre**: "Tuti App"
- **Ícono Launcher**: Logo de Tuti personalizado
- **Colores**: Paleta azul marino coherente
- **Tipografía**: Google Fonts (Poppins)

### Notas de Desarrollo

- Usa `IndexedStack` para mantener el estado de cada pantalla
- Los favoritos se sincronizan en tiempo real
- El carrito persiste mientras la aplicación está en memoria
- Los botones de contacto requieren WhatsApp y correo configurados
- El ícono launcher muestra el logo en la pantalla de inicio

</details>

---

<details>
<summary><h2>Actividad Integradora 3 - Manejo de Estado con Provider</h2></summary>

### Resumen

Se implementó el paquete **Provider** para centralizar y gestionar el estado de la aplicación de manera reactiva. El estado que anteriormente se pasaba entre componentes mediante callbacks ahora se gestiona a través de un `ChangeNotifier` que notifica automáticamente a todos los consumidores de cambios.

### Instalación de Provider

```yaml
dependencies:
  provider: ^6.1.2
```

### Arquitectura del Provider

#### Clase `AppProvider extends ChangeNotifier`

**Estado gestionado:**
- `Set<int> _favoritos` — almacena índices de productos favoritos
- `List<CarritoItem> _carrito` — almacena items del carrito con cantidad
- `bool _mostrarOfertas` — controla visibilidad del banner

**Métodos con notifyListeners():**
- `alternarFavorito(int index)` — marca/desactiva favorito
- `agregarAlCarrito(int index)` — agrega o incrementa cantidad
- `eliminarDelCarrito(CarritoItem item)` — elimina item
- `aumentarCantidad()` / `disminuirCantidad()` — modifica cantidades
- `alternarOfertas()` — muestra/oculta banner

#### Registro del Provider

```dart
ChangeNotifierProvider(
  create: (_) => AppProvider(),
  child: MaterialApp(...)
)
```

### Consumo del Provider en Pantallas

**1. `context.watch<AppProvider>()` — Lectura reactiva**

Se utiliza en widgets que necesitan reconstruirse cuando el estado cambia:

```dart
final provider = context.watch<AppProvider>();
```

**2. `context.read<AppProvider>()` — Lectura sin reactividad**

Se utiliza en callbacks de eventos (taps, presses):

```dart
onPressed: () {
  context.read<AppProvider>().alternarFavorito(index);
}
```

### Sincronización Automática Entre Pantallas

1. **Marcar favorito en detalle** → `ProductoDetailPage` llama `alternarFavorito()`
2. **Provider notifica listeners** → `notifyListeners()` ejecutado
3. **Pantallas se actualizan** → `CatalogoHomePage` con `context.watch()` se reconstruye
4. **Badge del carrito actualiza** → `Consumer` en `BottomNavigationBar` muestra cantidad correcta

### Estructura Actualizada

```text
lib/
├── main.dart
├── app/
│   └── catalogo_productos_app.dart    (con ChangeNotifierProvider)
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
│   ├── producto_detail_page.dart      (refactorizado)
│   ├── ofertas_page.dart
│   └── perfil_page.dart
├── theme/
│   └── app_colors.dart
└── widgets/
    ├── catalogo_header.dart
    ├── oferta_banner.dart
    └── producto_card.dart
```

### Beneficios de la Implementación

✅ **Eliminación del prop drilling** — no se pasan callbacks entre múltiples niveles  
✅ **Estado centralizado** — un único punto de verdad  
✅ **Reactividad automática** — cambios se reflejan sin lógica manual  
✅ **Código más limpio** — las pantallas no gestionar su propio estado  
✅ **Escalabilidad** — fácil agregar nuevas funcionalidades que compartan estado

</details>

---

## 📸 Capturas de Pantalla

<details>
<summary><strong>Haz clic para ver las capturas</strong></summary>

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

---

## Video Demostrativo - Versión Final

**Demostración completa de todas las funcionalidades de la aplicación:**

[![Reproducir video de demostración](https://img.shields.io/badge/Descargar%20Video-Version%20Final-blue?style=for-the-badge)](capturas/Version%20Final%20de%20la%20aplicacion.mp4)

**Archivo:** `capturas/Version Final de la aplicacion.mp4` (9.6 MB)

**En este video se puede ver:**
- Navegación entre las 4 pantallas principales
- Sistema de favoritos funcional en tiempo real
- Carrito de compras con agregar/eliminar productos
- Pantalla de ofertas especiales
- Perfil del usuario con contactos
- Sincronización automática de estado con Provider
- Interacciones y animaciones de la interfaz

</details>

---

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

---

**Juan Diego Benavides Luna**  
Estudiante de Programación de Aplicaciones Móviles  
Ecotec - 2026

import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Fuente de datos estática con el catálogo de productos de ejemplo.
/// Las fotos vienen de Picsum Photos (https://picsum.photos), una API
/// gratuita de imágenes reales que no requiere API key. Cada producto
/// usa una "seed" fija para que siempre muestre la misma foto.
const List<Producto> productosCatalogo = [
  Producto(
    nombre: 'Mochila Urbana',
    descripcion: 'Resistente al agua, ideal para el día a día',
    precio: 35.99,
    icono: Icons.backpack,
    color: Color(0xFF1D3557),
    imagenUrl: 'https://picsum.photos/seed/mochila-urbana/400/400',
  ),
  Producto(
    nombre: 'Audífonos Inalámbricos',
    descripcion: 'Cancelación de ruido y 20h de batería',
    precio: 49.50,
    icono: Icons.headphones,
    color: Color(0xFF2A6F97),
    imagenUrl: 'https://picsum.photos/seed/audifonos-inalambricos/400/400',
  ),
  Producto(
    nombre: 'Reloj Inteligente',
    descripcion: 'Monitor de actividad física y notificaciones',
    precio: 89.00,
    icono: Icons.watch,
    color: Color(0xFF457B9D),
    imagenUrl: 'https://picsum.photos/seed/reloj-inteligente/400/400',
  ),
  Producto(
    nombre: 'Lámpara LED',
    descripcion: 'Luz cálida regulable para escritorio',
    precio: 18.75,
    icono: Icons.lightbulb,
    color: Color(0xFF5C80BC),
    imagenUrl: 'https://picsum.photos/seed/lampara-led/400/400',
  ),
  Producto(
    nombre: 'Taza Térmica',
    descripcion: 'Mantiene la temperatura hasta por 6 horas',
    precio: 12.30,
    icono: Icons.local_cafe,
    color: Color(0xFF3D5A80),
    imagenUrl: 'https://picsum.photos/seed/taza-termica/400/400',
  ),
  Producto(
    nombre: 'Teclado Mecánico',
    descripcion: 'Switches silenciosos, retroiluminado',
    precio: 65.40,
    icono: Icons.keyboard,
    color: Color(0xFF6D8299),
    imagenUrl: 'https://picsum.photos/seed/teclado-mecanico/400/400',
  ),
];

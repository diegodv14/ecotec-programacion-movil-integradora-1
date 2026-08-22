import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Fuente de datos estática con el catálogo de productos de ejemplo.
/// Las fotos son propias, incluidas en `assets/images/`.
const List<Producto> productosCatalogo = [
  Producto(
    nombre: 'Mochila Urbana',
    descripcion: 'Resistente al agua, ideal para el día a día',
    precio: 35.99,
    icono: Icons.backpack,
    color: Color(0xFF1D3557),
    imagenAsset: 'assets/images/mochila_urbana.jpg',
  ),
  Producto(
    nombre: 'Audífonos Inalámbricos',
    descripcion: 'Cancelación de ruido y 20h de batería',
    precio: 49.50,
    icono: Icons.headphones,
    color: Color(0xFF2A6F97),
    imagenAsset: 'assets/images/audifonos_inalambricos.jpg',
  ),
  Producto(
    nombre: 'Reloj Inteligente',
    descripcion: 'Monitor de actividad física y notificaciones',
    precio: 89.00,
    icono: Icons.watch,
    color: Color(0xFF457B9D),
    imagenAsset: 'assets/images/reloj_inteligente.jpg',
  ),
  Producto(
    nombre: 'Lámpara LED',
    descripcion: 'Luz cálida regulable para escritorio',
    precio: 18.75,
    icono: Icons.lightbulb,
    color: Color(0xFF5C80BC),
    imagenAsset: 'assets/images/lampara_led.webp',
  ),
  Producto(
    nombre: 'Taza Térmica',
    descripcion: 'Mantiene la temperatura hasta por 6 horas',
    precio: 12.30,
    icono: Icons.local_cafe,
    color: Color(0xFF3D5A80),
    imagenAsset: 'assets/images/taza_termica.webp',
  ),
  Producto(
    nombre: 'Teclado Mecánico',
    descripcion: 'Switches silenciosos, retroiluminado',
    precio: 65.40,
    icono: Icons.keyboard,
    color: Color(0xFF6D8299),
    imagenAsset: 'assets/images/teclado_mecanico.webp',
  ),
];

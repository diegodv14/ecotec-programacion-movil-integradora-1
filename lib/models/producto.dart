import 'package:flutter/material.dart';

/// Modelo simple de un producto del catálogo.
class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final IconData icono;
  final Color color;

  const Producto({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.icono,
    required this.color,
  });
}

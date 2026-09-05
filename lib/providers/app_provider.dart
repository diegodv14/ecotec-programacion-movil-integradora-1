import 'package:flutter/material.dart';

import '../data/productos_data.dart';
import '../models/carrito_item.dart';

class AppProvider extends ChangeNotifier {
  final Set<int> _favoritos = {};
  final List<CarritoItem> _carrito = [];
  bool _mostrarOfertas = false;

  Set<int> get favoritos => _favoritos;
  List<CarritoItem> get carrito => _carrito;
  bool get mostrarOfertas => _mostrarOfertas;

  int get cantidadItemsCarrito => _carrito.length;

  double get totalCarrito {
    return _carrito.fold<double>(0, (sum, item) => sum + item.subtotal);
  }

  bool esFavorito(int index) {
    return _favoritos.contains(index);
  }

  void alternarFavorito(int index) {
    if (_favoritos.contains(index)) {
      _favoritos.remove(index);
    } else {
      _favoritos.add(index);
    }
    notifyListeners();
  }

  void agregarAlCarrito(int index) {
    final producto = productosCatalogo[index];
    final itemExistente = _carrito.firstWhere(
      (item) => item.producto == producto,
      orElse: () => CarritoItem(producto: producto),
    );

    if (!_carrito.contains(itemExistente)) {
      _carrito.add(itemExistente);
    } else {
      itemExistente.cantidad++;
    }
    notifyListeners();
  }

  void eliminarDelCarrito(CarritoItem item) {
    _carrito.remove(item);
    notifyListeners();
  }

  void aumentarCantidad(CarritoItem item) {
    item.cantidad++;
    notifyListeners();
  }

  void disminuirCantidad(CarritoItem item) {
    if (item.cantidad > 1) {
      item.cantidad--;
      notifyListeners();
    }
  }

  void alternarOfertas() {
    _mostrarOfertas = !_mostrarOfertas;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../data/productos_data.dart';
import '../models/carrito_item.dart';
import '../theme/app_colors.dart';
import 'carrito_page.dart';
import 'catalogo_home_page.dart';
import 'ofertas_page.dart';
import 'perfil_page.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int _indiceActual = 0;
  final List<CarritoItem> _carrito = [];
  final Set<int> _favoritos = {};
  bool _mostrarOfertas = false;

  void _alternarFavorito(int index) {
    setState(() {
      if (_favoritos.contains(index)) {
        _favoritos.remove(index);
      } else {
        _favoritos.add(index);
      }
    });

    final nombre = productosCatalogo[index].nombre;
    final esFavorito = _favoritos.contains(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          esFavorito
              ? '$nombre agregado a favoritos ⭐'
              : '$nombre quitado de favoritos',
        ),
      ),
    );
  }

  void _agregarAlCarrito(int index) {
    setState(() {
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
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Producto agregado al carrito 🛒'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _eliminarDelCarrito(CarritoItem item) {
    setState(() {
      _carrito.remove(item);
    });
  }

  void _alternarOfertas() {
    setState(() {
      _mostrarOfertas = !_mostrarOfertas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _indiceActual,
        children: [
          CatalogoHomePage(
            favoritos: _favoritos,
            onAlternarFavorito: _alternarFavorito,
            onAgregarCarrito: _agregarAlCarrito,
            mostrarOfertas: _mostrarOfertas,
            onAlternarOfertas: _alternarOfertas,
          ),
          CarritoPage(
            carrito: _carrito,
            onEliminar: _eliminarDelCarrito,
          ),
          const OfertasPage(),
          const PerfilPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (indice) {
          setState(() {
            _indiceActual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryNavy,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Catálogo',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: 'Carrito (${_carrito.length})',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Ofertas',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

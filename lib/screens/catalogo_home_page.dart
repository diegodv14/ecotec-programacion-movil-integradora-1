import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/productos_data.dart';
import '../widgets/catalogo_header.dart';
import '../widgets/oferta_banner.dart';
import '../widgets/producto_card.dart';

/// Pantalla principal: lista el catálogo de productos y gestiona el estado
/// de favoritos y visibilidad de ofertas.
class CatalogoHomePage extends StatefulWidget {
  const CatalogoHomePage({super.key});

  @override
  State<CatalogoHomePage> createState() => _CatalogoHomePageState();
}

class _CatalogoHomePageState extends State<CatalogoHomePage> {
  // Guarda los índices de los productos marcados como favoritos.
  final Set<int> _favoritos = {};

  // Controla si se muestra el bloque de ofertas especiales.
  bool _mostrarOfertas = false;

  void _alternarFavorito(int index) {
    setState(() {
      if (_favoritos.contains(index)) {
        _favoritos.remove(index);
      } else {
        _favoritos.add(index);
      }
    });

    // Acción sencilla adicional: mostrar un mensaje al usuario.
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

  void _alternarOfertas() {
    // El botón principal muestra u oculta el bloque de ofertas.
    setState(() {
      _mostrarOfertas = !_mostrarOfertas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catálogo de Productos',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          CatalogoHeader(
            mostrarOfertas: _mostrarOfertas,
            totalFavoritos: _favoritos.length,
            onAlternarOfertas: _alternarOfertas,
          ),
          if (_mostrarOfertas) const OfertaBanner(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: productosCatalogo.length,
              itemBuilder: (context, index) {
                return ProductoCard(
                  producto: productosCatalogo[index],
                  esFavorito: _favoritos.contains(index),
                  onFavoritoPressed: () => _alternarFavorito(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

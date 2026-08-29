import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/productos_data.dart';
import '../theme/app_colors.dart';
import '../widgets/catalogo_header.dart';
import '../widgets/oferta_banner.dart';
import '../widgets/producto_card.dart';
import 'producto_detail_page.dart';

/// Pantalla de catálogo: lista de productos con favoritos y ofertas.
class CatalogoHomePage extends StatelessWidget {
  final Set<int> favoritos;
  final Function(int) onAlternarFavorito;
  final Function(int) onAgregarCarrito;
  final bool mostrarOfertas;
  final VoidCallback onAlternarOfertas;

  const CatalogoHomePage({
    super.key,
    required this.favoritos,
    required this.onAlternarFavorito,
    required this.onAgregarCarrito,
    required this.mostrarOfertas,
    required this.onAlternarOfertas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tuti App',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.primaryNavy,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          CatalogoHeader(
            mostrarOfertas: mostrarOfertas,
            totalFavoritos: favoritos.length,
            onAlternarOfertas: onAlternarOfertas,
          ),
          if (mostrarOfertas) const OfertaBanner(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: productosCatalogo.length,
              itemBuilder: (context, index) {
                final producto = productosCatalogo[index];
                return ProductoCard(
                  producto: producto,
                  index: index,
                  esFavorito: favoritos.contains(index),
                  onFavoritoPressed: () => onAlternarFavorito(index),
                  onAgregarCarrito: () => onAgregarCarrito(index),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductoDetailPage(
                          producto: producto,
                          index: index,
                          esFavorito: favoritos.contains(index),
                          onFavoritoPressed: () => onAlternarFavorito(index),
                          onAgregarCarrito: () => onAgregarCarrito(index),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/productos_data.dart';
import '../providers/app_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/catalogo_header.dart';
import '../widgets/oferta_banner.dart';
import '../widgets/producto_card.dart';
import 'producto_detail_page.dart';

class CatalogoHomePage extends StatelessWidget {
  const CatalogoHomePage({super.key});

  void _mostrarSnackbar(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(mensaje),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

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
            mostrarOfertas: provider.mostrarOfertas,
            totalFavoritos: provider.favoritos.length,
            onAlternarOfertas: () {
              context.read<AppProvider>().alternarOfertas();
            },
          ),
          if (provider.mostrarOfertas) const OfertaBanner(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: productosCatalogo.length,
              itemBuilder: (context, index) {
                final producto = productosCatalogo[index];
                return ProductoCard(
                  producto: producto,
                  index: index,
                  esFavorito: provider.esFavorito(index),
                  onFavoritoPressed: () {
                    context.read<AppProvider>().alternarFavorito(index);
                    final esFavorito = provider.esFavorito(index);
                    _mostrarSnackbar(
                      context,
                      esFavorito
                          ? '${producto.nombre} agregado a favoritos ⭐'
                          : '${producto.nombre} quitado de favoritos',
                    );
                  },
                  onAgregarCarrito: () {
                    context.read<AppProvider>().agregarAlCarrito(index);
                    _mostrarSnackbar(
                      context,
                      'Producto agregado al carrito 🛒',
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductoDetailPage(
                          producto: producto,
                          index: index,
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

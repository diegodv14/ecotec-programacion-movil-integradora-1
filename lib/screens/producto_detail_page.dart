import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/producto.dart';
import '../theme/app_colors.dart';

/// Pantalla de detalle: se abre al tocar un producto en la lista y muestra
/// su foto en grande, descripción completa y precio.
class ProductoDetailPage extends StatefulWidget {
  final Producto producto;
  final int index;
  final bool esFavorito;
  final VoidCallback onFavoritoPressed;
  final VoidCallback onAgregarCarrito;

  const ProductoDetailPage({
    super.key,
    required this.producto,
    required this.index,
    required this.esFavorito,
    required this.onFavoritoPressed,
    required this.onAgregarCarrito,
  });

  @override
  State<ProductoDetailPage> createState() => _ProductoDetailPageState();
}

class _ProductoDetailPageState extends State<ProductoDetailPage> {
  late bool _esFavorito = widget.esFavorito;

  void _toggleFavorito() {
    setState(() => _esFavorito = !_esFavorito);
    widget.onFavoritoPressed();
  }

  @override
  Widget build(BuildContext context) {
    final producto = widget.producto;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.primaryNavy,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'producto-imagen-${widget.index}',
                child: Image.asset(
                  producto.imagenAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: producto.color.withValues(alpha: 0.15),
                    child: Icon(
                      producto.icono,
                      size: 96,
                      color: producto.color,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          producto.nombre,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _toggleFavorito,
                        icon: Icon(
                          _esFavorito ? Icons.favorite : Icons.favorite_border,
                          color: _esFavorito ? Colors.redAccent : Colors.grey,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${producto.precio.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: producto.color,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Descripción',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    producto.descripcion,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _toggleFavorito,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: AppColors.primaryNavy,
                            side: const BorderSide(
                              color: AppColors.primaryNavy,
                              width: 2,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(
                            _esFavorito ? Icons.favorite : Icons.favorite_border,
                          ),
                          label: Text(
                            _esFavorito ? 'Favorito' : 'Favorito',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            widget.onAgregarCarrito();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryNavy,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text('Al carrito'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

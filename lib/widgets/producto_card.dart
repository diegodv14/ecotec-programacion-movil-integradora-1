import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/producto.dart';

class ProductoCard extends StatelessWidget {
  final Producto producto;
  final int index;
  final bool esFavorito;
  final VoidCallback onFavoritoPressed;
  final VoidCallback onTap;

  const ProductoCard({
    super.key,
    required this.producto,
    required this.index,
    required this.esFavorito,
    required this.onFavoritoPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: producto.color, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: 'producto-imagen-$index',
                      child: Image.network(
                        producto.imagenUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: producto.color,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: producto.color.withValues(alpha: 0.15),
                          child: Icon(producto.icono, color: producto.color),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.nombre,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      producto.descripcion,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${producto.precio.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: producto.color,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onFavoritoPressed,
                icon: Icon(
                  esFavorito ? Icons.favorite : Icons.favorite_border,
                  color: esFavorito ? Colors.redAccent : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/producto.dart';

class ProductoCard extends StatelessWidget {
  final Producto producto;
  final bool esFavorito;
  final VoidCallback onFavoritoPressed;

  const ProductoCard({
    super.key,
    required this.producto,
    required this.esFavorito,
    required this.onFavoritoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: producto.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(producto.icono, color: producto.color),
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
                      color: const Color(0xFF6C63FF),
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
    );
  }
}

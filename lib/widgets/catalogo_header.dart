import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CatalogoHeader extends StatelessWidget {
  final bool mostrarOfertas;
  final int totalFavoritos;
  final VoidCallback onAlternarOfertas;

  const CatalogoHeader({
    super.key,
    required this.mostrarOfertas,
    required this.totalFavoritos,
    required this.onAlternarOfertas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: AppColors.primaryNavy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Bienvenido a mi tienda!',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Explora nuestros productos y marca tus favoritos.',
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: onAlternarOfertas,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryNavy,
                ),
                icon: Icon(
                  mostrarOfertas ? Icons.visibility_off : Icons.local_offer,
                ),
                label: Text(mostrarOfertas ? 'Ocultar ofertas' : 'Ver ofertas'),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.favorite, color: Colors.white70, size: 18),
              const SizedBox(width: 4),
              Text(
                '$totalFavoritos favoritos',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

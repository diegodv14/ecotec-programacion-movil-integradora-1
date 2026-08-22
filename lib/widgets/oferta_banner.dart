import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OfertaBanner extends StatelessWidget {
  const OfertaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.ofertaBackground,
      padding: const EdgeInsets.all(12),
      child: const Row(
        children: [
          Icon(Icons.celebration, color: AppColors.ofertaForeground),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '¡20% de descuento esta semana en toda la tienda!',
              style: TextStyle(
                color: AppColors.ofertaForeground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

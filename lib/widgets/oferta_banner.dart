import 'package:flutter/material.dart';

class OfertaBanner extends StatelessWidget {
  const OfertaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFFF3CD),
      padding: const EdgeInsets.all(12),
      child: const Row(
        children: [
          Icon(Icons.celebration, color: Color(0xFFB8860B)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '¡20% de descuento esta semana en toda la tienda!',
              style: TextStyle(
                color: Color(0xFF6B4E00),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

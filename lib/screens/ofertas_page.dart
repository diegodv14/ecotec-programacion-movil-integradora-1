import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class OfertasPage extends StatelessWidget {
  const OfertasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ofertas = [
      {
        'titulo': 'Descuento de Verano',
        'descripcion': 'Hasta 50% en productos seleccionados',
        'descuento': '50%',
        'icono': Icons.wb_sunny,
      },
      {
        'titulo': 'Segunda Compra',
        'descripcion': 'Descuento adicional en tu segunda compra',
        'descuento': '20%',
        'icono': Icons.repeat,
      },
      {
        'titulo': 'Envío Gratis',
        'descripcion': 'En compras mayores a \$100',
        'descuento': 'GRATIS',
        'icono': Icons.local_shipping,
      },
      {
        'titulo': 'Programa de Puntos',
        'descripcion': 'Acumula puntos en cada compra',
        'descuento': '2x',
        'icono': Icons.star,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ofertas Especiales',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.primaryNavy,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ofertas.length,
        itemBuilder: (context, index) {
          final oferta = ofertas[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryNavy.withAlpha(50),
                    AppColors.primaryNavy.withAlpha(10),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.primaryNavy,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          oferta['icono'] as IconData,
                          size: 40,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          oferta['descuento'].toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            oferta['titulo'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            oferta['descripcion'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Oferta ${oferta['titulo']} aplicada ✓',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryNavy,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: const Text('Ver más'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

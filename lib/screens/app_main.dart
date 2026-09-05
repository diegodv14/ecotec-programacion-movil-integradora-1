import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../theme/app_colors.dart';
import 'carrito_page.dart';
import 'catalogo_home_page.dart';
import 'ofertas_page.dart';
import 'perfil_page.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int _indiceActual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _indiceActual,
        children: const [
          CatalogoHomePage(),
          CarritoPage(),
          OfertasPage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: Consumer<AppProvider>(
        builder: (context, provider, _) {
          return BottomNavigationBar(
            currentIndex: _indiceActual,
            onTap: (indice) {
              setState(() {
                _indiceActual = indice;
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            selectedItemColor: AppColors.primaryNavy,
            unselectedItemColor: Colors.grey[600],
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Catálogo',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_rounded),
                label: 'Carrito${provider.cantidadItemsCarrito > 0 ? ' (${provider.cantidadItemsCarrito})' : ''}',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_rounded),
                label: 'Ofertas',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Perfil',
              ),
            ],
          );
        },
      ),
    );
  }
}

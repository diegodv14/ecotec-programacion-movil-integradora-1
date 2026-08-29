import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/carrito_item.dart';
import '../theme/app_colors.dart';

class CarritoPage extends StatefulWidget {
  final List<CarritoItem> carrito;
  final Function(CarritoItem) onEliminar;

  const CarritoPage({
    super.key,
    required this.carrito,
    required this.onEliminar,
  });

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  void _aumentarCantidad(int index) {
    setState(() {
      widget.carrito[index].cantidad++;
    });
  }

  void _disminuirCantidad(int index) {
    setState(() {
      if (widget.carrito[index].cantidad > 1) {
        widget.carrito[index].cantidad--;
      }
    });
  }

  double get _total {
    return widget.carrito.fold<double>(0, (sum, item) => sum + item.subtotal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi Carrito',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.primaryNavy,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: widget.carrito.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tu carrito está vacío',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: widget.carrito.length,
                    itemBuilder: (context, index) {
                      final item = widget.carrito[index];
                      return Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  item.producto.imagenAsset,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    color: item.producto.color.withAlpha(50),
                                    child: Center(
                                      child: Icon(
                                        item.producto.icono,
                                        size: 48,
                                        color: item.producto.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.producto.nombre,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${item.producto.precio.toStringAsFixed(2)}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: AppColors.primaryNavy,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () =>
                                            _disminuirCantidad(index),
                                        iconSize: 16,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                      Text(
                                        '${item.cantidad}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () =>
                                            _aumentarCantidad(index),
                                        iconSize: 16,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          widget.onEliminar(item);
                                          setState(() {});
                                        },
                                        iconSize: 18,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryNavy.withAlpha(10),
                    border: Border(
                      top: BorderSide(color: AppColors.primaryNavy, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          Text(
                            '\$${_total.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryNavy,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Compra simulada completada ✓'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryNavy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Comprar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

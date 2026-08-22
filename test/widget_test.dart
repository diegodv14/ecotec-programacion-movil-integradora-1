// Smoke test básico: verifica que la app del Catálogo de Productos
// arranca y muestra su título y al menos un producto.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:catalogo_productos/app/catalogo_productos_app.dart';

void main() {
  testWidgets('La app arranca y muestra el catálogo', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CatalogoProductosApp());

    expect(find.text('Catálogo de Productos'), findsWidgets);
    expect(find.byIcon(Icons.favorite_border), findsWidgets);
  });

  testWidgets('El botón de ofertas muestra el banner de descuento', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CatalogoProductosApp());

    expect(find.text('¡20% de descuento esta semana en toda la tienda!'),
        findsNothing);

    await tester.tap(find.text('Ver ofertas'));
    await tester.pump();

    expect(find.text('¡20% de descuento esta semana en toda la tienda!'),
        findsOneWidget);
  });
}

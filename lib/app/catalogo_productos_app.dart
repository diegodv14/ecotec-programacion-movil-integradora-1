import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/catalogo_home_page.dart';
import '../theme/app_colors.dart';

class CatalogoProductosApp extends StatelessWidget {
  const CatalogoProductosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Productos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryNavy),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const CatalogoHomePage(),
    );
  }
}

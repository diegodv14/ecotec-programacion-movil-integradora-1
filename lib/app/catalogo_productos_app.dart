import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../screens/app_main.dart';
import '../theme/app_colors.dart';

class CatalogoProductosApp extends StatelessWidget {
  const CatalogoProductosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'Tuti App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryNavy),
          scaffoldBackgroundColor: AppColors.background,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const AppMain(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_colors.dart';
import 'pages/matches_browse_page.dart';

void main() => runApp(const ShabbahApp());

class ShabbahApp extends StatelessWidget {
  const ShabbahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shabbah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.scaffold,
        textTheme: GoogleFonts.tajawalTextTheme(),
      ),

      home: const MatchesBrowsePage(),
    );
  }
}

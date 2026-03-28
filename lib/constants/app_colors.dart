import 'package:flutter/material.dart';

/// Colors used by the Matches screen.
abstract final class AppColors {
  static const Color accent = Color(0xFF10B981);
  static const Color scaffold = Color(0xFFF1F5F9);
  static const Color card = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0x8C0F172A);
  static const Color textMuted = Color(0x590F172A);
  static const Color sky = Color(0xFF0284C7);
  static const Color coral = Color(0xFFE11D48);

  static Color border([double a = 0.08]) => Color.fromRGBO(0, 0, 0, a);

  static get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static get tabBarShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
}

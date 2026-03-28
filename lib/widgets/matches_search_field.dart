import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class MatchesSearchField extends StatelessWidget {
  const MatchesSearchField({
    super.key,
    required this.controller,
    this.onFilterPressed,
  });

  final TextEditingController controller;
  final VoidCallback? onFilterPressed;

  @override
  Widget build(BuildContext context) {
    final field = Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border()),
      ),

      padding: const EdgeInsets.symmetric(horizontal: 14),

      child: Row(
        children: [
          Icon(Icons.search_rounded, size: 18, color: AppColors.textMuted),
          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.start,

              style: GoogleFonts.tajawal(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),

              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'ابحث عن مباراة...',
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMuted,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );

    final filter = Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        onTap: onFilterPressed,
        borderRadius: BorderRadius.circular(12),

        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border()),
          ),

          child: Stack(
            clipBehavior: Clip.none,

            children: [
              Icon(
                Icons.tune_rounded,
                size: 18,
                color: AppColors.textSecondary,
              ),

              PositionedDirectional(
                top: 8,
                end: 8,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Row(
      children: [
        Expanded(child: field),
        const SizedBox(width: 8),
        filter,
      ],
    );
  }
}

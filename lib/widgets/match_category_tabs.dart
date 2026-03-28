import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class MatchCategoryTabs extends StatelessWidget {
  const MatchCategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    const labels = ['الكل', 'انضم لمباراة', 'ابحث عن منافس', 'مباراتي'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == selectedIndex;

          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: Material(
              color: selected ? AppColors.accent : AppColors.card,

              borderRadius: BorderRadius.circular(999),

              child: InkWell(
                onTap: () => onSelected(i),
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: selected ? AppColors.accent : AppColors.border(),
                    ),
                  ),

                  child: Text(
                    labels[i],
                    style: GoogleFonts.tajawal(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

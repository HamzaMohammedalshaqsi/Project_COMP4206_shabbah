import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AgeFilterChips extends StatelessWidget {
  const AgeFilterChips({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    const labels = ['الكل', '0 - 15', '15 - 20', '18 - 30', '30+'];
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 6,
      runSpacing: 6,

      children: List.generate(labels.length, (i) {
        final selected = i == selectedIndex;
        return Material(
          color: selected ? AppColors.accent : AppColors.card,
          borderRadius: BorderRadius.circular(999),

          child: InkWell(
            onTap: () => onSelected(i),
            borderRadius: BorderRadius.circular(999),

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: selected ? AppColors.accent : AppColors.border(),
                ),
              ),

              child: Text(
                labels[i],
                style: GoogleFonts.tajawal(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

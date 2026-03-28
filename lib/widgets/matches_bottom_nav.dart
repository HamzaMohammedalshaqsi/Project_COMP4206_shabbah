import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class MatchesBottomNav extends StatelessWidget {
  const MatchesBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      (icon: Icons.home_rounded, label: 'الرئيسية', active: false),
      (icon: Icons.location_on_rounded, label: 'ملاعب', active: false),
      (icon: Icons.add_box_rounded, label: 'مباريات', active: true),
      (icon: Icons.groups_rounded, label: 'فرق', active: false),
      (icon: Icons.account_circle_rounded, label: 'حسابي', active: false),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        height: 64,

        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border(0.06)),
          boxShadow: AppColors.tabBarShadow,
        ),

        child: Row(
          children: [
            for (final item in items)
              _BottomNavItem(
                icon: item.icon,
                label: item.label,
                active: item.active,
                onTap: () {},
              ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.active,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.accent : AppColors.textMuted;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 3,
              child: active
                  ? Center(
                      child: Container(
                        width: 24,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    )
                  : null,
            ),

            Icon(icon, size: 22, color: color),
            const SizedBox(height: 3),

            Text(
              label,
              style: GoogleFonts.tajawal(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

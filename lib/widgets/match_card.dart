import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../models/match_summary.dart';

/// Match list card (title, meta, progress, chips, CTA).
class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});

  final MatchSummary match;

  static const _positionTints = [
    AppColors.accent,
    AppColors.sky,
    AppColors.coral,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border(0.06)),
        boxShadow: AppColors.cardShadow,
      ),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        match.title,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          _chip(match.skillLabel, tint: AppColors.accent),
                          _chip(match.ageLabel, fontSize: 10),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),
                _neededBox(),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                _metaRow(
                  Icons.location_on_rounded,
                  match.locationLine,
                  mapLink: true,
                ),

                const SizedBox(height: 6),
                _metaRow(Icons.event_rounded, match.dateLine, mapLink: false),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'اللاعبين',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.tajawal(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${match.playersCurrent} / ${match.playersMax}',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: match.progress.clamp(0.0, 1.0),
                    minHeight: 6,
                    backgroundColor: AppColors.scaffold,
                    color: AppColors.accent,
                  ),
                ),

                if (match.positions.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (var i = 0; i < match.positions.length; i++)
                        _chip(
                          match.positions[i],
                          tint: _positionTints[i % _positionTints.length],
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              height: 44,
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: GoogleFonts.tajawal(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                child: Text(
                  'انضم للمباراة',
                  style: GoogleFonts.tajawal(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _neededBox() {
    final a = AppColors.accent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: a.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: a.withValues(alpha: 0.12)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(
            '${match.neededCount}',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              height: 1,
              color: a,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            'مطلوبين',
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, {Color? tint, double fontSize = 11}) {
    final decoration = tint != null
        ? BoxDecoration(
            color: tint.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: tint.withValues(alpha: 0.2)),
          )
        : BoxDecoration(
            color: Colors.black.withValues(alpha: 0.025),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.border()),
          );

    final fg = tint ?? AppColors.textSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: decoration,

      child: Text(
        label,
        style: GoogleFonts.tajawal(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }

  Widget _metaRow(IconData icon, String text, {required bool mapLink}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Icon(icon, size: 14, color: AppColors.textMuted),

        const SizedBox(width: 8),

        Expanded(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            children: [
              Text(
                text,
                textAlign: TextAlign.start,
                style: GoogleFonts.tajawal(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  height: 1.35,
                ),
              ),

              if (mapLink) _mapLink(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mapLink() {
    final c = AppColors.sky;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),

      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withValues(alpha: 0.2)),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(Icons.map_rounded, size: 12, color: c),

          const SizedBox(width: 4),

          Text(
            'خريطة',
            style: GoogleFonts.tajawal(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: c,
            ),
          ),
        ],
      ),
    );
  }
}

import '../models/match_summary.dart';

/// Demo data for the homework screen.
abstract final class SampleMatches {
  static List<MatchSummary> all() {
    return const [
      MatchSummary(
        title: 'مباراة ودية , خماسي',
        skillLabel: '⚡ متوسط',
        ageLabel: '👤 23-27 سنة',
        neededCount: 3,
        locationLine: 'ملعب السيب | 3.2 كم',
        dateLine: 'الجمعة 20 فبراير | ٧:٠٠ مساءً',
        playersCurrent: 7,
        playersMax: 10,
        positions: ['مهاجم', 'وسط ميدان', 'مدافع'],
      ),
      MatchSummary(
        title: 'مباراة تحدي, سباعي',
        skillLabel: '🏆 محترف',
        ageLabel: '👤 28-35 سنة',
        neededCount: 2,
        locationLine: 'ملعب القرم | 1.5 كم',
        dateLine: 'السبت 21 فبراير | ٨:٣٠ مساءً',
        playersCurrent: 12,
        playersMax: 14,
        positions: ['حارس مرمى', 'مهاجم'],
      ),
    ];
  }
}

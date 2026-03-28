/// One row in the matches list.
class MatchSummary {
  const MatchSummary({
    required this.title,
    required this.skillLabel,
    required this.ageLabel,
    required this.neededCount,
    required this.locationLine,
    required this.dateLine,
    required this.playersCurrent,
    required this.playersMax,
    required this.positions,
  });

  final String title;
  final String skillLabel;
  final String ageLabel;
  final int neededCount;
  final String locationLine;
  final String dateLine;
  final int playersCurrent;
  final int playersMax;
  final List<String> positions;

  double get progress => playersMax == 0 ? 0 : playersCurrent / playersMax;
}

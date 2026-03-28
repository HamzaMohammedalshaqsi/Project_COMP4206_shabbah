import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../data/sample_matches.dart';
import '../widgets/age_filter_chips.dart';
import '../widgets/match_card.dart';
import '../widgets/match_category_tabs.dart';
import '../widgets/matches_bottom_nav.dart';
import '../widgets/matches_search_field.dart';

class MatchesBrowsePage extends StatefulWidget {
  const MatchesBrowsePage({super.key});

  @override
  State<MatchesBrowsePage> createState() => _MatchesBrowsePageState();
}

class _MatchesBrowsePageState extends State<MatchesBrowsePage> {
  final TextEditingController _searchController = TextEditingController();
  int _categoryIndex = 0;
  int _ageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final matches = SampleMatches.all();

    //for arabic to render from right to left
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ).copyWith(top: 8, bottom: 100),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'المباريات',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.tajawal(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),

                      MatchesSearchField(
                        controller: _searchController,
                        onFilterPressed: () {},
                      ),

                      const SizedBox(height: 16),

                      MatchCategoryTabs(
                        selectedIndex: _categoryIndex,
                        onSelected: (i) => setState(() => _categoryIndex = i),
                      ),

                      const SizedBox(height: 18),

                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'الفئة العمرية',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.tajawal(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      AgeFilterChips(
                        selectedIndex: _ageIndex,
                        onSelected: (i) => setState(() => _ageIndex = i),
                      ),

                      const SizedBox(height: 16),

                      ...matches.map((m) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: MatchCard(match: m),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              const MatchesBottomNav(),
            ],
          ),
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 88),

          child: Material(
            color: Colors.transparent,

            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(999),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const Icon(
                      Icons.add_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),

                    Text(
                      'مباراة جديدة',
                      style: GoogleFonts.tajawal(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

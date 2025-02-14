import 'package:flutter/material.dart';
import 'package:one_cask/presentation/widgets/collection_widget/tap_content/history_content.dart';
import 'package:one_cask/presentation/widgets/collection_widget/tap_content/tasting_notes_content.dart';

import '../../widgets/collection_widget/tap_content/details_content.dart';

class BottleDetailTabs extends StatefulWidget {
  @override
  _BottleDetailTabsState createState() => _BottleDetailTabsState();
}

class _BottleDetailTabsState extends State<BottleDetailTabs> {
  int _selectedTab = 0;
  final List<String> _tabs = ["Details", "Tasting Notes", "History"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          _buildTabBar(theme),
          _buildTabContent(),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            "Bottle 135/184",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                "Talisker ",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              Text(
                "18 Year old",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 32,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Text(
            "#2504",
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 32,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTabBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final text = entry.value;
            final isSelected = _selectedTab == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                      color: isSelected ? Colors.black : Colors.white70,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: [
        DetailsContent(),
        TastingNotesContent(),
        HistoryContent()
        // TastingNotesContent(),
        // HistoryContent(),
      ][_selectedTab],
    );
  }
}

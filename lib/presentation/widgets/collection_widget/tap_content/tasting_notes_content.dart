import 'package:flutter/material.dart';

class TastingNotesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video player mockup
          _buildVideoPlayerMockup(context),

          // Testing notes header with two lines using theme colors
          _buildSectionHeaderWithSubtitle(
              "Testing Notes", "by Charles MacLean MBE", context),

          // Notes sections for "Nose", "Palate", and "Finish"
          _buildNoteSection(
              "Nose",
              [
                "Description 1",
                "Description 2",
                "Description 3",
              ],
              context),
          _buildNoteSection(
              "Palate",
              [
                "Description 1",
                "Description 2",
                "Description 3",
              ],
              context),
          _buildNoteSection(
              "Finish",
              [
                "Description 1",
                "Description 2",
                "Description 3",
              ],
              context),

          // Spacer
          SizedBox(height: 24),

          // Your notes header
          _buildSectionHeader("Your notes", context),

          // Notes sections for "Nose", "Palate", and "Finish"
          _buildNoteSection(
              "Nose",
              [
                "Description 1",
                "Description 2",
                "Description 3",
              ],
              context),
          _buildNoteSection(
              "Palate",
              [
                "Description 1",
                "Description 2",
                "Description 3",
              ],
              context),
          _buildNoteSection(
              "Finish",
              [
                "Description 1",
                "Description 2",
                "Description 3",
              ],
              context),
        ],
      ),
    );
  }

  // Video player mockup with a play button in the center
  Widget _buildVideoPlayerMockup(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      color:
          Theme.of(context).colorScheme.surface, // Use surface color from theme
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Placeholder for video content (blank screen)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black, // Blank screen (black color)
          ),
          // Play button in the center
          IconButton(
            onPressed: () {
              // Handle play button tap (for now, it does nothing)
              print("Play button tapped");
            },
            icon: Icon(Icons.play_arrow, size: 60, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Section header with subtitle using theme colors
  Widget _buildSectionHeaderWithSubtitle(
      String title, String subtitle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // color: Theme.of(context).primaryColor, // Use primary color
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context)
                  .colorScheme
                  .secondary, // Use secondary color
            ),
          ),
        ],
      ),
    );
  }

  // Section header text styling using theme colors
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: Theme.of(context).primaryColor, // Use primary color
        ),
      ),
    );
  }

  // Notes section for different categories (Nose, Palate, Finish)
  Widget _buildNoteSection(
      String title, List<String> descriptions, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              // color: Theme.of(context).primaryColor, // Use primary color
            ),
          ),
          SizedBox(height: 8),
          ...descriptions.map((desc) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant, // Use onSurface color
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

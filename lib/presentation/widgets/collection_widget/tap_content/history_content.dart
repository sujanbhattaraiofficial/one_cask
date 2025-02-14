import 'package:flutter/material.dart';

class HistoryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHistoryStep(
              title: "Label",
              descriptions: ["Description 1", "Description 2"],
              attachments: ["File 1", "File 2"],
              isFirst: true, // First step
            ),
            _buildHistoryStep(
              title: "Label",
              descriptions: ["Description 1", "Description 2"],
              attachments: ["File 1", "File 2"],
            ),
            _buildHistoryStep(
              title: "Label",
              descriptions: ["Description 1", "Description 2"],
              attachments: ["File 1", "File 2"],
              isLast: true, // Last step
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryStep({
    required String title,
    required List<String> descriptions,
    required List<String> attachments,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stepper with white circle and diamonds
        Column(
          children: [
            if (!isFirst) // Only show connector if not the first step
              _buildStepConnector(),
            _buildStepCircle(), // Starting Circle
            if (!isLast) // Only show connector if not the last step
              _buildStepConnector(),
          ],
        ),
        SizedBox(width: 16),
        // Step content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              ...descriptions.map((desc) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      desc,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  )),
              SizedBox(height: 12),
              // Attachments Section
              _buildAttachmentSection(attachments),
              SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  // Stepper Components
  Widget _buildStepCircle() {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildStepConnector() {
    return Container(
      width: 2,
      height: 20,
      color: Colors.grey[600],
    );
  }

  // Attachments Section
  Widget _buildAttachmentSection(List<String> attachments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.attach_file, color: Colors.white70, size: 20),
            SizedBox(width: 8),
            Text(
              "Attachments",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: attachments
              .map((attachment) => Container(
                    width: 50,
                    height: 50,
                    color: Colors.white24,
                    child: Center(
                      child: Text(
                        attachment,
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

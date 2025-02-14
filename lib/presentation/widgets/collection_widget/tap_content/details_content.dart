import 'package:flutter/material.dart';

import '../detail_row.dart';

class DetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailRow(label: "Distillery", value: "Text"),
        DetailRow(label: "Region", value: "Text"),
        DetailRow(label: "Country", value: "Text"),
        DetailRow(label: "Type", value: "Text"),
        DetailRow(label: "Age statement", value: "Text"),
        DetailRow(label: "Filled", value: "Text"),
        DetailRow(label: "Bottled", value: "Text"),
        DetailRow(label: "Cask number", value: "Text"),
        DetailRow(label: "ABV", value: "Text"),
        DetailRow(label: "Size", value: "Text"),
        DetailRow(label: "Finish", value: "Text"),
      ],
    );
  }
}

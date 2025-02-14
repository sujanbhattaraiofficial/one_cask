import 'package:flutter/material.dart';

import '../../widgets/collection_widget/add_to_collection_button.dart';
import '../../widgets/collection_widget/expandable_header.dart';
import 'bottle_detail_app_bar.dart';
import 'bottle_detail_tabs.dart';

class BottleDetailScreen extends StatefulWidget {
  @override
  _BottleDetailScreenState createState() => _BottleDetailScreenState();
}

class _BottleDetailScreenState extends State<BottleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottleDetailAppBar(
                title: "Genesis Collection",
                onClose: () => Navigator.pop(context),
              ),
              ExpandableHeader(
                title: "Genuine Bottle (Unopened)",
                child: Image.asset(
                  "assets/bottle.png",
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BottleDetailTabs(),
              ),
              AddToCollectionButton(
                onPressed: () {/* Add to collection functionality */},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

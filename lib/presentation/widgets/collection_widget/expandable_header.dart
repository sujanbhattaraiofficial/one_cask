import 'package:flutter/material.dart';

class ExpandableHeader extends StatefulWidget {
  final String title;
  final Widget child;

  const ExpandableHeader({
    required this.title,
    required this.child,
  });

  @override
  _ExpandableHeaderState createState() => _ExpandableHeaderState();
}

class _ExpandableHeaderState extends State<ExpandableHeader> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Column(
        children: [
          Container(
            color: theme.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 28,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.child,
            ),
        ],
      ),
    );
  }
}

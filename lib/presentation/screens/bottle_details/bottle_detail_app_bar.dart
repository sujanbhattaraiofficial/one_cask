import 'package:flutter/material.dart';

class BottleDetailAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const BottleDetailAppBar({
    required this.title,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white, size: 28),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

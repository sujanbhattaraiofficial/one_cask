import 'package:flutter/material.dart';

class AddToCollectionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCollectionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              "+ Add to my collection",
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

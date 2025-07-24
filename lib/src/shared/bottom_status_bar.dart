import 'package:flutter/material.dart';

class BottomStatusBar extends StatelessWidget {
  const BottomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      height: 30.0,
      child: Center(
        child: Text(
          'Bottom status bar',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

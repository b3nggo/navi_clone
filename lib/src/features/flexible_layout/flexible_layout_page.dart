import 'package:flutter/material.dart';

class FlexibleLayoutPage extends StatelessWidget {
  const FlexibleLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: Text('A layout')),
    );
  }
}

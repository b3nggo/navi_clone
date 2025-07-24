import 'package:flutter/material.dart';

const _description = 'A canvas that can carrying multiple layout';

class LayoutCanvasPage extends StatelessWidget {
  const LayoutCanvasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: Text(_description)),
    );
  }
}

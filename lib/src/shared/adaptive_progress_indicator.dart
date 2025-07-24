import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  const AdaptiveProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final valueColor = AlwaysStoppedAnimation<Color>(colors.onSurface);

    return Material(
      color: colors.surface,
      child: Center(
        child: CircularProgressIndicator.adaptive(valueColor: valueColor),
      ),
    );
  }
}

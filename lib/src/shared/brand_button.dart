import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BrandButton extends StatelessWidget {
  const BrandButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onPressed,
      child: SvgPicture.asset(
        kNaviIcon,
        colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
      ),
    );
  }
}

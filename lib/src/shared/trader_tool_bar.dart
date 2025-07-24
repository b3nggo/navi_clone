import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'image_html.dart';

const _avatar = 'https://github.com/mirhasalh.png';

class TraderToolBar extends StatelessWidget {
  const TraderToolBar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      height: 45.0,
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          title,
          const Spacer(),
          SizedBox(
            width: 24.0,
            height: 24.0,
            child: ClipOval(
              child: kIsWeb
                  ? const ImageHTML(src: _avatar, alt: 'mirhasalh')
                  : Image.network(_avatar),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}

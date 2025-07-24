import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

class ImageHTML extends StatelessWidget {
  const ImageHTML({
    super.key,
    required this.src,
    this.alt,
    this.title,
    this.width,
    this.height,
  });

  final String src;
  final String? alt;
  final String? title;
  final String? width;
  final String? height;

  @override
  Widget build(BuildContext context) {
    return HtmlElementView.fromTagName(
      tagName: 'img',
      onElementCreated: (imgElement) {
        imgElement as web.HTMLElement;
        imgElement.setAttribute('src', src);
        if (alt != null) imgElement.setAttribute('alt', alt!);
        if (title != null) imgElement.setAttribute('title', title!);
        if (width != null) imgElement.style.width = width!;
        if (height != null) imgElement.style.height = height!;
      },
    );
  }
}

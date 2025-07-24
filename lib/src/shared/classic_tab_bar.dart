import 'package:flutter/material.dart';

class ClassicTabBar extends StatelessWidget {
  const ClassicTabBar({
    super.key,
    required this.onAddNewTab,
    required this.tabs,
  });

  final VoidCallback onAddNewTab;
  final List<ClassicTab> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      height: 35.0,
      child: Row(
        children: [
          const SizedBox(width: 80.0),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabs,
            ),
          ),
          _AddClassicTabButton(onPressed: onAddNewTab),
        ],
      ),
    );
  }
}

class ClassicTab extends StatelessWidget {
  const ClassicTab({
    super.key,
    required this.showCloseButton,
    required this.onPressed,
    required this.name,
    required this.onClose,
    required this.active,
  });

  final bool showCloseButton;
  final VoidCallback onPressed;
  final VoidCallback onClose;
  final String name;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: active
                  ? null
                  : Theme.of(context).scaffoldBackgroundColor,
              onPressed: onPressed,
              child: Text(name),
            ),
          ),
          Positioned(
            right: 4.0,
            child: Visibility(
              visible: showCloseButton,
              replacement: const SizedBox.shrink(),
              child: SizedBox(
                height: 22.0,
                width: 22.0,
                child: IconButton(
                  onPressed: onClose,
                  padding: EdgeInsets.zero,
                  iconSize: 16.0,
                  icon: const Icon(Icons.close),
                  tooltip: 'Close',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddClassicTabButton extends StatelessWidget {
  const _AddClassicTabButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
        size: 16.0,
      ),
    );
  }
}

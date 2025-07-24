import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart' show Colors;
import 'package:window_manager/window_manager.dart';

Future<void> determineWindowOptions() async {
  if (Platform.isLinux && Platform.isMacOS && Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 800),
      minimumSize: Size(768, 600),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}

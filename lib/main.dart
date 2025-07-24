import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/providers.dart';
import 'src/utils/window_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) await determineWindowOptions();
  runApp(MultiBlocProvider(providers: providers, child: const App()));
}

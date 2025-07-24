import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/adaptive_progress_indicator.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _onAuth();
  }

  @override
  Widget build(BuildContext context) {
    return const AdaptiveProgressIndicator();
  }

  Future<void> _onAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) context.go('/canvas');
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/pages.dart';

var _navigatorKey = GlobalKey<NavigatorState>();
var _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _navigatorKey,
  // Initially, we land on the AuthPage, which displays only an adaptive
  // progress indicator to signal that user credentials are being prepared
  // in the background.
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const AuthPage();
      },
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ShellPage(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/canvas',
              builder: (BuildContext context, GoRouterState state) {
                return const LayoutCanvasPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

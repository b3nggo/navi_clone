import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../shared/bottom_status_bar.dart';
import '../../shared/brand_button.dart';
import '../../shared/classic_tab_bar.dart';
import '../../shared/trader_tool_bar.dart';
import 'shell_states.dart';

const _maxTabsMessage = 'You\'ve reached the maximum number of open tabs.';

class ShellPage extends StatelessWidget {
  const ShellPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _TabBarBloc(),
          Expanded(
            child: Row(
              children: [
                const _NavBloc(),
                Expanded(
                  child: Column(
                    children: [
                      const _ToolBarBloc(),
                      Expanded(child: child),
                      const BottomStatusBar(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBloc extends StatelessWidget {
  const _NavBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedIndexCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationRail(
          onDestinationSelected: (index) {
            context.read<SelectedIndexCubit>().setIndex(index);
          },
          leading: BrandButton(onPressed: () {}),
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Badge(child: Icon(Icons.bookmark_border)),
              selectedIcon: Badge(child: Icon(Icons.book)),
              label: Text('Second'),
            ),
          ],
          selectedIndex: selectedIndex,
        );
      },
    );
  }
}

class _TabBarBloc extends StatelessWidget {
  const _TabBarBloc();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final tabs = context.watch<TabsCubit>().state;
        final activeTabIndex = context.watch<ActiveTabIndex>().state;

        return ClassicTabBar(
          onAddNewTab: () {
            final msg = ScaffoldMessenger.of(context);
            if (tabs.length < kMaxTabs) {
              context.read<TabsCubit>().addTab();
            } else {
              msg.hideCurrentSnackBar();
              msg.showSnackBar(const SnackBar(content: Text(_maxTabsMessage)));
            }
          },
          tabs: List.generate(
            tabs.length,
            (i) => ClassicTab(
              showCloseButton: tabs.length > 1,
              onPressed: () => context.read<ActiveTabIndex>().setActiveTab(i),
              name: tabs[i]['name']!,
              active: i == activeTabIndex,
              onClose: () {
                context.read<TabsCubit>().removeTab(i);
                if (tabs.length == 2) {
                  context.read<ActiveTabIndex>().setActiveTab(0);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _ToolBarBloc extends StatelessWidget {
  const _ToolBarBloc();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ActiveTabIndex, int>(
      builder: (context, tabIndex) {
        return TraderToolBar(
          title: Text(
            'Active tab index: $tabIndex',
            style: textTheme.titleLarge,
          ),
        );
      },
    );
  }
}

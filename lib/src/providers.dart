import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/states.dart';

final providers = [
  BlocProvider<SelectedIndexCubit>(create: (_) => SelectedIndexCubit()),
  BlocProvider<TabsCubit>(create: (_) => TabsCubit()),
  BlocProvider<ActiveTabIndex>(create: (_) => ActiveTabIndex()),
];

import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedIndexCubit extends Cubit<int> {
  SelectedIndexCubit() : super(0);

  void setIndex(int index) => emit(index);
}

class TabsCubit extends Cubit<List<Map<String, String>>> {
  TabsCubit()
    : super([
        {'name': 'New tab'},
      ]);

  void addTab() {
    final newTab = {'name': 'New tab'};
    emit([...state, newTab]);
  }

  void removeTab(int index) {
    final updatedTabs = List<Map<String, String>>.from(state);
    updatedTabs.removeAt(index);
    emit(updatedTabs);
  }
}

class ActiveTabIndex extends Cubit<int> {
  ActiveTabIndex() : super(0);

  void setActiveTab(int index) => emit(index);
}

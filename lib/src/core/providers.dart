import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentScreenIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final isLoadingProvider = StateProvider<bool>((ref) => false);

final isSearchProvider = StateProvider<bool>((ref) => false);

final searchCityResultProvider = StateProvider<String>((ref) => 'Search Cities');


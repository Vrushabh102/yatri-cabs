import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentScreenIndexProvider = StateProvider<int>((ref) {
  return 0;
});

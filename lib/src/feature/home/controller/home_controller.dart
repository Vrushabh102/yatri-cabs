import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityFilterNotifier extends StateNotifier<List<String>> {
  final List<String> allCities;

  CityFilterNotifier(this.allCities) : super(allCities);

  // Method to filter cities based on user input
  void filterCities(String query) {
    if (query.isEmpty) {
      state = allCities;
    } else {
      state = allCities.where((city) => city.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  void clearFilterCities() {
    state = [];
  }
}

final cityFilterProvider = StateNotifierProvider<CityFilterNotifier, List<String>>(
  (ref) => CityFilterNotifier([
    'Mumbai, Maharashtra',
    'Nagpur, Maharashtra',
    'Pune, Maharashtra',
    'Nashik, Maharashtra',
    'Aurangabad, Maharashtra',
    'Jaipur, Rajasthan',
    'Bengaluru, Karnataka',
    'Kolkata, West Bengal',
    'Chennai, Tamil Nadu',
    'New Delhi, Delhi',
  ]),
);

class HomeController {
  // class for managing home feature
}

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/repository/repository.dart';
import 'package:yatri_cabs/src/models/city_model.dart';

final searchQueryProvider = StateProvider((ref) => '');

final cityControllerProvider = Provider<CityController>((ref) {
  return CityController(cityRepository: ref.read(cityRepositoryProvider));
});

class CityController {
  final CityRepository _cityRepository;

  CityController({required CityRepository cityRepository}) : _cityRepository = cityRepository;

  searchCities(String keyword) async {
    final result = await _cityRepository.searchCities(keyword);

    if (result != null) {
      Map data = result;
      List cities = data['data'];

      List<CityModel> model = cities.map((e) => CityModel.fromMap(e)).toList();

      log('converted${model[0].name}');
      log(model[1].name);

      return model;
    }
  }
}

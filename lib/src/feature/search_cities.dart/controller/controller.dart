import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/repository/repository.dart';

final searchQueryProvider = StateProvider((ref) => '');

final cityControllerProvider = Provider<CityController>((ref) {
  return CityController(cityRepository: ref.read(cityRepositoryProvider));
});

class CityController {
  final CityRepository _cityRepository;

  CityController({required CityRepository cityRepository}) : _cityRepository = cityRepository;

  searchCities(String keyword) async {
    await _cityRepository.searchCities(keyword);
  }
}

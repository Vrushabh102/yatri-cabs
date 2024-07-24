import 'dart:developer';
import 'dart:html';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yatri_cabs/src/core/api.dart';

final cityRepositoryProvider = Provider((ref) {
  return CityRepository();
});

class CityRepository {
  CityRepository();

  searchCities(String keyword) async {
    String baseUrl = Api.baseUrl;
    log("$baseUrl&keyword=$keyword");
    Uri query = Uri.parse(
      "$baseUrl&keyword=$keyword",
    );
    final response = await http.get(
      query,
      headers: {
        'content-type': 'application/vnd.amadeus+json',
      },
      
    );

    log(response.body);
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yatri_cabs/src/core/api.dart';

final cityRepositoryProvider = Provider((ref) {
  return CityRepository();
});

class CityRepository {
  CityRepository();

  testApi(String keyword) async {
    // String baseUrl = Api.baseUrl;
    // log("$baseUrl&keyword=$keyword");
    // Uri query = Uri.parse(
    //   "$baseUrl&keyword=$keyword",
    // );
    // final response = await http.post(
    //   query,
    //   headers: {
    //     'content-type': 'application/vnd.amadeus+json',
    //     'acess_token' : ''
    //   },
    //   b

    // );

    // log(response.body);

    const url = 'https://test.api.amadeus.com/v1/security/oauth2/token';
    const clientId = 'WmovvYlEXqZtWo3O1I68flRED51Rhrbn';
    const clientSecret = 'T9yRpDmA9p9zAMGr';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );

    log(response.body);
  }

  searchCities(String keyword) async {
    String baseUrl = Api.baseUrl;
    Uri query = Uri.parse(
      "$baseUrl&keyword=$keyword",
    );

    final response = await http.get(query, headers: {
      'Authorization': 'Bearer ${Api.accessToken}',
    });
    log((response is List).toString());

    log(response.body);
    if (response.statusCode == 200) {
      final responseBody = response.body;
      log(responseBody);
      return jsonDecode(responseBody);
      // Parse and use the data as needed
    } else {
      // Handle error
      log('Failed to fetch flight destinations. Status code: ${response.statusCode}');
      log('Response Body: ${response.body}');
      return null;
    }
  }
}

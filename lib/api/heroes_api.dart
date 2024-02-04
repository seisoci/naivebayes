import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naivebayes/models/Predict.dart';

import '../models/heroes.dart';

class HeroApi {
  static Future<List<Heroes>> fetchHeroes() async {
    const baseUrl = 'http://192.168.1.6:8000/api/heroes';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Heroes> heroes = data
          .map(
            (heroData) => Heroes.fromJson(heroData),
      )
          .toList();

      return heroes;
    } else {
      print('Error: ${response.body}');
      print('Status Code: ${response.statusCode}');
      throw Exception('Could not retrieve data from api');
    }
  }

  static Future<Predict> fetchPredict() async {
    const baseUrl = 'http://192.168.1.6:8000/api/predict';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
     return Predict.fromJson(jsonDecode(response.body));
    } else {
      print('Error: ${response.body}');
      print('Status Code: ${response.statusCode}');
      throw Exception('Could not retrieve data from api');
    }
  }

  static Future<String> sendPostPredict(Map<String, dynamic> data) async {
    const baseUrl = 'http://192.168.1.6:8000/api/predict';
    print("debug: ${jsonEncode(data)}");
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(data),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result.toString();
    } else {
      print('Error: ${response.body}');
      print('Status Code: ${response.statusCode}');
      throw Exception('Could not retrieve data from api');
    }
  }
}

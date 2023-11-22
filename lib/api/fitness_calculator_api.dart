import 'dart:convert';

import 'package:gs_2/models/daily_calorie.dart';
import 'package:http/http.dart' as http;

class FitnessCalculatorApi {
  final String baseUrl = 'https://fitness-calculator.p.rapidapi.com/';
  final String key = 'c826fd375cmsh81e600993822257p19a5a6jsn01fb2b84fc38';
  final String host = 'fitness-calculator.p.rapidapi.com';

  //R criem o metodo abaixo para fazer a requisição e retornar um DailyCalorie
  Future<DailyCalorie?> getDailyCalories ({required int age, required String genre, required int weight, required int height, required int activityLevel,}) async {
    final url = '${baseUrl}dailycalorie?age=$age&gender=$genre&weight=$weight&height=$height&activitylevel=$activityLevel';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'X-RapidAPI-Key': key,
        'X-RapidAPI-Host': host,
      }
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return DailyCalorie.fromJson(json['data']);
    } else {
      return null;
    }

  }
  
}

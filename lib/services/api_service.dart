import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';

class ApiService {
  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(
      Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s="),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['meals'];
      return data.map<Meal>((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception("API Error");
    }
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal_model.dart';
import '../services/api_service.dart';

class MealProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  List<Meal> meals = [];
  List<Meal> filteredMeals = [];

  bool isLoading = false;
  String message = "";

  Future<void> fetchMeals() async {
    isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();

      meals = await apiService.fetchMeals();
      filteredMeals = meals;

      prefs.setString(
        'meal_cache',
        jsonEncode(meals.map((e) => e.toJson()).toList()),
      );

      message = "";
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      final cache = prefs.getString('meal_cache');

      if (cache != null) {
        final decoded = jsonDecode(cache);
        meals = decoded.map<Meal>((e) => Meal.fromJson(e)).toList();
        filteredMeals = meals;

        message = "📦 Offline mode: showing saved data";
      } else {
        message = "❌ No internet & no cached data";
      }
    }

    isLoading = false;
    notifyListeners();
  }

  // 🔍 SEARCH
  Future<void> searchMeals(String query) async {
    await Future.delayed(Duration(milliseconds: 300));

    if (query.isEmpty) {
      filteredMeals = meals;
    } else {
      filteredMeals = meals.where((meal) {
        return meal.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  // 🎯 FILTER
  void filterByCategory(String category) {
    filteredMeals = meals.where((meal) {
      return meal.category == category;
    }).toList();

    notifyListeners();
  }
}
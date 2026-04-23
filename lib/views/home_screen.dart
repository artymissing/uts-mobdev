import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';
import '../widgets/meal_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MealProvider>(context, listen: false).fetchMeals());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Meal App")),
      body: Column(
        children: [
          // 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search meals...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                provider.searchMeals(value);
              },
            ),
          ),

          // 🎯 FILTER
          DropdownButton<String>(
            hint: Text("Filter Category"),
            items: ["Beef", "Chicken", "Dessert", "Seafood"]
                .map((cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                provider.filterByCategory(value);
              }
            },
          ),

          // ⚠️ MESSAGE
          if (provider.message.isNotEmpty)
            Text(provider.message, style: TextStyle(color: Colors.orange)),

          // 📦 CONTENT
          Expanded(
            child: provider.isLoading
                ? LoadingWidget()
                : provider.filteredMeals.isEmpty
                    ? CustomErrorWidget(message: provider.message)
                    : ListView.builder(
                        itemCount: provider.filteredMeals.length,
                        itemBuilder: (context, index) {
                          return MealCard(
                              meal: provider.filteredMeals[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
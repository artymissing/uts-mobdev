class Meal {
  final String name;
  final String category;
  final String image;

  Meal({
    required this.name,
    required this.category,
    required this.image,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['strMeal'],
      category: json['strCategory'],
      image: json['strMealThumb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': name,
      'strCategory': category,
      'strMealThumb': image,
    };
  }
}
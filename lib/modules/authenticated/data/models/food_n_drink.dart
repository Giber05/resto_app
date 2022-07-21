class FoodNDrink {
  String name;

  FoodNDrink({required this.name});
   factory FoodNDrink.fromJson(Map<String, dynamic> json) {
    return FoodNDrink(name: json['name']);
  }
}

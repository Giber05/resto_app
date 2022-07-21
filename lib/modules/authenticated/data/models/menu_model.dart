
import 'package:resto_app/modules/authenticated/data/models/food_n_drink.dart';

class MenuModel {
  List<FoodNDrink> foods = [];
  List <FoodNDrink> drinks = [];

  MenuModel({required this.drinks, required this.foods});

  MenuModel.fromJson(Map<String, dynamic> json) {
    var fList = json["foods"] as List;
    var dList = json["drinks"] as List;

    List<FoodNDrink> foodList = fList.map((i) => FoodNDrink.fromJson(i)).toList();
    List<FoodNDrink> drinkList = dList.map((i) => FoodNDrink.fromJson(i)).toList();

    foods = foodList;
    drinks = drinkList;
  }
}

import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../components/meals_items.dart';

class CategoriesMeals extends StatelessWidget {
  final List<Meal>? meals;
  const CategoriesMeals({Key? key, this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = meals!.where((meals) {
      return meals.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}

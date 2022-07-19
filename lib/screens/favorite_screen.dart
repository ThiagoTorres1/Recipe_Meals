import 'package:flutter/material.dart';
import 'package:meals/components/meals_items.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>? favoriteMeals;
  const FavoriteScreen({Key? key, this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals!.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals![index]);
        },
      );
    }
  }
}

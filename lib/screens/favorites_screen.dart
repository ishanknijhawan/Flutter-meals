import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? Text('No favorite dishes added!')
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealsItem(
                    title: favoriteMeals[index].title,
                    imageUrl: favoriteMeals[index].imageUrl,
                    complexity: favoriteMeals[index].complexity,
                    affordability: favoriteMeals[index].affordability,
                    duration: favoriteMeals[index].duration,
                    removeItem: null,
                    id: favoriteMeals[index].id);
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}

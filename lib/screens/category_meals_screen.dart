import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';
import '../data/dummy_meal_date.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals';
  //this is needed if you want to pass values as 'normal' push
  // final String title;
  // final String id;

  // CategoryMealsScreen(this.title, this.id);

  @override
  Widget build(BuildContext context) {
    //routeArgs variable if passing through pushNamed
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            id: categoryMeals[index].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meals_item.dart';
import '../data/dummy_meal_date.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  final List<Meal> categoryMeals;

  CategoryMealsScreen(this.categoryMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var isInitialized = false;

  @override
  void initState() {
    //initState is not used because of routeName which is triggered after initState
    super.initState();
  }

  //study more about this function!
  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final id = routeArgs['id'];
      displayedMeals = widget.categoryMeals.where((element) {
        return element.categories.contains(id);
      }).toList();
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //routeArgs variable if passing through pushNamed
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            id: displayedMeals[index].id,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

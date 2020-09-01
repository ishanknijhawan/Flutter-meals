import 'package:flutter/material.dart';
import './data/dummy_meal_date.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> categoryMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void toggleFavorites(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((element) => element.id == mealId);
  }

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    setState(() {
      categoryMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Roboto",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      title: 'Meals App',
      //home: CategoryScreen(),
      // in case you want custom initial route
      initialRoute: '/',
      //you can also use onGenerateRoute and onUnknownRoute sometimes (Lec 169)
      routes: {
        // slash ('/') is Home by default, so even if you remove home argument above
        // it will still work
        '/': (ctx) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(categoryMeals),
        MealDetails.routeName: (ctx) =>
            MealDetails(toggleFavorites, isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

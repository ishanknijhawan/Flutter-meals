import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetails.routeName: (ctx) => MealDetails(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
    );
  }
}

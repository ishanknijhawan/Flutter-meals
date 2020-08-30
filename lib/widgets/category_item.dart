import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMealScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.headline6),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.70), color.withOpacity(0.75), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void showMealScreen(BuildContext ctx) {
    // if you want to push normally, do like this
    // Navigator.push(
    //   ctx,
    //   MaterialPageRoute(
    //     builder: (_) => CategoryMealsScreen(title, id),
    //   ),
    // );

    //or, you can also pass it as named arguments
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }
}

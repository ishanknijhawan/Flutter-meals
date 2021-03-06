import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../data/dummy_meal_date.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: GridView(
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.title, e.color, e.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}

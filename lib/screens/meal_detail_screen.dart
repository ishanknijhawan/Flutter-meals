import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_meal_date.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function toggleFavs;
  final Function isFavorite;

  MealDetails(this.toggleFavs, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
            icon: isFavorite(mealId)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              toggleFavs(mealId);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: selectedMeal.imageUrl,
                child: Image.network(selectedMeal.imageUrl)),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              height: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: ListView.builder(
                itemBuilder: (context, i) => Text(
                  selectedMeal.ingredients[i],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Recipe',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemBuilder: (context, i) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Text(selectedMeal.steps[i]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ]),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}

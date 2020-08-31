import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String id;
  final Function removeItem;

  MealsItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.complexity,
      @required this.affordability,
      @required this.duration,
      @required this.removeItem,
      @required this.id});

  @override
  Widget build(BuildContext context) {
    String aff;
    if (affordability == Affordability.Affordable) {
      aff = 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      aff = 'Pricey';
    } else {
      aff = 'Luxirious';
    }
    String eff;
    if (complexity == Complexity.Simple) {
      eff = 'Simple';
    } else if (complexity == Complexity.Challenging) {
      eff = 'Challenging';
    } else {
      eff = 'Hard';
    }
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => openMealDetails(context),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(children: [
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Hero(
                      tag: imageUrl,
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 250,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '$duration min',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          aff,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.ac_unit),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          eff,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  void openMealDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetails.routeName,
      arguments: {
        'title': title,
        'id': id,
      },
    ).then((value) {
      if (value != null) {
        removeItem(value);
      }
    });
  }
}

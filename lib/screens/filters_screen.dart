import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  final Function setFilters;
  final Map<String, bool> filterData;

  FiltersScreen(this.setFilters, this.filterData);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;

  @override
  initState() {
    isGlutenFree = widget.filterData['gluten'];
    isLactoseFree = widget.filterData['lactose'];
    isVegetarian = widget.filterData['vegetarian'];
    isVegan = widget.filterData['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function onTapp) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onTapp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _filters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian
              };

              widget.setFilters(_filters);
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals here',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten Free', 'Show only Gluten free meals', isGlutenFree,
                    (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),
                buildSwitchListTile('Lactose Free',
                    'Show only Lactose free meals', isLactoseFree, (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Show only vegetarian meals', isVegetarian,
                    (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                }),
                buildSwitchListTile('Vegan', 'Show only vegane meals', isVegan,
                    (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

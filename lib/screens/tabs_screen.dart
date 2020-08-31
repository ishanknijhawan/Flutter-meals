//if you want to show tabs at top

// import 'package:flutter/material.dart';
// import 'package:meals_app/screens/categories_screen.dart';
// import 'package:meals_app/screens/favorites_screen.dart';

// class TabsScreen extends StatefulWidget {
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals App'),
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.favorite),
//                   text: 'Favorites',
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(children: [
//             CategoryScreen(),
//             FavoritesScreen(),
//           ]),
//         ));
//   }
// }

//if you want tabs to show at bottom

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {'pages': CategoryScreen(), 'title': 'Categories'},
    {'pages': FavoritesScreen(), 'title': 'Favorites'}
  ];
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            selectedPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

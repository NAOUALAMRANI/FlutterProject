// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import '../screens/categories_screen.dart';
// import 'favorites_Screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen ({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Tourist guide'),
//           bottom: const TabBar(
//             // ignore: prefer_const_literals_to_create_immutables
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text:'Categories' ,
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text:'Favorite' ,
//               ),
//             ]),
//         ),
//         body: TabBarView(
//           // ignore: prefer_const_literals_to_create_immutables
//           children: [
//             categoriesScreen(),
//             FavoritesScreen()

//           ],),
//       ),
//     );
//   }
// }

//video(16)
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import '../screens/categories_screen.dart';
import './favorites_Screen.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);
  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

// '_' kadkhalli widget privé pour ce fichier selement

  int _selectedScreenIndex = 0;

  //final List<Widget> _screens = [categoriesScreen(), FavoritesScreen()]; //tariqa 3adiya d list
  // object kate3tina acces n3emlo des differents values avec different type
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
    {
      'Screen': categoriesScreen(),
      'Title': 'Categories of trips',
    },
    {'Screen': FavoritesScreen(widget.favoriteTrips), 
      'Title': 'Favorite trips'}
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["Screen"].toString()),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]["Screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        // ignore: deprecated_member_use
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex, // kadekhdem fhal hover
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}

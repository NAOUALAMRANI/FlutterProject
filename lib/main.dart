import 'package:flutter/material.dart';
import './app_data.dart';
import './models/trip.dart';
import './screens/filters_screen.dart';
//import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_trips_screen.dart';
import '../screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get categoryId => null;

  get categoryTitle => null;

  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];
  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // اتجاه الخط
      //   localizationsDelegates: [
      //    GlobalMaterialLocalizations.delegate,
      //    GlobalWidgetsLocalizations.delegate,
      //    GlobalCupertinoLocalizations.delegate,
      //  ],
      //  supportedLocales: [
      //    Locale('en', ''), // English, no country code
      //    Locale('es', ''), // Spanish, no country code
      //  ],
      title: 'Travel APP',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // ignore: deprecated_member_use
          accentColor: Colors.amber,
          fontFamily: 'Kalam',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 24,
                fontFamily: 'Kalam',
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Kalam',
                fontWeight: FontWeight.bold,
              ))),
      // home: categoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips), //kikhdem fhal home!!
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) =>
            TripDetailScreen(_manageFavorite, _isFavorite ),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}

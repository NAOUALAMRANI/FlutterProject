import 'package:flutter/material.dart';
import 'package:untitled/screens/categories_screen.dart';
import 'package:untitled/screens/category_trips_screen.dart';
import './screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get categoryId => null;

  get categoryTitle => null;

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
          accentColor: Colors.blue,
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
        '/': (ctx) => const categoriesScreen(), //kikhdem fhal home!!
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(categoryId, categoryTitle),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen()
      },
    );
  }
}

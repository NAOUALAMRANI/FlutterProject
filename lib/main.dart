// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          headline5: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'Kalam',
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'Kalam',
            fontWeight: FontWeight.bold,
          )
        ) 
      ),
      home: categoriesScreen(),
    );
  }
}

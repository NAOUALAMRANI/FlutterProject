// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$tripId'),
      ),
      body: Center(
      child: Text('$tripId This page for details trip '),
    ),
    );
    
  }
}

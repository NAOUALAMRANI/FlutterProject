import 'package:flutter/material.dart';

class CategoryTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Tips')
        ,),
        body: Center(
          child: Text('List of trips for this category'),)

    );
  }
}

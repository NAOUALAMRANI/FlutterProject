import 'package:flutter/material.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';
  CategoryTripsScreen(categoryId, categoryTitle);

  // final String categoryId;
  // final String categoryTitle;

  // // ignore: use_key_in_widget_constructors
  // const CategoryTripsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final 
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body:  ListView.builder(
          itemBuilder: (ctx,index) {
            return Text(filterdTrips[index].title);
          },
          itemCount: filterdTrips.length,

        ) 
        /*   const Center(
           child: Text('List of trips for this category'),
        )*/);
  }
}

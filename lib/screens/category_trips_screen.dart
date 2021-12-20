import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  CategoryTripsScreen(categoryId, categoryTitle);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;
  @override
  void initState() {
    //kade3ml mushkil ida kan 3ana deja un context 
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'].toString();
    displayTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            //return Text(filterdTrips[index].title); kant ghir n title
            return TripItem(
                id: displayTrips[index].id,
                title: displayTrips[index].title,
                imageUrl: displayTrips[index].imageUrl,
                duration: displayTrips[index].duration,
                tripType: displayTrips[index].tripType,
                season: displayTrips[index].season,
                removeItem: _removeTrip,
                );
          },
          itemCount: displayTrips.length,
        )
        /*   const Center(
           child: Text('List of trips for this category'),
        )*/
        );
  }
}

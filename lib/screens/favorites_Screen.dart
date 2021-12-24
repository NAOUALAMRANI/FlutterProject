// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen(List<Trip> favoriteTrips, {Key? key}) : super(key: key);

  final List<Trip> favoriteTrips;
  FavoritesScreen(this.favoriteTrips);
  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text('You do not have any trip in this list'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          //return Text(filterdTrips[index].title); kant ghir n title
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season, 
            //removeItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}

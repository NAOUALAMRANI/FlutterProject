import 'package:flutter/material.dart';
import '../screens/trip_detail_screen.dart';
import '../models/trip.dart';

//تصميم رحلة
class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final Function removeItem;

  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.removeItem,
  });
  String get seasonText {
    // if (season == Season.Winter) {
    //   return 'Winter';
    // }
    // if (season == Season.Spring) {
    //   return 'Spring';
    // }
    // if (season == Season.Summer) {
    //   return 'Summer';
    // }
    // if (season == Season.Autumn) {
    //   return 'Autumn';
    // }

    switch (season) {
      case Season.Winter:
        return 'Winter';
        break;
      case Season.Spring:
        return 'Spring';
        break;
      case Season.Summer:
        return 'Summer';
        break;
      case Season.Autumn:
        return 'Autumn';
        break;
      default:
        return 'Unknown';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'Exploration';
        break;
      case TripType.Recovery:
        return 'Recovery';
        break;
      case TripType.Activities:
        return 'Activities';
        break;
      case TripType.Therapy:
        return 'Therapy';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripDetailScreen.screenRoute, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectTrip(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 250,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [0.6, 1],
                      ),
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.today,
                          // ignore: deprecated_member_use
                          color: Theme.of(context).accentColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration Days')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          // ignore: deprecated_member_use
                          color: Theme.of(context).accentColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(seasonText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.family_restroom,
                          // ignore: deprecated_member_use
                          color: Theme.of(context).accentColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(tripTypeText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

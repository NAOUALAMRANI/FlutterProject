// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  final Function manageFavorite;
  final Function isFavorite;

  TripDetailScreen(this.manageFavorite, this.isFavorite);

  //const TripDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        alignment: Alignment.topLeft,
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.headline5,
        ));
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('${selectedTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'Activities'),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 15, vertical:10 ),
            //   alignment: Alignment.topLeft ,
            //   child:Text('Activities', style:Theme.of(context).textTheme.headline5 ,) ,
            // ),
            // Container(
            //   decoration:BoxDecoration(
            //     color:  Colors.white,
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   height: 200,
            //   padding: EdgeInsets.all(10),
            //   margin:EdgeInsets.symmetric(horizontal: 15) ,
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'Daily program'),
            buildListViewContainer(ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('Day ${index + 1}'),
                          ),
                          title: Text(selectedTrip.program[index]),
                        ),
                        const Divider(),
                      ],
                    ))),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: //Icon(Icons.star),
               Icon(
                 isFavorite(tripId) ? Icons.star : Icons.star_border
               ),
          // onPressed: () {
          //   Navigator.of(context).pop(tripId);
          // },
          onPressed: () =>{
            manageFavorite(tripId)
          }),
    );
  }
}

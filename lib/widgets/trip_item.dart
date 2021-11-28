import 'package:flutter/material.dart';
import '../models/trip.dart';

//تصميم رحلة
class TripItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  TripItem({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
  });

  

  void selectTrip() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectTrip,
      child : Card(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15)
           ),
           elevation: 7,
           margin:const EdgeInsets.all(10) ,
           child:Column(
             children: [
               Stack(
                 children: [
                   ClipRRect(
                     borderRadius:const BorderRadius.only(
                       topLeft: Radius.circular(15),
                       topRight:  Radius.circular(15)
                     ),
                     child: Image.network(imageUrl,
                     height:250 ,
                     width: double.infinity ,
                     fit: BoxFit.cover,
                     ),
                   ),
                    Container(
                      height: 250,
                      alignment:Alignment.bottomLeft ,
                      padding:const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.8),
                          ],
                          stops: const [ 0.6, 1],
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
                   children: [
                     Row(
                       children: [
                         // ignore: deprecated_member_use
                         Icon(Icons.wb_sunny, color:Theme.of(context).accentColor,),
                         const SizedBox(
                           width:6 ,
                         ),
                         Text('$duration Days')
                       ],
                     ),
                   ],
                 ),
               )
             ],
           ) ,
      )
    );
  }
}

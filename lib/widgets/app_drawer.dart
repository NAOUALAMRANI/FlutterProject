import 'package:flutter/material.dart';

class AppDrawer  extends StatelessWidget {
  const AppDrawer ({ required Key key }) : super(key: key);
  

  Widget  buildListTile(String title, IconData icon, Function onTapLink) {
    return ListTile(
     leading: Icon(
       icon, 
       size: 30,
       color: Colors.blue,
     ),
     title:  Text(
       title,
       style: const TextStyle(
         fontFamily: 'Kalam',
         fontSize: 24, 
         fontWeight: FontWeight.bold,
       ),
     ),
     onTap: onTapLink 

          );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            // ignore: deprecated_member_use
            color: Theme.of(context).accentColor,
            child: Text('Your Travel Guide',style: Theme.of(context).textTheme.headline6
            ),
          ),
          const SizedBox(height: 20,),
          buildListTile(), 

        ],
      ),
    );
  }
}

  

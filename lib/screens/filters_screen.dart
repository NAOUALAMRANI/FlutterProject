import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key? key}) : super(key: key);

  static const screenRoute = '/filter';

  final Function saveFilters;
  FiltersScreen(this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}
class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  Widget buildSwitchListTile(String title, String subtitle, var currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed:(){widget.saveFilters();},
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile('the Summer trips only',
                    'Show only summer trips', _isInSummer, (newValue) {
                  setState(() {
                    _isInSummer = newValue;
                  });
                }),
                buildSwitchListTile('the Winter trips only',
                    'Show only Winter trips', _isInWinter, (newValue) {
                  setState(() {
                    _isInWinter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'For Fmily', 'Show only family trips', _isForFamily,
                    (newValue) {
                  setState(() {
                    _isForFamily = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}

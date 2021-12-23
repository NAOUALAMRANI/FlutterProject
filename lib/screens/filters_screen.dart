import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key? key}) : super(key: key);

  static const screenRoute = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  initState() {
    _Summer = widget.currentFilters['summer'];
    _Winter = widget.currentFilters['winter'];
    _Family = widget.currentFilters['family'];
    super.initState();
  }

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
              onPressed: () {
                final selectedFilters = {
                  'summer': _Summer,
                  'winter': _Winter,
                  'family': _Family,
                };
                widget.saveFilters(selectedFilters);
              },
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
                buildSwitchListTile(
                    'the Summer trips only', 'Show only summer trips', _Summer,
                    (newValue) {
                  setState(() {
                    _Summer = newValue;
                  });
                }),
                buildSwitchListTile(
                    'the Winter trips only', 'Show only Winter trips', _Winter,
                    (newValue) {
                  setState(() {
                    _Winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'For Fmily', 'Show only family trips', _Family, (newValue) {
                  setState(() {
                    _Family = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}

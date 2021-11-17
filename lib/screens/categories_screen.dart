import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class categoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travels'),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Categories_data.map((CategoryData) =>
            CategoryItem(CategoryData.id, CategoryData.title, CategoryData.imageUrl)).toList(),
      ),
    );
  }
}

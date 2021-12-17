import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

// ignore: camel_case_types
class categoriesScreen extends StatelessWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        // ignore: non_constant_identifier_names
        children: Categories_data.map((CategoryData) =>
            CategoryItem(CategoryData.id, CategoryData.title, CategoryData.imageUrl)).toList(),
      );
    ;
  }
}

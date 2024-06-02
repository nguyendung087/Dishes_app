import 'package:btl_recipes/components/ingredient_item.dart';
import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredient;
  const IngredientList({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      itemCount: ingredient.length,
      itemBuilder: (context, index) {
        int quantity = ingredient[index]['quantity'].toInt() ?? 1;

        return IngredientItem(
          quantity: quantity.toString(),
          image: ingredient[index]['image'] ?? '',
          measure: ingredient[index]['measure'] ?? '',
          food: ingredient[index]['food'] ?? '',
        );
      },
    );
  }
}

import 'package:btl_recipes/components/custom_app_bar.dart';
import 'package:btl_recipes/components/text_field.dart';
import 'package:btl_recipes/pages/all_recipe.dart';
import 'package:btl_recipes/service/search_tag.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Search',
        back: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h * .016, horizontal: w * .032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWidget(),
            SizedBox(
              height: h * .04,
            ),
            Text(
              'Search Tags',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .06),
            ),
            Wrap(
              spacing: 8,
              children: tags.map((label) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllRecipe(recipe: label)));
                    },
                    child: Text(label));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

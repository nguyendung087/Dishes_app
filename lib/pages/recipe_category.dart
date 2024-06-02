import 'package:btl_recipes/pages/all_recipe.dart';
import 'package:btl_recipes/service/category_list.dart';
import 'package:flutter/material.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .02,
            ),
            Text(
              "Đề xuất cho bạn",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .06),
            ),
            SizedBox(
              height: h * .45,
              child: GridView.builder(
                itemCount: categoryImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: h * .01,
                    mainAxisSpacing: w * .021),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AllRecipe(recipe: categories[index])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * .043,
                              width: w * .08,
                              child: Image.asset(categoryImage[index]),
                            ),
                            SizedBox(
                              height: h * .003,
                            ),
                            Text(
                              categories[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h * .02,
            ),
          ],
        ),
      ),
    );
  }
}

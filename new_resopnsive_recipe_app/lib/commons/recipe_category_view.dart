import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/screens/all_recipes.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class RecipeCategoryView extends StatelessWidget {
  final String name, image;

  const RecipeCategoryView({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(() => AllRecipes(recipe: name));
      },
      child: SizedBox(
        height: kHEIGHT * .105,
        width: kWIDTH * .2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: kHEIGHT * .07,
              width: kWIDTH * .15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Label(
                label: name,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

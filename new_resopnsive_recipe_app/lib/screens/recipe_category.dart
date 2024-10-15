import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/constants/image_paths.dart';
import 'package:recipe_app_youtube/screens/all_recipes.dart';
import 'package:recipe_app_youtube/constants/category_list.dart';
import 'package:recipe_app_youtube/commons/recipe_category_view.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kWIDTH * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: kHEIGHT * .06),
              Label(
                label: 'For You',
                fontWeight: FontWeight.bold,
                fontSize: kWIDTH * .06,
              ),
              SizedBox(height: kHEIGHT * .01),
              SizedBox(
                height: kHEIGHT * .106,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeCategoryView(name: names[0], image: images[0]),
                    RecipeCategoryView(name: names[1], image: images[1]),
                    RecipeCategoryView(name: names[2], image: images[2]),
                    RecipeCategoryView(name: names[3], image: images[3]),
                  ],
                ),
              ),
              SizedBox(height: kHEIGHT * .01),
              Label(
                label: 'For You',
                fontWeight: FontWeight.bold,
                fontSize: kWIDTH * .055,
              ),
              SizedBox(
                height: kHEIGHT * .45,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: kHEIGHT * .01,
                    mainAxisSpacing: kWIDTH * .021,
                  ),
                  itemCount: categoryImage.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => AllRecipes(recipe: categories[index]));
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
                                height: kHEIGHT * .050,
                                width: kWIDTH * .09,
                                child: Image.asset(categoryImage[index]),
                              ),
                              SizedBox(height: kHEIGHT * .003),
                              Label(
                                label: categories[index],
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Label(
                label: 'Your Preference',
                fontWeight: FontWeight.bold,
                fontSize: kWIDTH * .055,
              ),
              SizedBox(
                height: kHEIGHT * .13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeCategoryView(name: 'Easy', image: ImagePaths.easy),
                    RecipeCategoryView(name: 'Quick', image: ImagePaths.quick),
                    RecipeCategoryView(name: 'Beef', image: ImagePaths.beef),
                    RecipeCategoryView(name: 'Low Fat', image: ImagePaths.lowFat),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

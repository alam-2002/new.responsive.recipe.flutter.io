import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/commons/custom_app_bar.dart';
import 'package:recipe_app_youtube/commons/text_field_widget.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';
import 'package:recipe_app_youtube/constants/search_tags.dart';
import 'package:recipe_app_youtube/screens/all_recipes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
        back: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kWIDTH * .032,
          vertical: kHEIGHT * .016,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWidget(),
            SizedBox(height: kHEIGHT * .04),
            Label(
              label: 'Search Tags',
              fontWeight: FontWeight.bold,
              fontSize: kWIDTH * .06,
            ),
            Wrap(
              spacing: 8,
              children: tags.map((label) {
                return ElevatedButton(
                  onPressed: () {
                    Get.to(() => AllRecipes(recipe: label));
                  },
                  child: Text(label),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

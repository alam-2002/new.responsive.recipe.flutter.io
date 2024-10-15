import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_youtube/screens/all_recipes.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key});

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return Container(
      height: kHEIGHT * .06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: TextField(
        controller: search,
        style: GoogleFonts.notoSans(
          textStyle: TextStyle(
            fontSize: kWIDTH * .04,
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "what's cooking in your mind...?",
          hintStyle: GoogleFonts.notoSans(
            textStyle: TextStyle(
              fontSize: kWIDTH * .03,
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              Get.to(() => AllRecipes(recipe: search.text));
            },
            icon: Icon(
              Icons.search,
              color: Colors.deepOrangeAccent,
              size: kWIDTH * 0.07,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/tab_bar_widget.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';
import 'package:recipe_app_youtube/constants/image_paths.dart';
import 'package:recipe_app_youtube/screens/1_home/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                SizedBox(height: kHEIGHT * .022),
                Container(
                  height: kHEIGHT * .25,
                  width: kWIDTH,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(ImagePaths.banner),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(child: Label(label: '')),
                ),
                SizedBox(height: kHEIGHT * .023),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(
                      label: 'Categories',
                      fontSize: kWIDTH * .045,
                      fontWeight: FontWeight.bold,
                    ),
                    Label(
                      label: 'See all',
                      fontSize: kWIDTH * .040,
                    ),
                    // SizedBox(height: kHEIGHT*.022,)
                  ],
                ),
                SizedBox(height: kHEIGHT * .022),
                TabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

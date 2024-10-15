import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';
import 'package:recipe_app_youtube/constants/image_paths.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/screens/1_home/home.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: kHEIGHT,
        width: kWIDTH,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: kHEIGHT * .79,
                width: kWIDTH,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePaths.onBoarding),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(ImagePaths.yummy),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: kHEIGHT * .243,
                width: kWIDTH,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: kHEIGHT * .032),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Label(
                          label: 'Lets Cook Tasty Food',
                          fontSize: kWIDTH * .06,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: kHEIGHT * .01),
                        Label(
                          label:
                              'Check out the App and start cooking delicious meals!',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(height: kHEIGHT * .032),
                        SizedBox(
                          width: kWIDTH * .8,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => Home());
                              },
                              child: Label(
                                label: 'Get Started',
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

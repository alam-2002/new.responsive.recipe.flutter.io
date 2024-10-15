import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/commons/constant_function.dart';
import 'package:recipe_app_youtube/commons/custom_app_bar.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';
import 'package:recipe_app_youtube/screens/details_screen.dart';

class AllRecipes extends StatelessWidget {
  final String recipe;

  const AllRecipes({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: recipe,
        back: true,
      ),
      body: FutureBuilder(
        future: ConstantFunction.getResponse(recipe),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(child: Label(label: 'Loading...'));
          }
          return Padding(
            padding: EdgeInsets.only(
              right: kWIDTH * .034,
              left: kWIDTH * .034,
              top: kHEIGHT * .03,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 10,
                childAspectRatio: .6 / 1,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> snap = snapshot.data![index];
                int time = snap['totalTime'].toInt();
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => DetailsScreen(items: snap));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(snap['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(3),
                                  ),
                                ),
                                child: Center(
                                  child: Label(
                                    label: time == 0
                                        ? '10 min'
                                        : "${time.toString()} min",
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, left: 6),
                          child: Label(
                            label: snap['label'],
                            fontWeight: FontWeight.bold,
                            fontSize: kWIDTH * .03,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

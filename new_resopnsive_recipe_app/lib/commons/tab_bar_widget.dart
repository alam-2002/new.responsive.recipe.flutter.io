import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/commons/constant_function.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';
import 'package:recipe_app_youtube/screens/details_screen.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: kHEIGHT * .05,
            child: TabBar(
              unselectedLabelColor: Colors.deepOrangeAccent,
              labelColor: Colors.white,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: kWIDTH * .012),
              tabs: const [
                TabItems(title: 'Breakfast'),
                TabItems(title: 'Lunch'),
                TabItems(title: 'Dinner'),
                TabItems(title: 'Quick'),
              ],
            ),
          ),
          SizedBox(height: kHEIGHT * .02),
          SizedBox(
            height: kHEIGHT * .3,
            child: TabBarView(
              children: const [
                HomeTabBarView(recipe: 'breakfast'),
                HomeTabBarView(recipe: 'lunch'),
                HomeTabBarView(recipe: 'dinner'),
                HomeTabBarView(recipe: 'quick'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabItems extends StatelessWidget {
  final String title;
  const TabItems({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Label(
          label: title,
          fontSize: 12,
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String recipe;
  const HomeTabBarView({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return SizedBox(
      height: kHEIGHT * .28,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: ConstantFunction.getResponse(recipe),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(
              child: Label(label: 'Loading...'),
            );
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> snap = snapshot.data![index];
              int time = snap['totalTime'].toInt();
              int calories = snap['calories'].toInt();
              return Container(
                margin: EdgeInsets.only(right: kWIDTH * .02),
                width: kWIDTH * .5,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => DetailsScreen(items: snap));
                          },
                          child: Container(
                            height: kHEIGHT * .17,
                            width: kWIDTH,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(snap['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: kHEIGHT * .01),
                        Label(
                          label: snap['label'],
                          fontSize: kWIDTH * .035,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: kHEIGHT * .01),
                        Row(
                          children: [
                            Label(
                              label:
                                  'calories-${calories.toString()}, ${time.toString()} min',
                              fontSize: kWIDTH * .03,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
          );
        },
      ),
    );
  }
}

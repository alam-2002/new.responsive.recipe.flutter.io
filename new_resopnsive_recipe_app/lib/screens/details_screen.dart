import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:get/get.dart';
import 'package:recipe_app_youtube/commons/circle_button.dart';
import 'package:recipe_app_youtube/commons/custom_clip_path.dart';
import 'package:recipe_app_youtube/commons/ingredients_list.dart';
import 'package:recipe_app_youtube/commons/share.dart';
import 'package:recipe_app_youtube/commons/show_details_dialog.dart';
import 'package:recipe_app_youtube/commons/show_table_dialog.dart';
import 'package:recipe_app_youtube/commons/start_cooking.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> items;
  const DetailsScreen({
    super.key,
    required this.items,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var myBox = Hive.box('saved');
  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    String time = widget.items['totalTime'].toString();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                    height: kHEIGHT * .44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(widget.items['image']),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: kHEIGHT * .03,
                    left: kWIDTH * .05,
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: BackButton(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kWIDTH * .04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Label(
                      label: widget.items['label'],
                      fontSize: kWIDTH * .05,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 1),
                    Label(label: '$time min'),
                    SizedBox(height: kHEIGHT * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ShareRecipes.share(widget.items['url']);
                          },
                          child: CircleButton(
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: myBox.listenable(),
                          builder: (ctx, box, _) {
                            String key = widget.items['label'];
                            bool saved = myBox.containsKey(key);
                            if (saved) {
                              return GestureDetector(
                                onTap: () {
                                  myBox.delete(key);
                                  Get.snackbar(
                                    'Recipe Deleted',
                                    '',
                                    colorText: Colors.red,
                                    duration: Duration(seconds: 1),
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                child: CircleButton(
                                  icon: Icons.bookmark,
                                  label: 'Saved',
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  myBox.put(key, key);
                                  Get.snackbar('Recipe Saved Successfully', '',
                                      colorText: Colors.green,
                                      duration: Duration(seconds: 1),
                                      snackPosition: SnackPosition.BOTTOM);
                                },
                                child: CircleButton(
                                  icon: Icons.bookmark_border,
                                  label: 'Save',
                                ),
                              );
                            }
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            ShowDetailsDialog.showCalories(
                                widget.items['totalNutrients'], context);
                          },
                          child: CircleButton(
                            icon: Icons.monitor_heart_outlined,
                            label: 'Calories',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ShowTableDialog.showTable(context);
                          },
                          child: CircleButton(
                            icon: Icons.table_chart_outlined,
                            label: 'Unit Chart',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kHEIGHT * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Label(
                          label: 'Direction',
                          fontWeight: FontWeight.bold,
                          fontSize: kWIDTH * .06,
                        ),
                        SizedBox(
                          width: kWIDTH * .34,
                          child: ElevatedButton(
                            onPressed: () {
                              StartCooking.startCooking(widget.items['url']);
                            },
                            child: Label(label: 'Start'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kHEIGHT * .02),
                    Container(
                      height: kHEIGHT * .07,
                      width: kWIDTH,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                color: Colors.redAccent,
                                child: Center(
                                  child: Label(
                                    label: 'Ingredients Required',
                                    fontSize: kWIDTH * .05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Label(
                                  label: ' 6\nItems',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kHEIGHT * .015),
                    SizedBox(
                      height: kHEIGHT * 1.8,
                      child: IngredientsList(
                        ingredients: widget.items['ingredients'],
                      ),
                    ),
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

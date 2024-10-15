import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';
import 'package:recipe_app_youtube/constants/image_paths.dart';
import 'package:get/get.dart';

class IngredientItem extends StatelessWidget {
  final String quantity, measure, food, imageUrl;

  IngredientItem({
    super.key,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.imageUrl,
  });

  var myBox = Hive.box('shopping');

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kWIDTH * .015,
        vertical: kHEIGHT * .01,
      ),
      padding: EdgeInsets.only(
        top: kHEIGHT * .008,
        bottom: kHEIGHT * .008,
        left: kHEIGHT * .008,
        right: kWIDTH * .08,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: kWIDTH * .2,
              height: kHEIGHT * .1,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    ImagePaths.errorImg,
                    fit: BoxFit.cover,
                    height: kHEIGHT * .1,
                    width: kWIDTH * .2,
                    // width: Get.width,
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: kWIDTH * .43,
                child: Label(
                  label: food,
                  fontSize: kWIDTH * .04,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Label(
                label: '$quantity $measure',
                fontSize: kWIDTH * .04,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ],
          ),
          SizedBox(width: kWIDTH * .033),
          ValueListenableBuilder(
            valueListenable: myBox.listenable(),
            builder: (context, box, _) {
              bool exist = box.containsKey(food);
              if (exist) {
                return GestureDetector(
                  onTap: () {
                    myBox.delete(food);
                    Get.snackbar(
                      '',
                      'item deleted',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.red,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: Icon(
                    Icons.done,
                    color: Colors.green,
                    size: kWIDTH * .07,
                  ),
                );
              } else{
                return GestureDetector(
                  onTap: (){
                    String value = '$food $measure $quantity';
                    myBox.put(food, value);
                    Get.snackbar(
                      '',
                      'item added successfully',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.green,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: Icon(
                    // exist ? Icons.done :
                    Icons.add_circle_outline_rounded,
                    size: kWIDTH * .07,
                    color: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

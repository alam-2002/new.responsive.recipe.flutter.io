import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class ShowDetailsDialog {
  static Future showCalories(
    Map<String, dynamic> item,
    BuildContext context,
  ) async {

    int fat = item['FAT']['quantity'].toInt();
    int saturatedFat = item['FASAT']['quantity'].toInt();
    int cholesterol = item['CHOLE']['quantity'].toInt();
    int sodium = item['NA']['quantity'].toInt();
    int carbohydrate = item['CHOCDF.net']['quantity'].toInt();
    int sugar = item['SUGAR']['quantity'].toInt();
    int protein = item['PROCNT']['quantity'].toInt();
    int energy = item['ENERC_KCAL']['quantity'].toInt();
    int fiber = item['FIBTG']['quantity'].toInt();
    int calcium = item['FIBTG']['quantity'].toInt();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Label(
                label: 'Nutritional Fact',
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          content: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Total Fat ', fontSize: 14),
                      Label(label: fat.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Saturated Fat ', fontSize: 14),
                      Label(label: saturatedFat.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Cholesterol ', fontSize: 14),
                      Label(label: cholesterol.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Sodium ', fontSize: 14),
                      Label(label: sodium.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Carbohydrate ', fontSize: 14),
                      Label(label: carbohydrate.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Total Sugar ', fontSize: 14),
                      Label(label: sugar.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Protein ', fontSize: 14),
                      Label(label: protein.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Energy', fontSize: 14),
                      Label(label: energy.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Fiber', fontSize: 14),
                      Label(label: fiber.toString(), fontSize: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(label: 'Calcium', fontSize: 14),
                      Label(label: calcium.toString(), fontSize: 14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

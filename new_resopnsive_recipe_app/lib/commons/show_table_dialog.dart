import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class ShowTableDialog {
  static Future showTable(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        final kWIDTH = MediaQuery.of(context).size.width;
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3),
            // borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Label(
                label: 'Unit Conversion Chart',
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: kWIDTH * .05,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
                  TableRow(
                    children: [
                      BuildTableCell(
                        text1: 'CUP',
                        text2: '(cup)',
                      ),
                      BuildTableCell(
                        text1: 'OUNCE',
                        text2: '(oz)',
                      ),
                      BuildTableCell(
                        text1: 'Table',
                        text2: 'SPOON',
                        text3: '(tbsp)',
                      ),
                      BuildTableCell(
                        text1: 'TEA',
                        text2: 'SPOON',
                        text3: '(tsp)',
                      ),
                      BuildTableCell(
                        text1: 'MILLI',
                        text2: 'LITRE',
                        text3: '(ml)',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildTableCell(
                        text1: 'CUP',
                        text2: '(cup)',
                      ),
                      BuildTableCell(
                        text1: 'OUNCE',
                        text2: '(oz)',
                      ),
                      BuildTableCell(
                        text1: 'Table',
                        text2: 'SPOON',
                        text3: '(tbsp)',
                      ),
                      BuildTableCell(
                        text1: 'TEA',
                        text2: 'SPOON',
                        text3: '(tsp)',
                      ),
                      BuildTableCell(
                        text1: 'MILLI',
                        text2: 'LITRE',
                        text3: '(ml)',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildTableCell(
                        text1: 'CUP',
                        text2: '(cup)',
                      ),
                      BuildTableCell(
                        text1: 'OUNCE',
                        text2: '(oz)',
                      ),
                      BuildTableCell(
                        text1: 'Table',
                        text2: 'SPOON',
                        text3: '(tbsp)',
                      ),
                      BuildTableCell(
                        text1: 'TEA',
                        text2: 'SPOON',
                        text3: '(tsp)',
                      ),
                      BuildTableCell(
                        text1: 'MILLI',
                        text2: 'LITRE',
                        text3: '(ml)',
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Label(
                  label: 'Weight Chart',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: kWIDTH * .05,
                ),
              ),
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
                  TableRow(
                    children: [
                      BuildTableCell(text1: '1000', text2: 'gram'),
                      BuildTableCell(text1: '1', text2: 'kg'),
                      BuildTableCell(text1: '2.2', text2: 'Pound'),
                      BuildTableCell(text1: '35.74', text2: 'Ounce'),
                    ]
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class BuildTableCell extends StatelessWidget {
  final String text1, text2;
  final String? text3;

  const BuildTableCell({
    super.key,
    required this.text1,
    required this.text2,
    this.text3,
  });

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;
    return TableCell(
      child: Container(
        color: Colors.redAccent,
        width: kWIDTH * .4,
        height: kHEIGHT * .1,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Label(label: text1, fontSize: 10, color: Colors.white),
            Label(label: text2, fontSize: 10, color: Colors.white),
            if (text3 != null)
              Label(label: text3.toString(), fontSize: 10, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

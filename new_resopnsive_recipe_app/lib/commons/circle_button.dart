import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CircleButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    final kWIDTH = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CircleAvatar(
          radius: kWIDTH * .06,
          backgroundColor: Colors.redAccent,
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: kHEIGHT*.005),
        Label(label: label),
      ],
    );
  }
}

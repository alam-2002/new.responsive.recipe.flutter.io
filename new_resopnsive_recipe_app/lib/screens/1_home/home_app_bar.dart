import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final kWIDTH = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Label(
          label: 'What are you\ncooking today?',
          fontWeight: FontWeight.bold,
          fontSize: kWIDTH * .07,
          height: 1,
        ),
        Spacer(),
      ],
    );
  }
}

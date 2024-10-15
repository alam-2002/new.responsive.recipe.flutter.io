import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final Color? color;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.back,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final kWIDTH = MediaQuery.of(context).size.width;
    return AppBar(
      title: Label(
        label: title,
        fontWeight: FontWeight.bold,
        fontSize: kWIDTH * .06,
        letterSpacing: 2,
        color: color ?? Colors.white,
      ),
      centerTitle: true,
      backgroundColor: Colors.deepOrangeAccent,
      leading: back == true ? BackButton(color: Colors.white) : BackButton(color: Colors.deepOrangeAccent),
    );
  }
}

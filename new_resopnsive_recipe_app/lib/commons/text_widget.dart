import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  String label;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  double? fontSize;
  double? letterSpacing;
  TextOverflow? overflow;
  int? maxLines;
  final double? height;

  Label({
    super.key,
    required this.label,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.fontSize,
    this.overflow,
    this.height,
    this.maxLines,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.notoSans(
        textStyle: TextStyle(
          height: height,
          overflow: overflow,
          fontSize: fontSize ?? 18,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}

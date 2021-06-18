import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildText extends StatelessWidget {
  const BuildText(
    this.data, {
    Key? key,
    this.color,
    this.fontSize = 12,
    this.fontWeight,
    this.fontFamily,
    this.overflow,
  }) : super(key: key);

  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}

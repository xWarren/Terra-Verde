import 'package:flutter/material.dart';
import '../custom/custom_fading_circle.dart';
class CommonLoading extends StatelessWidget {

  final Color? color;
  final double? size;
  final String? text;
  final TextStyle? textStyle;

  const CommonLoading({
    super.key,
    this.color = Colors.white,
    this.size = 35.0,
    this.text,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
     return Material(
      color: Colors.transparent,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomFadingCircle(
          color: color,
          size: size ?? 35.0,
          ),
          if (text != null) Text(
            text ?? "",
            style: textStyle ?? const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          )
        ],
       ),
     );
  }
}
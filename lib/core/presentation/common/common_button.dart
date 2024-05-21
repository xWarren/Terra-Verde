import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/custom_colors.dart';
import '../../resources/dimensions.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.text,
    this.textStyle,
    this.height,
    this.width,
    this.borderRadius = 10,
    this.fontSize = 16,
    this.fontWeight,
    this.padding,
    this.disabledForegroundColor = Colors.white,
    this.foregroundColor = Colors.white,
    this.backgroundColor = CustomColors.primaryColor,
    this.borderColor,
    this.overlayColor,
    this.hasBorder = false,
    this.child,
    this.onPressed,
    this.errorText,
    this.elevation,
    this.borderWidth = 1.0
  })  : assert(
            (text == null && child != null) || (child == null && text != null));

  final String? text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double borderRadius;
  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final Color disabledForegroundColor;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? overlayColor;
  final bool hasBorder;
  final double borderWidth;
  final Widget? child;
  final VoidCallback? onPressed;
  final String? errorText;
  final double? elevation;

  @override
  Widget build(Object context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: ButtonStyleButton.allOrNull<Color?>(overlayColor),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                RoundedRectangleBorder(
                  side: hasBorder
                      ? BorderSide(
                          color: borderColor ?? foregroundColor,
                          width: borderWidth
                        )
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              elevation: MaterialStateProperty.all(elevation),
              padding: ButtonStyleButton.allOrNull<EdgeInsets>(padding),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return disabledForegroundColor;
                  } else {
                    return foregroundColor;
                  }
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return backgroundColor;
                  } else {
                    return backgroundColor;
                  }
                },
              ),
              textStyle: ButtonStyleButton.allOrNull<TextStyle>(
                textStyle ?? TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            onPressed: onPressed,
            child: child ??
                Text(
                  text!,
                  textAlign: TextAlign.center,
                ),
          ),
        ),
        AnimatedContainer(
          duration: 50.milliseconds,
          height: errorText == null ? 0.0 : 20.0,
          margin: errorText == null ? EdgeInsets.zero : const EdgeInsets.only(top: Dimensions.regularSpacing, left: Dimensions.regularSpacing),
          child: Text(
            errorText ?? "", 
            style: const TextStyle(
              fontSize: 12.0,
              color: CustomColors.red,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}
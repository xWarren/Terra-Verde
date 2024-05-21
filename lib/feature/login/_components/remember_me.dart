import 'package:flutter/material.dart';

import '../../../../core/resources/dimensions.dart';
import '../../../core/resources/custom_colors.dart';

class RememberMe extends StatefulWidget {

  final Function(bool value) isChecked;

  const RememberMe({super.key, required this.isChecked});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rememberMe = !_rememberMe;
        });
        widget.isChecked(_rememberMe);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 30,
              child: Checkbox(
                checkColor: CustomColors.white,
                activeColor: CustomColors.primaryColor,
                value: _rememberMe,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                side: BorderSide(color: Colors.grey.shade500, width: 1.0),
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                  widget.isChecked(_rememberMe);
                },
              ),
            ),
            const SizedBox(width: Dimensions.smallSpacing),
            const Text(
              "Remember Me",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
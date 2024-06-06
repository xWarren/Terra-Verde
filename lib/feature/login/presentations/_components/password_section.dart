import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/resources/strings.dart';

class PasswordSection extends StatefulWidget {
  const PasswordSection({super.key});



  @override
  State<PasswordSection> createState() => PasswordSectionState();
}

class PasswordSectionState extends State<PasswordSection> with AutomaticKeepAliveClientMixin {

  final TextEditingController controller = TextEditingController();

  late String passwordError = "";
  final String errorMessage = "";

  bool isLoading = false;
  bool isFieldFilled = false;

  void passwordErrorMessage(String error) {
    setState(() {
      passwordError = error;
    });
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimensions.extraLargeSpacing),
        const Text(
          Strings.password,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: controller,
          errorText: passwordError,
          maxLines: 1,
          isSecure: true,
          readOnly: isLoading,
          hasShowHideTextIcon: true,
          textInputAction: TextInputAction.done,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              passwordError = "";
            });
          },
          prefixIcon: Image.asset(Assets.icPassword),
          hintText: Strings.password,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        passwordError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: passwordError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            passwordError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
        errorMessage.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: errorMessage.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            errorMessage,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
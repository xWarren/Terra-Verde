import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/resources/strings.dart';

class EmailSection extends StatefulWidget {
  const EmailSection({super.key});

  @override
  State<EmailSection> createState() => EmailSectionState();
}

class EmailSectionState extends State<EmailSection> with AutomaticKeepAliveClientMixin {

  final TextEditingController controller = TextEditingController();

  late String emailError = "";
  final String errorMessage = "";

  bool isLoading = false;
  bool isFieldFilled = false;

  void emailErrorMessage(String error) {
    setState(() {
      emailError = error;
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
        const Text(
          Strings.email,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: controller,
          errorText: emailError,
          maxLines: 1,
          readOnly: isLoading,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              emailError = "";
            });
          },
          prefixIcon: Image.asset(Assets.icEmail),
          hintText: Strings.email,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        emailError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: emailError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            emailError,
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
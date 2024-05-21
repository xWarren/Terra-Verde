import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/presentation/common/common_text_field.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/resources/strings.dart';

class InformationSetup extends StatefulWidget {

  final TextEditingController uniqueCodeController;
  final TextEditingController firstNameController;
  final TextEditingController addressController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String birthday;

  const InformationSetup({
    required this.uniqueCodeController,
    required this.firstNameController,
    required this.lastNameController,
    required this.addressController,
    required this.phoneNumberController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.birthday,
    super.key
  });

  @override
  State<InformationSetup> createState() => _InformationSetupState();
}

class _InformationSetupState extends State<InformationSetup> {

  String birthday = "";

  @override
  void initState() {
    birthday = widget.birthday;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.uniqueCode,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: widget.uniqueCodeController,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          hintText: Strings.uniqueCode,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.regularSpacing),
                  const Text(
                    Strings.firstName,
                    style: TextStyle(
                      color: CustomColors.grey400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  CommonTextField(
                    controller: widget.firstNameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    contentPadding: const EdgeInsets.only(
                      left: Dimensions.largeSpacing,
                      right: Dimensions.largeSpacing,
                    ),
                    hintText: Strings.firstName,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  ), 
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.regularSpacing),
                  const Text(
                    Strings.lastName,
                    style: TextStyle(
                      color: CustomColors.grey400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  CommonTextField(
                    controller: widget.lastNameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    contentPadding: const EdgeInsets.only(
                      left: Dimensions.largeSpacing,
                      right: Dimensions.largeSpacing,
                    ),
                    hintText: Strings.lastName,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  ), 
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.address,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: widget.addressController,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          hintText: Strings.address,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.birthday,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        GestureDetector(
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1901),
              lastDate: DateTime.now()
            );
            if (pickedDate != null) {
              String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
              birthday = formattedDate;
            }
            setState(() {
              birthday;
            });
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: birthday.isEmpty 
                  ?CustomColors.grey100
                  : CustomColors.primaryColor,
                  width: 1
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      birthday.isEmpty 
                      ? "MM/DD/YYYY"    
                      : birthday,
                      style: TextStyle(
                        color: birthday.isEmpty
                        ? CustomColors.grey  
                        : CustomColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    Assets.icDown, 
                    height: 10, 
                    width: 10
                  ),
                )
              ],
            )
          ),
        ),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.email,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: widget.emailController,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          hintText: Strings.email,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.password,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: widget.passwordController,
          maxLines: 1,
          isSecure: true,
          hasShowHideTextIcon: true,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          hintText: Strings.password,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.confirmPassword,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: widget.confirmPasswordController,
          maxLines: 1,
          isSecure: true,
          hasShowHideTextIcon: true,
          textInputAction: TextInputAction.done,
          contentPadding: const EdgeInsets.only(
            left: Dimensions.largeSpacing,
            right: Dimensions.largeSpacing,
          ),
          hintText: Strings.confirmPassword,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
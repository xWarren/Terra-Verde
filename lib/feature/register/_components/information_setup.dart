import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:terra_verde/core/utils/print_utils.dart';

import '../../../core/presentation/common/common_text_field.dart';
import '../../../core/presentation/custom/custom_dropdown.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/resources/strings.dart';
import '../../login/presentations/_components/remember_me.dart';

class InformationSetup extends StatefulWidget {

  final TextEditingController uniqueCodeController;
  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String birthday;

  const InformationSetup({
    required this.uniqueCodeController,
    required this.firstNameController,
    required this.middleNameController,
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
  State<InformationSetup> createState() => InformationSetupState();
}

class InformationSetupState extends State<InformationSetup> with AutomaticKeepAliveClientMixin {

  List<String> genderList = [Strings.male, Strings.female];

  bool hasUniqueCode = false;

  void setUniqueCode(bool value) {
    setState(() {
      hasUniqueCode = value;
    });

  }

  String gender = "";
  
  String uniqueCodeError = "";
  String firstNameError = "";
  String middleNameError = "";
  String lastNameError = "";
  String addressError = "";
  String genderError = "";
  String birthdayError = "";
  String emailError = "";
  String passwordError = "";
  String confirmPasswordError = "";

  bool isFieldFilled = false;


  String birthday = "";

  void uniqueCodeErrorMessage(String error) {
    setState(() {
      uniqueCodeError = error;
    });
  }

  void firstNameErrorMessage(String error) {
    setState(() {
      firstNameError = error;
    });
  }

  void middleNameErrorMessage(String error) {
    setState(() {
      middleNameError = error;
    });
  }

  void lastNameErrorMessage(String error) {
    setState(() {
      lastNameError = error;
    });
  }

  void addressErrorMessage(String error) {
    setState(() {
      addressError = error;
    });
  }

  void genderErrorMessage(String error) {
    setState(() {
      genderError = error;
    });
  }


  void birthdayErrorMessage(String error) {
    setState(() {
      birthdayError = error;
    });
  }

  void emailErrorMessage(String error) {
    setState(() {
      emailError = error;
    });
  }

  void passwordErrorMessage(String error) {
    setState(() {
      passwordError = error;
    });
  }

  void confirmPasswordErrorMessage(String error) {
    setState(() {
      confirmPasswordError = error;
    });
  }

  void clearErrors() {
    setState(() {
      uniqueCodeError = "";
      firstNameError = "";
      middleNameError = "";
      lastNameError = "";
      addressError = "";
      genderError = "";
      birthdayError = "";
      emailError = "";
      passwordError = "";
      confirmPasswordError = "";
    });
  }

  @override
  void initState() {
    birthday = widget.birthday;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasUniqueCode == true
        ? Column(
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
              errorText: uniqueCodeError,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, 
                vertical: 10
              ),
              hintText: Strings.uniqueCode,
              textStyle: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
            ),
            uniqueCodeError.isNotEmpty
            ? AnimatedContainer(
              duration: 100.milliseconds,
              height: uniqueCodeError.isEmpty ? 0 : 30.0,
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                uniqueCodeError,
                style: const TextStyle(
                  color: CustomColors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ) 
            : const SizedBox.shrink(),
          ],
        )
        : const SizedBox.shrink(),
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
          errorText: firstNameError,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              firstNameError = "";
            });
          },
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          hintText: Strings.firstName,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        firstNameError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: firstNameError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            firstNameError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.middleName,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        CommonTextField(
          controller: widget.middleNameController,
          errorText: middleNameError,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              middleNameError = "";
            });
          },
          hintText: Strings.middleName,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        middleNameError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: middleNameError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            middleNameError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
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
          errorText: lastNameError,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              lastNameError = "";
            });
          },
          hintText: Strings.lastName,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        lastNameError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: lastNameError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            lastNameError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
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
          errorText: addressError,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              addressError = "";
            });
          },
          hintText: Strings.address,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        addressError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: addressError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            addressError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
        const SizedBox(height: Dimensions.regularSpacing),
        const Text(
          Strings.gender,
          style: TextStyle(
            color: CustomColors.grey400,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomDropdown<String>(
            errorMessage: genderError, 
            onChange: (String value, int index) {
              setState(() {
                gender = value;
                printUtil(gender);
                genderError = "";
              });
            },
            dropdownStyle: DropdownStyle(
              borderRadius: BorderRadius.circular(5),
              elevation: 1,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
            items: genderList.map((String value) {
              return DropdownItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: CustomColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Text(
                gender.isEmpty ? Strings.gender : gender,
                style: TextStyle(
                  color: gender.isEmpty ? Colors.grey.shade400 : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        genderError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: genderError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            genderError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
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
              birthdayError = "";
              birthday = formattedDate;
            }
            setState(() {
              birthday;
            });
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 45,
            padding: const EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 10
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: birthdayError.isNotEmpty
                  ? CustomColors.red
                  : CustomColors.grey100,
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
            ),
          ),
        ),
        birthdayError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: birthdayError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            birthdayError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
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
          errorText: emailError,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              emailError = "";
            });
          },
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
          errorText: passwordError,
          maxLines: 1,
          isSecure: true,
          hasShowHideTextIcon: true,
          textInputAction: TextInputAction.next,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              passwordError = "";
            });
          },
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
          errorText: confirmPasswordError,
          maxLines: 1,
          isSecure: true,
          hasShowHideTextIcon: true,
          textInputAction: TextInputAction.done,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 10
          ),
          onChanged: (value) {
            setState(() {
              isFieldFilled = value.isNotEmpty;
              confirmPasswordError = "";
            });
          },
          hintText: Strings.confirmPassword,
          textStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        confirmPasswordError.isNotEmpty
        ? AnimatedContainer(
          duration: 100.milliseconds,
          height: confirmPasswordError.isEmpty ? 0 : 30.0,
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            confirmPasswordError,
            style: const TextStyle(
              color: CustomColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ) 
        : const SizedBox.shrink(),
        const SizedBox(height: Dimensions.regularSpacing),
        RememberMe(
          isChecked: setUniqueCode,
          title: "I have unique code",
        )
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
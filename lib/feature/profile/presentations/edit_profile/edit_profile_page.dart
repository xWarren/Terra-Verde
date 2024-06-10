import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile_controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Edit Profile Page")
        ],
      ),
    );
  }
}
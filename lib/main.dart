import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/pages.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Terra Verde',
      theme: ThemeData(
        fontFamily: "Poppins",
        useMaterial3: false,
      ),
      initialRoute: Routes.welcomeRoute,
      getPages: Pages.pages
    );
  }
}

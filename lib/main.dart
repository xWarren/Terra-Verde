import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'di/modules.dart';

void main() async {
  await initAppDependecies();
  runApp(const TerraVerde());
}

class TerraVerde extends StatelessWidget {
  const TerraVerde({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Terra Verde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        useMaterial3: false,
      ),
      initialRoute: Routes.welcomeRoute,
      getPages: Pages.pages
    );
  }
}

import 'package:get/get.dart';

import '../../feature/login/login_binding.dart';
import '../../feature/login/login_page.dart';
import '../../feature/welcome/welcome_binding.dart';
import '../../feature/welcome/welcome_page.dart';
import 'routes.dart';

class Pages {
  
  static final pages = [
    GetPage(
      name: Routes.welcomeRoute,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
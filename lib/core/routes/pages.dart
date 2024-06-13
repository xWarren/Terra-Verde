import 'package:get/get.dart';

import '../../feature/announcement/presentations/announcement_binding.dart';
import '../../feature/announcement/presentations/announcement_page.dart';
import '../../feature/bookmarks/presentations/bookmarks_binding.dart';
import '../../feature/bookmarks/presentations/bookmarks_page.dart';
import '../../feature/dashboard/dashboard_binding.dart';
import '../../feature/dashboard/dashboard_page.dart';
import '../../feature/events/presentations/events_binding.dart';
import '../../feature/events/presentations/events_page.dart';
import '../../feature/login/presentations/login_binding.dart';
import '../../feature/login/presentations/login_page.dart';
import '../../feature/officials/presentations/officials_binding.dart';
import '../../feature/officials/presentations/officials_page.dart';
import '../../feature/profile/presentations/add_family_member/add_family_member_binding.dart';
import '../../feature/profile/presentations/add_family_member/add_family_member_page.dart';
import '../../feature/profile/presentations/edit_head_family/edit_head_family_binding.dart';
import '../../feature/profile/presentations/edit_head_family/edit_head_family_page.dart';
import '../../feature/profile/presentations/edit_profile/edit_profile_binding.dart';
import '../../feature/profile/presentations/edit_profile/edit_profile_page.dart';
import '../../feature/profile/presentations/head_family/head_family_binding.dart';
import '../../feature/profile/presentations/head_family/head_family_page.dart';
import '../../feature/profile/presentations/profile_information/profile_information_binding.dart';
import '../../feature/profile/presentations/profile_information/profile_information_page.dart';
import '../../feature/register/register_binding.dart';
import '../../feature/register/register_page.dart';
import '../../feature/profile/presentations/profile_binding.dart';
import '../../feature/profile/presentations/profile_page.dart';
import '../../feature/splash/splash_binding.dart';
import '../../feature/splash/splash_page.dart';
import '../../feature/welcome/welcome_binding.dart';
import '../../feature/welcome/welcome_page.dart';
import 'routes.dart';

class Pages {
  
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashPage(),
      binding: SplashBinding()
    ),
    GetPage(
      name: Routes.welcomeRoute,
      page: () => const WelcomePage(),
      binding: WelcomeBinding()
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.registerRoute,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.dashboardRoute,
      page: () => const DashboardPage(),
      binding: DashboardBinding()
    ),
    GetPage(
      name: Routes.profileRoute,
      page: () => const ProfilePage(),
      binding: ProfileBinding()
    ),
    GetPage(
      name: Routes.announcementRoute,
      page: () => const AnnouncementPage(),
      binding: AnnouncementBinding()
    ),
    GetPage(
      name: Routes.eventRoute,
      page: () => const EventsPage(),
      binding: EventsBinding()
    ),
    GetPage(
      name: Routes.officialsRoute,
      page: () => const OfficialsPage(),
      binding: OfficialsBinding()
    ),
    GetPage(
      name: Routes.addFamilyMemberRoute,
      page: () => const AddFamilyMemberPage(),
      binding: AddFamilyMemberBinding()
    ),
    GetPage(
      name: Routes.profileInformationRoute,
      page: () => const ProfileInformationPage(),
      binding: ProfileInformationBinding()
    ),
    GetPage(
      name: Routes.editProfileRoute,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding()
    ),
    GetPage(
      name: Routes.bookmarksRoute,
      page: () => const BookmarksPage(),
      binding: BookmarksBinding()
    ),
    GetPage(
      name: Routes.headFamilyRoute,
      page: () => const HeadFamilyPage(),
      binding: HeadFamilyBinding()
    ),
    GetPage(
      name: Routes.editHeadFamilyRoute,
      page: () => const EditHeadFamilyPage(),
      binding: EditHeadFamilyBinding()
    ),
  ];
}
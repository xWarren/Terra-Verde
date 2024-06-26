import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terra_verde/core/utils/extensions/int_extension.dart';

import '../../core/domain/services/storage_service.dart';
import '../../core/utils/enums/tab_type.dart';
import '../home/presentations/home_page.dart';
import '../settings/presentations/settings_page.dart';
import '_util/scroll_listener.dart';

abstract class DashboardDelegate {

  void setPage({required TabType type});
  ScrollController get scrollController;
}

class DashboardController extends GetxController with GetTickerProviderStateMixin, WidgetsBindingObserver implements DashboardDelegate {
  
  DashboardController({
    required this.storageService,
  });
  
  final StorageService storageService;


  late ScrollListener scrollListener;
  TabController? tabController;

  final _scrollController = ScrollController();
  final pageController = PageController();

  RxList<Widget> navigationItems = const [
    HomePage(),
    SettingsPage()
  ].obs;

  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    tabController = TabController(length: navigationItems.length, vsync: this);
    scrollListener = ScrollListener.initialise(_scrollController);
    super.onInit();
  }

  tapNavigation(int value) => setPage(type: value.toTabType());
  
  @override
  void setPage({required TabType type}) {
    tabController?.index = type.index;
    pageIndex.value = type.index;
    pageController.animateToPage(
      type.index, 
      duration: 300.milliseconds, 
      curve: Curves.ease
    );
    scrollListener.reset();
  }

  @override
  ScrollController get scrollController => _scrollController;
}
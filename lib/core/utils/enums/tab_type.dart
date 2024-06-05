enum TabType {
  home,
  settings
}

extension TabTypeExtension on TabType {

  int get index {
    switch (this) {
      case TabType.home:
        return 0;
      case TabType.settings:
        return 1;
      default:
        return 0;
    }
  }
}


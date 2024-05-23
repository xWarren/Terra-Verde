enum TabType {
  home,
  officials,
  settings
}

extension TabTypeExtension on TabType {

  int get index {
    switch (this) {
      case TabType.home:
        return 0;
      case TabType.officials:
        return 1;
      case TabType.settings:
        return 2;
      default:
        return 0;
    }
  }
}


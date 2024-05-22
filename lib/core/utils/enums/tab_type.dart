enum TabType {
  home,
  events,
  officials,
  profile
}

extension TabTypeExtension on TabType {

  int get index {
    switch (this) {
      case TabType.home:
        return 0;
      case TabType.events:
        return 1;
      case TabType.officials:
        return 2;
      case TabType.profile:
        return 3;
      default:
        return 0;
    }
  }
}


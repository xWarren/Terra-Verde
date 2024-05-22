import 'package:flutter/material.dart';

class ScrollListener extends ChangeNotifier {
  double bottom = 0;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller, [double height = 90.0]) {
    controller.addListener(() {
      final current = controller.offset;
      if (current > 0.0) {
        bottom += _last - current;
        if (bottom <= -height) bottom = -height;
        if (bottom >= 0) bottom = 0;
        _last = current;
        if (bottom <= 0 && bottom >= -height) notifyListeners();
      } else {
        reset();
      }
    });
  }

  void reset() {
    bottom = 0.0;
    _last = 0.0;
    notifyListeners();
  }
}
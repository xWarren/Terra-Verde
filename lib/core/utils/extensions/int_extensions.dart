
import '../enums/tab_type.dart';

extension IntExtension on int {


  String formattedTime() {
    
    int sec = this % 60;
    int min = (this / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  TabType toTabType() {
    switch (this) {
      case 0:
        return TabType.home;
      case 1:
        return TabType.officials;
      case 2:
        return TabType.settings;
      default:
        return TabType.home;
    }
  }
}
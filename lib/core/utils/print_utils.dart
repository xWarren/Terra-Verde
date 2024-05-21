import 'dart:developer';

import 'package:flutter/foundation.dart';

void printUtil(Object? message) {
  if (kDebugMode) {
    log(message.toString());
  }
}
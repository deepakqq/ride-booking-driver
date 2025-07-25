import 'package:flutter/foundation.dart';

printf(var s) {
  if (kDebugMode) {
    print(s.toString());
  }
}

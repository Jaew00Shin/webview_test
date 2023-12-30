import 'dart:io';

import 'package:flutter/foundation.dart';

String getDevice() {
  if (kIsWeb) return 'web';
  if (Platform.isIOS) return 'ios';
  if (Platform.isAndroid) return 'android';
  throw Exception();
}

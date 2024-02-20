import 'package:flutter/cupertino.dart';

import '../../responsive.dart';
import '../../uri_check.dart';

class UriHelper {
  static String getUri(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return UriCheck.webUri;
    } else {
      return UriCheck.emulatorUri;
    }
  }
}
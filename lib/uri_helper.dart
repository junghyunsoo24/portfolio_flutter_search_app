import 'package:flutter/cupertino.dart';
import 'package:portfolio_flutter_search_app/responsive.dart';
import 'package:portfolio_flutter_search_app/uri_check.dart';

class UriHelper {
  static String getUri(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return UriCheck.webUri;
    } else {
      return UriCheck.emulatorUri;
    }
  }
}
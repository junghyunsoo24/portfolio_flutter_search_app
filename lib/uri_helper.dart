import 'package:flutter/cupertino.dart';
import 'package:portfolio_flutter_search_app/responsive.dart';
import 'package:portfolio_flutter_search_app/uri_check.dart';

class UriHelper {
  static String getRegisterUri(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return UriCheck.registerWebUri;
    } else {
      return UriCheck.registerEmulatorUri;
    }
  }

  static String getSBertSearchUri(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return UriCheck.searchSBertWebUri;
    } else {
      return UriCheck.searchSBertEmulatorUri;
    }
  }

  static String getCosSearchUri(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return UriCheck.searchCosWebUri;
    } else {
      return UriCheck.searchCosEmulatorUri;
    }
  }
}

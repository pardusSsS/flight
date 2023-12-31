// ignore_for_file: constant_identifier_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppConstant {
  static const API_SERVICE_URL =
      "https://flight-74652-default-rtdb.firebaseio.com";

  static const LOTTIE_BASE = 'assets/lottie/';

  static const CENTER_LAT_LNG = LatLng(39.925533, 32.866287);
}

class RouteConstants {
  static const String HOME = "/home";
  static const String SPLASH = "/splash";
}

class ImageConstants {
  static const FLY_SVG = 'assets/images/svg/fly.svg';
  static const FLY_LOTTIE = "fly";
  static const LEADING_LOTTIE = "leading";
}

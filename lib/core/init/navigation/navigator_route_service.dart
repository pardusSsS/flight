import 'package:flight/core/device/constants.dart';
import 'package:flight/core/init/navigation/not_found.dart';
import 'package:flight/core/init/navigation/transitions/fade_route.dart';
import 'package:flight/google_maps/view/google_maps.dart';
import 'package:flight/splash/splash.dart';
import 'package:flutter/material.dart';

class NavigationRouteManager {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.HOME:
        return _navigateToDefault(GoogleMaps(), settings);
      case RouteConstants.SPLASH:
        return _navigateToFadeDefault(const Splash(), settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const NotFoundNavigationWidget());
    }
  }

  NavigationRouteManager._init();

  static MaterialPageRoute _navigateToDefault(
      Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  static PageRoute _navigateToFadeDefault(Widget page, RouteSettings settings) {
    return FadeRoute(page: page, settings: settings);
  }
}

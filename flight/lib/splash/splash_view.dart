import 'package:flight/core/device/constants.dart';
import 'package:flight/core/init/navigation/navigator_service.dart';
import 'package:flight/splash/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            NavigationService.instance?.navigate(RouteConstants.HOME),
      ),
    );
  }
}

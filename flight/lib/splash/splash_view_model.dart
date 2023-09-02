import 'package:flight/core/device/constants.dart';
import 'package:flight/core/init/navigation/navigator_service.dart';
import 'package:flight/splash/splash.dart';
import 'package:flutter/material.dart';

abstract class SplashViewModel extends State<Splash> {
  Future<void> controlTokenn() async {
    await Future.delayed(const Duration(seconds: 5));
    NavigationService.instance.navigate(RouteConstants.HOME);
  }
}

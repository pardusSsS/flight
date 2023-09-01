import 'package:flight/core/device/theme/theme.dart';
import 'package:flight/core/init/navigation/navigator_route_service.dart';
import 'package:flight/core/init/navigation/navigator_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myTheme,
      initialRoute: "/splash",
      onGenerateRoute: (settings) =>
          NavigationRouteManager.onRouteGenerate(settings),
      navigatorKey: NavigationService.instance!.navigatorKey,
    );
  }
}

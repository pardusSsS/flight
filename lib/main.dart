import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flight/core/device/theme/theme.dart';
import 'package:flight/core/init/navigation/navigator_route_service.dart';
import 'package:flight/core/init/navigation/navigator_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotification();
}

Future<void> initNotification() async {
  FirebaseMessaging firebaseMessaging =
      FirebaseMessaging.instance; // Move the initialization here
  NotificationSettings settings = await firebaseMessaging.requestPermission();
  print("settings: ${settings.authorizationStatus}");
  final fcmToken = await firebaseMessaging.getToken();
  print(fcmToken);
  firebaseMessaging.subscribeToTopic("topics-all");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message}");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myTheme,
      initialRoute: "/splash",
      onGenerateRoute: (settings) =>
          NavigationRouteManager.onRouteGenerate(settings),
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/firebase_options.dart';
import 'package:logitech/router/router.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessageOpenedApp.listen(notificationHandler);
  FirebaseMessaging.instance.getInitialMessage().then(notificationHandler);
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void notificationHandler(event) {
  if (event?.notification != null) {
    navigatorKey.currentContext?.pushNamed(Routes.splash);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Logitech',
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      routerConfig: router,
      theme: logitechAppTheme,
    );
  }
}

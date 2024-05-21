import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lovepet/services/router.dart';
import 'firebase_options.dart';
import 'pages/account_registration_page.dart';
import 'pages/feed_page.dart';
import 'pages/login_page.dart';
import 'pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color temaSemilla = Color.fromARGB(219, 119, 199, 218);
    const Color darkThemeSemilla = Color.fromARGB(250, 100, 75, 181);
    final AnimateRouter router = AnimateRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: temaSemilla),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: darkThemeSemilla),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == null) return router.createRoute("/");
        final $route = settings.name ?? "/";
        return router.createRoute($route);
      },
      title: "LovePet",
      routes: {
        '/': (context) => const WelcomeLovePet(),
        '/login': (context) => const LoginPage(),
        '/registro': (context) => const AccountRegistrationPage(),
        '/main': (context) => const FeedPage(),
      },
      navigatorObservers: [FlutterSmartDialog.observer],
    );
  }
}

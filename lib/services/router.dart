import 'package:flutter/material.dart';
import 'package:lovepet/screens/principals/perfil_mascota.dart';
import 'package:lovepet/screens/registro/home_page.dart';
import 'package:lovepet/pages/not_found.dart';
import 'package:lovepet/pages/welcome_page.dart';
import 'package:lovepet/screens/login_screen.dart';
import 'package:lovepet/screens/principals/main_creen.dart';

import '../screens/principals/perfil.dart';

class AnimateRouter {
  AnimateRouter();
  final Map<String, Widget> _routes = {
    '/': const WelcomeLovePet(),
    '/login': const LoginScreen(),
    '/registro': const AccountRegistrationPage(),
    '/main': const MainScreen(),
    '/profile': const Perfil(),
    '/perfilMascota': const PerfilMascota(),
  };

  Map<String, WidgetBuilder> getRoutesBuilder() {
    return _routes.map(($route, $widget) {
      return MapEntry($route, (BuildContext context) => $widget);
    });
  }

  Map<String, Widget> getAllRoutes() {
    return _routes;
  }

  Widget getRoute(String $route) {
    return _routes[$route] ?? const NotFoundPage();
  }

  Route createRoute(String $route, {bool $fade = true}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => getRoute($route),
      transitionDuration: const Duration(seconds: 1, milliseconds: 30),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 2.5);
        const end = Offset.zero;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return $fade
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : SlideTransition(
                position: offsetAnimation,
                child: child,
              );
      },
    );
  }
}

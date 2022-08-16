import 'package:flutter/material.dart';
import 'package:jxchat/pages/home/home_page.dart';
import 'package:jxchat/pages/login/login_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  "/login" : (_) => const LoginPage(),
  "/home": (_) => const HomePage()
};

var onGenerateRoute = (RouteSettings settings) {
  String name = settings.name ?? '';
  final WidgetBuilder? pageContentBuilder = appRoutes[name];
  final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder!(context));
  return route;
};
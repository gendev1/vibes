import 'package:flutter/material.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    signup: (context) => SignupScreen(),
  };
}

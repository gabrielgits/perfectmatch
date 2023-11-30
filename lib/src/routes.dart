import 'package:flutter/material.dart';

import 'views/home_view.dart';

class Routes {
  static String initialRoute = '/home';

  static Map<String, WidgetBuilder> routes = {
    '/home': (context) => const HomeView(),
  };
}

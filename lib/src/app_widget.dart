import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'constants.dart';
import 'routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  final String title = App.name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}

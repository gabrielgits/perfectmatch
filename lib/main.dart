import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:perfectmatch/controllers/controller_app.dart';
import 'package:perfectmatch/views/home_view.dart';
import 'package:perfectmatch/views/match_view.dart';
import 'package:perfectmatch/views/register_view.dart';
import 'package:perfectmatch/views/response_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'PT')],
      path: 'assets/languages', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (context) => ControllerApp(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = 'PerfectMatch';

  // This widget is the root of your application.
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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeView(),
        '/register': (context) => const RegisterView(),
        '/match': (context) => const MatchView(),
        '/response': (context) => const ResponseView(),
        //home: MyHomePage(),
      },
    );
  }
}

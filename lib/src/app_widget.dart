import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perfectmatch/src/controllers/controller_user.dart';
import 'package:perfectmatch/src/views/home_view.dart';

import 'views/landing_view.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(controllerUserProvider);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: controller.when(
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (error, stackTrace) => LandingView(
          started: () async {
            ref.read(controllerUserProvider.notifier).userAnonymously();
          },
        ),
        data: (user) {
          return HomeView(user: user);
        },
      ),
    );
  }
}

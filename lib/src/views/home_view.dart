import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perfectmatch/src/controllers/controller_user.dart';

import 'landing_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(controllerUserProvider);

    return controller.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => LandingView(
        started: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeWidget()),
          );
        },
      ),
      data: (user) {
        if (user.id == 0) {
          return const HomeWidget();
        }
        return HomeWidget(user: user);
      },
    );
  }
}
